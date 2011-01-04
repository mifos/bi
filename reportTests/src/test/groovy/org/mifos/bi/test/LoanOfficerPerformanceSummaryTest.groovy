package org.mifos.bi.test;

import org.junit.Test

class LoanOfficerPerformanceSummaryTest {

    def branch = ['Branch', ':', 'br2']
    def branchName = ['br2']
    def branchLabel = ['Branch', ':']
    def duringPeriod = ['During Period']
    def detailsHeader1 = ['Name', 'Date Joined', 'Total', 'Total', 'Total amt of', 'Total amt of', 'Total # new', 'Total', 'Total amt', 'Total amt', '# of']
    def detailsHeader2a = ['Groups', 'Loans', 'Loans', 'Loans']
    def detailsHeader2b = ['Loans', 'Savings', 'Clients', 'Savings', 'Savings']
    def detailsHeader3a = ['Savings', 'Clients', 'Savings', 'Savings']
    def detailsHeader3b = ['Groups', 'Loans', 'Loans']
    def detailsHeader4 = ['Dropouts']
    def detailsHeader5 = ['Formed', 'Disbursed', 'Disbursed', 'Repaid', 'Accounts', 'Recruited', 'Deposits', 'Withdrawals']

    def detailsDuringPeriodBr2LOxxx = ['br2 LO xxx', '2010-07-20', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']
    def totalDuringPeriod = ['Total During Period', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']
    def grandTotalDuringPeriod = ['Grand Total During Period', '3', '1', '3000.0000', '78.0000', '5', '3', '1977.0000', '0.0000', '0']

    def asOf_20100930 = ['As of', '2010-09-30']
    def asOf_20100815 = ['As of', '2010-08-15']
    def details2ndHeader1 = ['Name', 'Date Joined', '# of Centers', '# of Clients', '# of Groups', '% Women', '# of Loans', 'Portfolio', 'Outstanding', 'Outstanding', 'Principal', 'Current', 'Total']
    def details2ndHeader2 = ['Principal', 'Interest', 'Overdue', 'PAR', 'Savings']

    def detailsAsOf20100815Br2LOxxx = ['br2 LO xxx', '2010-07-20', '2', '4', '4', '50.00', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00', '1977.1000']
    def detailsAsOf20100930Br2LOxxx = ['br2 LO xxx', '2010-07-20', '2', '4', '5', '50.00', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00', '1998.8000']
    def totalAsOf20100815 = ['Total As of Date', '2', '4', '4', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00000000000000', '1977.1000']
    def totalAsOf20100930 = ['Total As of Date', '2', '4', '5', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00000000000000', '1998.8000']
    def grandTotalAsOf20100815 = ['Grand Total As of Date', '2', '4', '4', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00000000000000', '1977.1000']
    def grandTotalAsOf20100930 = ['Grand Total As of Date', '2', '4', '5', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00000000000000', '1998.8000']

    def pageFooter = ['Version 1.1', 'Page 1 / 1']

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummary.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, ['Loan Officer Performance Summary Report'])

            // Page header

            t.assertCellEquals(2, 1, 'Time Period')
            t.assertCellEquals(2, 2, ':')
            t.assertCellEquals(2, 3, 'From')
            t.assertCellEquals(2, 4, ':')
            t.assertCellEquals(2, 5, 'To')
            t.assertCellEquals(2, 6, ':')
            t.assertCellEquals(2, 7, 'Report Date')
            t.assertCellEquals(2, 8, ':')

            // 1st Details header
            t.assertRowEquals(3, branchName)
            t.assertRowEquals(4, branchLabel)
            t.assertRowEquals(5, duringPeriod)
            t.assertRowEquals(6, detailsHeader1)
            t.assertRowEquals(7, detailsHeader2a)
            t.assertRowEquals(8, detailsHeader3a)
            t.assertRowEquals(9, detailsHeader4)
            t.assertRowEquals(10, detailsHeader5)
            // Details
            t.assertRowEquals(11, detailsDuringPeriodBr2LOxxx)
            t.assertRowEquals(12, totalDuringPeriod)
            // 1st Details footer
            t.assertRowEquals(13, detailsHeader1)
            t.assertRowEquals(14, detailsHeader2b)
            t.assertRowEquals(15, detailsHeader3b)
            t.assertRowEquals(16, detailsHeader4)
            t.assertRowEquals(17, detailsHeader5)
            t.assertRowEquals(18, grandTotalDuringPeriod)

            //2nd Details header
            t.assertRowEquals(19, branch)
            t.assertRowEquals(20, asOf_20100930)
            t.assertRowEquals(21, details2ndHeader1)
            t.assertRowEquals(22, details2ndHeader2)
            // Details
            t.assertRowEquals(23, detailsAsOf20100930Br2LOxxx)
            t.assertRowEquals(24, totalAsOf20100930)
            // 2nd Details footer
            t.assertRowEquals(25, details2ndHeader1)
            t.assertRowEquals(26, details2ndHeader2)
            t.assertRowEquals(27, grandTotalAsOf20100930)

            // Page footer
            t.assertRowEquals(28, pageFooter)
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummary.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, ['Loan Officer Performance Summary Report'])

            // Page header

            t.assertCellEquals(2, 1, 'Time Period')
            t.assertCellEquals(2, 2, ':')
            t.assertCellEquals(2, 3, 'From')
            t.assertCellEquals(2, 4, ':')
            t.assertCellEquals(2, 5, 'To')
            t.assertCellEquals(2, 6, ':')
            t.assertCellEquals(2, 7, 'Report Date')
            t.assertCellEquals(2, 8, ':')

            // 1st Details header
            t.assertRowEquals(3, branchName)
            t.assertRowEquals(4, branchLabel)
            t.assertRowEquals(5, duringPeriod)
            t.assertRowEquals(6, detailsHeader1)
            t.assertRowEquals(7, detailsHeader2a)
            t.assertRowEquals(8, detailsHeader3a)
            t.assertRowEquals(9, detailsHeader4)
            t.assertRowEquals(10, detailsHeader5)
            // Details
            t.assertRowEquals(11, detailsDuringPeriodBr2LOxxx)
            t.assertRowEquals(12, totalDuringPeriod)
            // 1st Details footer
            t.assertRowEquals(13, detailsHeader1)
            t.assertRowEquals(14, detailsHeader2b)
            t.assertRowEquals(15, detailsHeader3b)
            t.assertRowEquals(16, detailsHeader4)
            t.assertRowEquals(17, detailsHeader5)
            t.assertRowEquals(18, grandTotalDuringPeriod)

            //2nd Details header
            t.assertRowEquals(19, branch)
            t.assertRowEquals(20, asOf_20100815)
            t.assertRowEquals(21, details2ndHeader1)
            t.assertRowEquals(22, details2ndHeader2)
            // Details
            t.assertRowEquals(23, detailsAsOf20100815Br2LOxxx)
            t.assertRowEquals(24, totalAsOf20100815)
            // 2nd Details footer
            t.assertRowEquals(25, details2ndHeader1)
            t.assertRowEquals(26, details2ndHeader2)
            t.assertRowEquals(27, grandTotalAsOf20100815)

            // Page footer
            t.assertRowEquals(28, pageFooter)
        }
    }
}
