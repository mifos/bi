package org.mifos.bi

// TODO: rename to ReportTestConfig
class ReportTestUtil {
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
}
