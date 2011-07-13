package org.mifos.bi.test

import org.junit.Test

class LoanOfficerPerformanceSummaryDuringPeriodTest {

    def MFIName = 'Mifos HO'

    def reportName = 'Loan Officer Performance Summary (During Period)'

    def detailsHeader = ['Name', 'Date Joined', 'Total Groups Formed', 'Total Loans Disbursed', 'Total amt of Loans Disbursed',
            'Total amt of Loans Repaid', 'Total # new Savings Accounts', 'Total Clients Recruited', 'Total amt Savings Deposits',
            'Total amt Savings Withdrawals', '# of Dropouts']

    def pageFooter = ['Version 1.3', 'Page', '1 / 1']

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummaryDuringPeriod.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            def branch = ['Office:', 'br2']
            def detailsDuringPeriod = ['br2 LO xxx', '2010-07-20', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']
            def totalDuringPeriod = ['Total During Period', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']

            // MFI Name
            t.assertRowEquals(1, [MFIName])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertCellEquals(3, 1, 'Office:')
            t.assertCellEquals(3, 2, 'br2')
            t.assertCellEquals(3, 3, 'From:')
            t.assertCellEquals(3, 4, 'To:')

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, detailsHeader)
            // Details
            t.assertRowEquals(offset+2, detailsDuringPeriod)
            t.assertRowEquals(offset+3, totalDuringPeriod)

            // Page footer
            offset = 8
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_BO1_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummaryDuringPeriod.prpt'
            t.reportParams = ['selected_office': '1.1.3.2.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            def branch = ['Office:', 'BO 1']
            def detailsDuringPeriod1 = ['br1 lo 1 smith', '2010-07-01', '21', '3', '12000.0000', '3252.9000', '16', '24', '391.0000', '341.0000', '0']
            def detailsDuringPeriod2 = ['br1 lo 2 xxx', '2010-07-04', '4', '0', '0.0000', '0.0000', '6', '2', '756.0000', '0.0000', '0']
            def detailsDuringPeriod3 = ['br1 lo3 Sturt.. ..', '2010-07-29', '1', '0', '0.0000', '0.0000', '0', '0', '0.0000', '0.0000', '0']
            def totalDuringPeriod = ['Total During Period', '26', '3', '12000.0000', '3252.9000', '22', '26', '1147.0000', '341.0000', '0']

            // MFI Name
            t.assertRowEquals(1, [MFIName])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertCellEquals(3, 1, 'Office:')
            t.assertCellEquals(3, 2, 'BO 1')
            t.assertCellEquals(3, 3, 'From:')
            t.assertCellEquals(3, 4, 'To:')


            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, detailsHeader)
            // Details
            t.assertRowEquals(offset+2, detailsDuringPeriod1)
            t.assertRowEquals(offset+3, detailsDuringPeriod2)
            t.assertRowEquals(offset+4, detailsDuringPeriod3)
            t.assertRowEquals(offset+5, totalDuringPeriod)

            // Page footer
            offset = 10
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
