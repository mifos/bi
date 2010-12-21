package org.mifos.bi

import static org.junit.Assert.*

/**
 * Helpful for writing tests against Pentaho reports in prpt format.
 */
class PrptReport {
    String transformPath
    String reportPath

    /** The transform must be generated so we can pass in stuff like report
     * path, output location, and report params. */
    def prepareTransform(reportPath, outputLocation) {
        def ktr = getClass().getResourceAsStream("/test.ktr").text
    }

    def resolveReportPath(cfg) {
        def reportFile = null
        if (cfg.getCfg('baseDir')) {
            reportFile = new File(new File(cfg.getCfg('baseDir')), reportPath)
        } else {
            reportFile = new File(transformPath)
        }
        return reportFile.getPath()
    }

    /** if baseDir is set in your config, reportFilename is relative to baseDir
     otherwise, reportFilename is assumed to be the full (relative or absolute) path */
    def execute(prepClosure) {
        prepClosure.call(this) // set up file paths, asserts, report params, etc.
        def cfg = new ReportTestConfig()
        def resolvedReportPath = resolveReportPath(cfg)
        // TODO: clean up temp file (unless errors?)
        File tempFile = File.createTempFile('presto', null)
        prepareTransform(resolvedReportPath, tempFile)
        def pdiPath = cfg.getCfg('pdiPath')
        if (pdiPath == '') {
            throw new RuntimeException("pdiPath must be set in ${cfg.getCfgFilePath()}")
        }

        def args = "-file=${transformPath}"
        def cmdWithArgs = ''

        if (System.properties['os.name'] =~ '^Windows') {
            println "WARNING: invoking experimental pan.sh invocation. Creating run_in_dir.bat might be necessary instead to work around PDI-5076."
            cmdWithArgs = "${pdiPath}/pan.sh ${args}}"
        } else {
            cmdWithArgs = "./run_in_dir.sh ${pdiPath} ./pan.sh ${args}"
        }

        println "executing: ${cmdWithArgs}"
        def proc = cmdWithArgs.execute()
        proc.waitFor()
        println "return code: ${proc.exitValue()}"
        println "stderr: ${proc.err.text}"
        println "stdout: ${proc.in.text}"
        if (proc.exitValue() != 0) {
            throw new RuntimeException("Error(s) executing PDI.")
        }

        performAsserts()
    }

    def tests = [
        'cell': [:],
        'row': [:],
    ]

    def assertRowEquals(row, expected) {
        tests['row'][row] = expected;
    }

    def assertCellEquals(row, col, expected) {
        if (!tests['cell'][row]) {
            tests['cell'][row] = [:]
        }
        tests['cell'][row][col] = expected
    }

    def performAsserts() {
        new File('/tmp/out.csv').eachLine { line, lineno ->
            // poor-man's CSV parsing
            def cols = line.tokenize(',')
            // cell-based tests
            if (tests['cell'][lineno]) {
                (0..cols.size()).each { i ->
                    def expected = tests['cell'][lineno][i + 1]
                    if (expected) {
                        assertEquals(expected, cols[i])
                    }
                }
            }
            // row-based tests
            if (tests['row'][lineno]) {
                def expected = tests['row'][lineno]
                assertEquals(expected, cols)
            }
        }
    }
}
