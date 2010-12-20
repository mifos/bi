package org.mifos.bi

import static org.junit.Assert.*

/**
 * Helpful for writing tests against Pentaho reports in prpt format.
 */
class PrptReport {
    // if baseDir is set in your config, reportFilename is relative to baseDir
    // otherwise, reportFilename is assumed to be the full (relative or absolute) path
    def execute(transformPath='presto/src/test/resources/test.ktr', reportPath, tests) {
        def util = new ReportTestUtil()
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

        tests.call(this) // set up asserts
        performAsserts()
    }

    /** one allowed per row */
    def assertRowEquals(row, expected) {
        println "in assertRowEquals"
        // TODO: store test
    }

    def assertCellEquals(row, col, expected) {
        println "in assertCellEquals"
        // TODO: store test
    }

    def tests = [
        ['cell': [1: 'Customer ID']],
        ['row': ['1']],
    ]

    def performAsserts() {
        new File('/tmp/out.csv').eachLine { line, lineno ->
            // poor-man's CSV parsing
            def cols = line.tokenize(',')
            def testsForThisLine = tests[lineno - 1]
            if (testsForThisLine) {
                // cell-based tests
                if (testsForThisLine['cell']) {
                    testsForThisLine['cell'].each { cell, expected ->
                        assertEquals(expected, cols[cell - 1])
                    }
                }
                // row-based tests
                if (testsForThisLine['row']) {
                    def expected = testsForThisLine['row']
                    assertEquals(expected, cols)
                }
            }
        }
    }
}
