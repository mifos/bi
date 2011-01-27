package org.mifos.bi.test

import org.junit.Test

class MPESALoanDisbursalsExportTest {

    def reportPath = 'reports/mpesa/prpts/MPESALoanDisbursalsExport.prpt'
    def reportHeader = ['Amount', 'CreditIdentityString', 'CreditIdentityStringType', 'ValidationIdentityString', 'ValidationIdentityStringType']

    @Test
    void testParams_ALL_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1','extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
            t.assertRowEquals(2, ['3000.0000', '254321654987', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

    @Test
    void testParams_groupdw12_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '5','extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
            t.assertRowEquals(2, ['3000.0000', '254321654987', '[Phone Details][Mobile Phone Number]', '[Security Information][National Identity Number]'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

    @Test
    void testParams_groupdw11_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '2','extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Total number of rows
            t.assertAllRowsNumber(1)
        }
    }

    @Test
    void testParams_ALL_20100724() {
        new PrptReport().execute () { t ->
            
            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'extract_date': '2010-07-24']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Total number of rows
            t.assertAllRowsNumber(1)
        }
    }

     @Test
    void testParams_groupdw13_20100724() {
        new PrptReport().execute () { t ->
            
            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '8', 'extract_date': '2010-07-24']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Total number of rows
            t.assertAllRowsNumber(1)
        }
    }

    @Test
    void testParams_ALL_20100727() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'extract_date': '2010-07-27']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Total number of rows
            t.assertAllRowsNumber(1)
        }
    }

}

