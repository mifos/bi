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
            t.assertRowEquals(2, ['6000.0000', 'ERROR'])
            t.assertRowEquals(3, ['3000.0000', '254321654987'])
            t.assertRowEquals(4, ['6000.0000', 'ERROR'])

            // Total number of rows
            t.assertAllRowsNumber(4)
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
            t.assertRowEquals(2, ['3000.0000', '254321654987'])
            t.assertRowEquals(3, ['6000.0000', 'ERROR'])

            // Total number of rows
            t.assertAllRowsNumber(3)
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

            // Details
            t.assertRowEquals(2, ['6000.0000', 'ERROR'])

            // Total number of rows
            t.assertAllRowsNumber(2)
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

            // Details
            t.assertRowEquals(2, ['6000.0000', 'ERROR'])

            // Total number of rows
            t.assertAllRowsNumber(2)
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

