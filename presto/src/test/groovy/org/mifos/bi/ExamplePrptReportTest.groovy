package org.mifos.bi;

import static org.junit.Assert.*
import org.junit.Test

class ExamplePrptReportTest {
	@Test
	void testDataDumpReport() {
		new PrptReport().execute (reportPath:'src/test/resources/Simple.prpt') { t ->
			t.assertCellEquals(1, 1, "Customer ID")
			t.assertRowEquals(2, ['1'])
		}
        assertTrue(true)
	}
}
