package org.mifos.bi;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

class DataDump extends ReportTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	void testDataDumpReport() {
		def pdiHome = '/home/adamm/dist/pentaho-data-integration-4.1.0-stable'
		//def pdiHome = '/home/adamm/dist/pentaho-data-integration'
		def transform = '/home/adamm/Documents/Grameen/Code/Pentaho/MIFOSBI-144/test.ktr'
		def cmdWithArgs = """./run_in_dir.sh ${pdiHome} ./pan.sh -file=${transform}"""
		//assertTrue("Stopping on purpose.", false) // DEBUG: stop execution
		def proc = cmdWithArgs.execute()
		proc.waitFor()
		println "return code: ${proc.exitValue()}"
		println "stderr: ${proc.err.text}"
		println "stdout: ${proc.in.text}"
		assertEquals("Error(s) executing PDI.", 0, proc.exitValue())
		def expectedOutputFile = '/tmp/expect.csv'
		def actualOutputFile = '/tmp/out.csv'
	}
}
