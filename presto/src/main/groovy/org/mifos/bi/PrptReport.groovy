package org.mifos.bi

import static org.junit.Assert.*

/**
 * Helpful for writing tests against Pentaho reports in prpt format.
 */
class PrptReport {
    /** if baseDir is set in your config, reportFilename is relative to baseDir
     otherwise, reportFilename is assumed to be the full (relative or absolute) path */
    def execute(transformPath='presto/src/test/resources/test.ktr', reportPath, testsClosure) {
        def util = new ReportTestConfig()
        def transformFile = null
        if (util.getCfg('baseDir')) {
            transformFile = new File(new File(util.getCfg('baseDir')), transformPath)
        } else {
            transformFile = new File(transformPath)
        }
        def resolvedTransformPath = transformFile.getPath()
        def pdiPath = util.getCfg('pdiPath')
        if (pdiPath == '') {
            throw new RuntimeException("pdiPath must be set in ${getCfgFilePath()}")
        }
        // TODO: start using reportPath parameter
        // FIXME: -param:OUTPUT=... doesn't seem to be working or I'm not using it correctly
        def args = "-file=${resolvedTransformPath} -param:OUTPUT=/tmp/test4.csv"
        def cmdWithArgs = ""

        if (System.properties['os.name'] =~ '^Windows') {
            println "WARNING: invoking experimental pan.sh invocation. run_in_dir.bat might be necessary instead to work around PDI-5076."
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

        testsClosure.call(this) // set up asserts
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
