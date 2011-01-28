package org.mifos.bi.test

import org.junit.Test

class MPESALoanDisbursalsExportTest {

    def reportPath = 'reports/mpesa/prpts/MPESALoanDisbursalsExport.prpt'
    def reportHeader = ['Amount', 'CreditIdentityString', 'CreditIdentityStringType', 'ValidationIdentityString', 'ValidationIdentityStringType']

    @Test
    void testParams_All_All_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '0', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
			t.assertRowEquals(2, ['6000.0000', '254111222333', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])
            t.assertRowEquals(3, ['3000.0000', '254321654987', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(3)
        }
    }

    @Test
    void testParams_groupdw12_All_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '5','l_product': '0', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
            t.assertRowEquals(2, ['3000.0000', '254321654987', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

    @Test
    void testParams_groupdw11_All_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '2', 'l_product': '0', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)
			t.assertRowEquals(2, ['6000.0000', '254111222333', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

    @Test
    void testParams_All_loanprod1_20100708() {
        new PrptReport().execute () { t ->
            
            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '1', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

			// Details:
			t.assertRowEquals(2, ['3000.0000', '254321654987', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

	@Test
    void testParams_groupdw12_loanprod1_20100708() {
        new PrptReport().execute () { t ->
            
            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '5', 'l_product': '1', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

			// Details:
			t.assertRowEquals(2, ['3000.0000', '254321654987', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

	@Test
    void testParams_All_All_20100728() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '0', 'extract_date': '2010-07-28']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
			t.assertRowEquals(2, ['5000.0000', '254444555666', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

	@Test
    void testParams_ALL_All_20100724() {
        new PrptReport().execute () { t ->
            
            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '0', 'extract_date': '2010-07-24']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Total number of rows
            t.assertAllRowsNumber(1)
        }
    }

}

