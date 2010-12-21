package org.mifos.bi


import java.io.FileOutputStream;

import org.apache.commons.lang.StringEscapeUtils

import static org.junit.Assert.*

/**
 * Helpful for writing tests against Pentaho reports in prpt format.
 */
class PrptReport {
    String reportPath
    Map<String, String> reportParams

    def getItemXml(content) {
        return "<item>${content}</item>"
    }

    def getItemsXml(reportPath, outputLocation) {
        def items = new StringBuilder()
        // TODO: test on Windows
        items.append(getItemXml(StringEscapeUtils.escapeHtml(reportPath)))
        items.append(getItemXml(StringEscapeUtils.escapeHtml(outputLocation)))
        return items.toString()
    }

    def getParamsXml(reportParams) {
        if (reportParams != [:]) {
            println "reports with params not yet supported"
        }
    }

    /** The transform must be generated so we can pass in stuff like report
     * path, output location, and report params. */
    def prepareTransform(transformFile, reportPath, reportParams=[:], outputLocation) {
        def ktr = getClass().getResourceAsStream("/test.ktr").text
        def engine = new groovy.text.SimpleTemplateEngine()
        // TODO: add params for reports that take them
        def binding = [
            items: getItemsXml(reportPath, outputLocation),
            params: getParamsXml(reportParams)
        ]
        def template = engine.createTemplate(ktr).make(binding)
        def tOut = new FileWriter(transformFile)
        tOut.write(template.toString())
        println "transform is ${transformFile.path}, output is ${outputLocation}"
        tOut.close()
    }

    def resolveReportPath(cfg) {
        def reportFile = null
        if (cfg.getCfg('baseDir')) {
            // relative path given
            reportFile = new File(new File(cfg.getCfg('baseDir')), reportPath)
        } else {
            // assume absolute path given
            reportFile = new File(reportPath)
        }
        return reportFile.getPath()
    }

    /** if baseDir is set in your config, reportFilename is relative to baseDir
     otherwise, reportFilename is assumed to be the full (relative or absolute) path */
    def execute(prepClosure) {
        prepClosure.call(this) // set up file paths, asserts, report params, etc.
        def cfg = new ReportTestConfig()
        def resolvedReportPath = resolveReportPath(cfg)
        File output = File.createTempFile('presto', '.csv')
        File transform = File.createTempFile('presto', '.ktr')
        prepareTransform(transform, resolvedReportPath, [:], output.path)
        def pdiPath = cfg.getCfg('pdiPath')
        if (pdiPath == '') {
            throw new RuntimeException("pdiPath must be set in ${cfg.cfgFilePath}")
        }

        def args = "-file=${transform.path}"
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

        performAsserts(output.path)

        // Clean up. Will only happen if all asserts passed. This is a Good
        // Thing, if an assert failed we can inspect the temp files.
        output.delete()
        transform.delete()
    }

    def tests = [
        'cell': [:],
        'row': [:],
    ]

    def assertRowEquals(row, expected) {
        if (tests['row'][row]) {
            throw new RuntimeException("extant test for row ${row} (expecting '${tests['row'][row]}')")
        }
        tests['row'][row] = expected;
    }

    def assertCellEquals(row, col, expected) {
        if (!tests['cell'][row]) {
            tests['cell'][row] = [:]
        }
        if (tests['cell'][row][col]) {
            throw new RuntimeException("extant test for row ${row}, col ${col} (expecting '${tests['cell'][row][col]}')")
        }
        tests['cell'][row][col] = expected
    }

    def performAsserts(outputLocation) {
        new File(outputLocation).eachLine { line, lineno ->
            // poor-man's CSV parsing
            def cols = line.tokenize(',')
            // cell-based tests
            if (tests['cell'][lineno]) {
                (0..cols.size()).each { i ->
                    def expected = tests['cell'][lineno][i + 1]
                    if (expected) {
                        assertEquals("cell test for (${lineno}, ${i + 1}) failed.", expected, cols[i])
                    }
                    tests['cell'][lineno].remove(i + 1)
                }
                tests['cell'].remove(lineno)
            }
            // row-based tests
            if (tests['row'][lineno]) {
                def expected = tests['row'][lineno]
                assertEquals("test for row ${lineno} failed.", expected, cols)
                tests['row'].remove(lineno)
            }
        }
        assertEquals("output exhausted but not all tests were executed!", ['cell': [:], 'row': [:]], tests)
    }
}
