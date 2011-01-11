package org.mifos.bi.test;

import org.junit.Test

class LoanOfficerPerformanceSummaryTest {

    def reportName = 'Loan Officer Performance Summary'
    def branch = ['Branch:', 'br2']
    def duringPeriod = ['During Period']
    def detailsHeader = ['Name', 'Date Joined', 'Total Groups Formed', 'Total Loans Disbursed', 'Total amt of Loans Disbursed',
            'Total amt of Loans Repaid', 'Total # new Savings Accounts', 'Total Clients Recruited', 'Total amt Savings Deposits',
            'Total amt Savings Withdrawals', '# of Dropouts']

    def detailsDuringPeriodBr2LOxxx = ['br2 LO xxx', '2010-07-20', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']
    def totalDuringPeriod = ['Total During Period', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']
    def grandTotalDuringPeriod = ['Grand Total During Period', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']

    def asOf_20100930 = ['As of', '2010-09-30']
    def asOf_20100815 = ['As of', '2010-08-15']
    def details2ndHeader = ['Name', 'Date Joined', '# of Centers', '# of Clients', '# of Groups', '% Women', '# of Loans', 'Portfolio',
            'Outstanding Principal', 'Outstanding Interest', 'Principal Overdue', 'Current PAR', 'Total Savings']

    def detailsAsOf20100815Br2LOxxx = ['br2 LO xxx', '2010-07-20', '2', '4', '4', '50.00', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00', '1977.1000']
    def detailsAsOf20100930Br2LOxxx = ['br2 LO xxx', '2010-07-20', '2', '4', '5', '50.00', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00', '1998.8000']
    def totalAsOf20100815 = ['Total As of Date', '2', '4', '4', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00000000000000', '1977.1000']
    def totalAsOf20100930 = ['Total As of Date', '2', '4', '5', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00000000000000', '1998.8000']
    def grandTotalAsOf20100815 = ['Grand Total As of Date', '2', '4', '4', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00000000000000', '1977.1000']
    def grandTotalAsOf20100930 = ['Grand Total As of Date', '2', '4', '5', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00000000000000', '1998.8000']

    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummary.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['Time Period:', 'From:', 'MFI Name:', 'Mifos HO'])
            t.assertCellEquals(3, 1, 'To:')
            t.assertCellEquals(3, 2, 'Report Date:')

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, duringPeriod)
            t.assertRowEquals(offset+2, detailsHeader)
            // Details
            t.assertRowEquals(offset+3, detailsDuringPeriodBr2LOxxx)
            t.assertRowEquals(offset+4, totalDuringPeriod)
            // 1st Details footer
            t.assertRowEquals(offset+5, detailsHeader)
            t.assertRowEquals(offset+6, grandTotalDuringPeriod)

            //2nd Details header
            offset = 11
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, asOf_20100930)
            t.assertRowEquals(offset+2, details2ndHeader)
            // Details
            t.assertRowEquals(offset+3, detailsAsOf20100930Br2LOxxx)
            t.assertRowEquals(offset+4, totalAsOf20100930)
            // 2nd Details footer
            t.assertRowEquals(offset+5, details2ndHeader)
            t.assertRowEquals(offset+6, grandTotalAsOf20100930)

            // Page footer
            offset = 18
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummary.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['Time Period:', 'From:', 'MFI Name:', 'Mifos HO'])
            t.assertCellEquals(3, 1, 'To:')
            t.assertCellEquals(3, 2, 'Report Date:')

            // 1st Details header
            def offset = 4
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, duringPeriod)
            t.assertRowEquals(offset+2, detailsHeader)
            // Details
            t.assertRowEquals(offset+3, detailsDuringPeriodBr2LOxxx)
            t.assertRowEquals(offset+4, totalDuringPeriod)
            // 1st Details footer
            t.assertRowEquals(offset+5, detailsHeader)
            t.assertRowEquals(offset+6, grandTotalDuringPeriod)

            //2nd Details header
            offset = 11
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, asOf_20100815)
            t.assertRowEquals(offset+2, details2ndHeader)
            // Details
            t.assertRowEquals(offset+3, detailsAsOf20100815Br2LOxxx)
            t.assertRowEquals(offset+4, totalAsOf20100815)
            // 2nd Details footer
            t.assertRowEquals(offset+5, details2ndHeader)
            t.assertRowEquals(offset+6, grandTotalAsOf20100815)

            // Page footer
            offset = 18
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }
}
