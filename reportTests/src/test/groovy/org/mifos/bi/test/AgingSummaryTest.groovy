package org.mifos.bi.test

import org.junit.Test

class AgingSummaryTest {

    def reportPath = 'reports/standardReports/prpts/AgingSummary.prpt'
    def reportName = 'Aging Summary';

    def detailsHeader1 = ['AGING ANALYSIS']

    def arrearsAmount = ['Arrears Amount', '0.0000']
    def par_all = ['PAR', '2924.9000']
    def par_none = ['PAR', '0.0000']
    def parRatio = ['PAR Ratio', '0']

    def detailsHeader2_3a = ['AGING TABLE']
    def detailsHeader2_3b = ['AGING TABLE', '# of Loans', 'Loan Amount', 'Principal in Arrears', 'Interest in Arrears', 'Principal Outstanding', 'Interest Outstanding', 'Balance Outstanding']

    def weeksInArrears1 = ['1 Week in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears2 = ['2 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears3 = ['3 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears4 = ['4 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears5 = ['5 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears6 = ['6 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears7 = ['7 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears8 = ['8 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears9 = ['9 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears10 = ['10 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears11 = ['11 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears12 = ['12 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def weeksInArrears12p = ['> 12 Weeks in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def arrearsTotal = ['Total', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']

    def daysInArrears1 = ['1 to 30 Days in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def daysInArrears2 = ['31 to 60 Days in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def daysInArrears3 = ['61 to 90 Days in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def daysInArrears4 = ['91 to 180 Days in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def daysInArrears5 = ['> 180 Days in Arrears', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_All() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1']

            // MFI name
            t.assertRowEquals(1, ['Mifos HO'])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['Office:', 'ALL'])

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, detailsHeader1)
            // Details
            t.assertRowEquals(offset+1, arrearsAmount)
            t.assertRowEquals(offset+2, par_all)
            t.assertRowEquals(offset+3, parRatio)

            // 2nd Details header
            offset = 8
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal)

            // 3rd Details header
            offset = 24
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, daysInArrears1)
            t.assertRowEquals(offset+3, daysInArrears2)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal)

            // Page footer
            offset = 32
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_MifosHO() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.']

            // MFI name
            t.assertRowEquals(1, ['Mifos HO'])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['Office:', 'Mifos HO'])

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, detailsHeader1)
            // Details
            t.assertRowEquals(offset+1, arrearsAmount)
            t.assertRowEquals(offset+2, par_all)
            t.assertRowEquals(offset+3, parRatio)

            // 2nd Details header
            offset = 8
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal)

            // 3rd Details header
            offset = 24
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, daysInArrears1)
            t.assertRowEquals(offset+3, daysInArrears2)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal)

            // Page footer
            offset = 32
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.']

            // MFI name
            t.assertRowEquals(1, ['Mifos HO'])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['Office:', 'br2'])

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, detailsHeader1)
            // Details
            t.assertRowEquals(offset+1, arrearsAmount)
            t.assertRowEquals(offset+2, par_all)
            t.assertRowEquals(offset+3, parRatio)

            // 2nd Details header
            offset = 8
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal)

            // 3rd Details header
            offset = 24
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, daysInArrears1)
            t.assertRowEquals(offset+3, daysInArrears2)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal)

            // Page footer
            offset = 32
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br4() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.2.']

            // MFI name
            t.assertRowEquals(1, ['Mifos HO'])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['Office:', 'br4'])

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, detailsHeader1)
            // Details
            t.assertRowEquals(offset+1, arrearsAmount)
            t.assertRowEquals(offset+2, par_none)
            t.assertRowEquals(offset+3, parRatio)

            // 2nd Details header
            offset = 8
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal)

            // 3rd Details header
            offset = 24
            t.assertRowEquals(offset, detailsHeader2_3a)
            t.assertRowEquals(offset+1, detailsHeader2_3b)
            // Details
            t.assertRowEquals(offset+2, daysInArrears1)
            t.assertRowEquals(offset+3, daysInArrears2)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal)

            // Page footer
            offset = 32
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
