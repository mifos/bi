package org.mifos.bi.test

import java.io.File;

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

    def getItemsXml(reportPath, outputLocation, reportParams) {
        def items = new StringBuilder("")
        // TODO: test on Windows
        items.append(getItemXml(StringEscapeUtils.escapeHtml(reportPath)))
        items.append(getItemXml(StringEscapeUtils.escapeHtml(outputLocation)))
        reportParams.each { key, value ->
            items.append(getItemXml(StringEscapeUtils.escapeHtml(value)))
        }
        return items.toString()
    }

    def getParamFieldXml(content) {
        return """<field><name>${content}</name><type>String</type>
        <format/><currency/><decimal/><group/><length>-1</length><precision>-1</precision>
      </field>"""
    }

    def getParamFieldsXml(reportParams) {
        def paramFields = new StringBuilder("")
        reportParams.each { key, value ->
            paramFields.append(getParamFieldXml(StringEscapeUtils.escapeHtml(key)))
        }
        return paramFields.toString()
    }

    def getParamXml(content) {
        return "<parameter><name>${content}</name><field>${content}</field></parameter>"
    }

    def getParamsXml(reportParams) {
        def params = new StringBuilder("")
        reportParams.each { key, value ->
            params.append(getParamXml(StringEscapeUtils.escapeHtml(key)))
        }
        return params
    }

    /** The transform must be generated so we can pass in stuff like report
     * path, output location, and report params. */
    def prepareTransform(transformFile, reportPath, reportParams=[:], outputLocation) {
        def ktr = getClass().getResourceAsStream("/test.ktr").text
        def engine = new groovy.text.SimpleTemplateEngine()
        def binding = [
            items: getItemsXml(reportPath, outputLocation, reportParams),
            paramFields: getParamFieldsXml(reportParams),
            params: getParamsXml(reportParams),
        ]
        def template = engine.createTemplate(ktr).make(binding)
        def tOut = new FileWriter(transformFile)
        tOut.write(template.toString())
        println "transform is ${transformFile.path}, output is ${outputLocation}"
        tOut.close()
    }

    def prepareBootstrap(bootstrapFile) {
        def bashScript = getClass().getResourceAsStream("/run_in_dir.sh").text
        def bOut = new FileWriter(bootstrapFile)
        bOut.write(bashScript.toString())
        println "PDI-5076 workaround hack is ${bootstrapFile.path}"
        bOut.close()
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
        if (! reportFile.exists()) {
            throw new RuntimeException("${reportPath} does not exist.")
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
        prepareTransform(transform, resolvedReportPath, reportParams, output.path)
        def pdiPath = cfg.getCfg('pdiPath')
        if (pdiPath == '') {
            throw new RuntimeException("pdiPath must be set in ${cfg.cfgFilePath}")
        }

        def args = "-file=${transform.path}"
        def cmdWithArgs = ''

        File bootstrap = null
        if (System.properties['os.name'] =~ '^Windows') {
            println "WARNING: invoking experimental pan.sh invocation. Creating run_in_dir.bat might be necessary instead to work around PDI-5076."
            cmdWithArgs = "${pdiPath}/pan.sh ${args}}"
        } else {
            bootstrap = File.createTempFile('run_in_dir', '.sh')
            prepareBootstrap(bootstrap)
            "chmod 755 ${bootstrap.path}".execute().waitFor()
            cmdWithArgs = "${bootstrap.path} ${pdiPath} ./pan.sh ${args}"
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
        if (bootstrap != null) {
            bootstrap.delete()
        }
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
