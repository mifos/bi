package org.mifos.bi.test

import org.junit.Test

class LoanOfficerPerformanceSummaryCumulativeTest {

    def MFIName = 'Mifos HO'
    def reportName = 'Loan Officer Performance Summary (Cumulative)'
    def branch = ['Office:', 'br2']

    def asOf_20100930 = ['As of', '2010-09-30']
    def asOf_20100815 = ['As of', '2010-08-15']
    def details2ndHeader = ['Name', 'Date Joined', '# of Centers', '# of Clients', '# of Groups', '% Women', '# of Loans', 'Loan Amount',
            'Principal Outstanding', 'Interest Outstanding', 'Principal Overdue', 'Current PAR', 'Total Savings']

    def detailsAsOf20100815Br2LOxxx = ['br2 LO xxx', '2010-07-20', '2', '4', '4', '50.00', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00', '1977.1000']
    def detailsAsOf20100930Br2LOxxx = ['br2 LO xxx', '2010-07-20', '2', '4', '5', '50.00', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00', '1998.8000']
    def totalAsOf20100815 = ['Total As of Date', '2', '4', '4', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '781.1000', '100.00000000000000', '1977.1000']
    def totalAsOf20100930 = ['Total As of Date', '2', '4', '5', '50.00000000000000', '1', '2943.0000', '2924.9000', '18.1000', '2924.9000', '100.00000000000000', '1998.8000']

    def pageFooter = ['Version 1.3.1', 'Page', '1 / 1']

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummaryCumulative.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']
            
            // MFI Name
            t.assertRowEquals(1, [MFIName])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertCellEquals(3, 1, 'Office:')
            t.assertCellEquals(3, 2, 'br2')
            t.assertCellEquals(3, 3, 'From:')
            t.assertCellEquals(3, 4, 'To:')

            // Details header
            def offset = 4
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, asOf_20100930)
            t.assertRowEquals(offset+2, details2ndHeader)
            // Details
            t.assertRowEquals(offset+3, detailsAsOf20100930Br2LOxxx)
            t.assertRowEquals(offset+4, totalAsOf20100930)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerPerformanceSummaryCumulative.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // MFI Name
            t.assertRowEquals(1, [MFIName])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertCellEquals(3, 1, 'Office:')
            t.assertCellEquals(3, 2, 'br2')
            t.assertCellEquals(3, 3, 'From:')
            t.assertCellEquals(3, 4, 'To:')

            // Details header
            def offset = 4
            t.assertRowEquals(offset, branch)
            t.assertRowEquals(offset+1, asOf_20100815)
            t.assertRowEquals(offset+2, details2ndHeader)
            // Details
            t.assertRowEquals(offset+3, detailsAsOf20100815Br2LOxxx)
            t.assertRowEquals(offset+4, totalAsOf20100815)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
