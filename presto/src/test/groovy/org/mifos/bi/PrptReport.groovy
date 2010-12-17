package org.mifos.bi

import org.junit.Test

class PrptReport
{
	// dir with reports
	def baseDir = getCfg('baseDir')
	
	def getCfgFilePath() {
		def home = new File(System.properties['user.home'])
		return new File(home, '.presto').getPath()
	}

	// get configured value
	def getCfg(key, fallback="") {
		def props = new Properties()
		new File(getCfgFilePath()).withInputStream { props.load(it) }
		def config = new ConfigSlurper().parse(props)
		return config.get(key, fallback)
	}
	
	// if baseDir is set in your config, reportFilename is relative to baseDir
	// otherwise, reportFilename is assumed to be the full (relative or absolute) path
	def execute(reportPath) {
		def reportFile = null
		if (getCfg('baseDir')) {
			reportFile = new File(new File(getCfg('baseDir')), reportPath)
		} else {
			reportFile = new File(reportPath)
		}
		def resolvedReportPath = reportFile.getPath()
		def pdiPath = getCfg('pdiPath')
		if (pdiPath == '') {
			throw new RuntimeException("pdiPath must be set in ${getCfgFilePath()}")
		}
		def cmdWithArgs = """./run_in_dir.sh ${pdiPath} ./pan.sh -file=${resolvedReportPath}"""
		//assertTrue("Stopping on purpose.", false) // DEBUG: stop execution
		def proc = cmdWithArgs.execute()
		proc.waitFor()
		println "return code: ${proc.exitValue()}"
		println "stderr: ${proc.err.text}"
		println "stdout: ${proc.in.text}"
		if (proc.exitValue() != 0) {
			throw new RuntimeException("Error(s) executing PDI.")
		}
		//def actualOutputFile = '/tmp/out.csv'
	}
}
