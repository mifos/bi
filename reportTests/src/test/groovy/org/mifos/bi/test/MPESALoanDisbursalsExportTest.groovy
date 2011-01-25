package org.mifos.bi.test

import org.junit.Test

class MPESALoanDisbursalsExportTest {

    def reportPath = 'reports/mpesa/prpts/MPESALoanDisbursalsExport.prpt'
    def reportHeader = ['Amount', 'CreditIdentityString', 'CreditIdentityStringType', 'ValidationIdentityString', 'ValidationIdentityStringType']

    @Test
    void testParams_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
            t.assertRowEquals(2, ['6000.0000'])
            t.assertRowEquals(3, ['3000.0000'])
            t.assertRowEquals(4, ['6000.0000'])

            // Total number of rows
            t.assertAllRowsNumber(4)
        }
    }

    @Test
    void testParams_20100724() {
        new PrptReport().execute () { t ->
            
            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['extract_date': '2010-07-24']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Details
            t.assertRowEquals(2, ['6000.0000'])

            // Total number of rows
            t.assertAllRowsNumber(2)
        }
    }

    @Test
    void testParams_20100727() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['extract_date': '2010-07-27']

            // Report header
            t.assertRowEquals(1, reportHeader)

            // Total number of rows
            t.assertAllRowsNumber(1)
        }
    }

}

