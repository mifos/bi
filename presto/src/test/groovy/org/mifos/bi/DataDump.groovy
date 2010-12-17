package org.mifos.bi;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

class DataDumpTest {

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
		def prpt = new PrptReport()
		def result = prpt.execute('presto/src/test/resources/test.ktr')
	}
}
