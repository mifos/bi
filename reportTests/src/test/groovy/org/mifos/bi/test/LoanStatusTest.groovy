package org.mifos.bi.test;

import org.junit.Test

class LoanStatusTest {

    def reportPath = 'reports/standardReports/prpts/LoanStatus.prpt'
    def reportName = 'Loan Status';
    def detailsHeader = ['Account ID', 'Client name', 'Product name', 'Loan Officer', 'Loan Amount', 'Loan Status', 'Time in existing status (days)', 'Last edited by']

    def detailsAccount32_20101231 = ['32', 'br2 client 1 xxx', 'loan prod 1', 'br2 LO xxx', '3000.0000', 'Active in bad standing', '46', 'br2 LO xxx']
    def detailsAccount38_20101231 = ['38', 'lose group ..', 'loan prod 1', 'br1 lo 1 smith', '3000.0000', 'Closed - obligation met', '152', 'br1 lo3 Sturty xxx']
    def detailsAccount55_20101231 = ['55', 'group w/o center ..', 'group loan', 'br2 LO xxx', '5000.0000', 'Application approved', '159', 'br2 LO xxx']
    def detailsAccount59_20101231 = ['59', 'client of group w/o ..', 'loan prod 1', 'br2 LO xxx', '3000.0000', 'Application approved', '159', 'br2 LO xxx']
    def detailsAccount112_20101231 = ['112', 'group for loan fees', 'group loan', 'Fees LO xxx', '5000.0000', 'Canceled', '125', 'Fees LO xxx']
    def totalAll_20101231 = [' ', ' ', ' ', ' ', '67000.0000', ' ', ' ', ' ']
    def totalBr2LOxxx_20101231 = [' ', ' ', ' ', ' ', '11000.0000', ' ', ' ', ' ']
    def totalBr2LOxxxLoanProd1_20101231 = [' ', ' ', ' ', ' ', '6000.0000', ' ', ' ', ' ']
    def totalBr2LOxxxLoanProd1AIBS_20101231 = [' ', ' ', ' ', ' ', '3000.0000', ' ', ' ', ' ']
    def totalBr2LOxxxLoanProd1Cancel_20101231 = [' ', ' ', ' ', ' ', '0', ' ', ' ', ' ']
    def totalFeesLOxxx_20101231 = [' ', ' ', ' ', ' ', '5000.0000', ' ', ' ', ' ']

    def pageFooter = ['Version 1.1', 'Page', '1 / 1']

    @Test
    void testParams_All_All_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '0', 'selected_product': '0', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['As Of:', '2010-12-31', 'MFI Name:', 'Mifos HO '])
            t.assertCellEquals(3, 1, 'Branch:')
            t.assertCellEquals(3, 2, ' All')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertRowEquals(4, ['Loan Officer:', ' All'])
            t.assertRowEquals(5, ['Loan Status:', ' All'])
            t.assertRowEquals(6, ['Product:', ' All'])

            // Details header
            t.assertRowEquals(7, detailsHeader)
            // Account ID: 32 - 7th row
            t.assertRowEquals(14, detailsAccount32_20101231)
            // Account ID: 38 - 8th row
            t.assertRowEquals(15, detailsAccount38_20101231)
            // Account ID: 55 - 11th row
            t.assertRowEquals(18, detailsAccount55_20101231)
            // Account ID: 59 - 12ve row
            t.assertRowEquals(19, detailsAccount59_20101231)
            // Account ID: 112 - 17th row
            t.assertRowEquals(24, detailsAccount112_20101231)

            // Group footer
            t.assertRowEquals(25, totalAll_20101231)

            // Page footer
            t.assertRowEquals(26, pageFooter)
            t.assertCellEquals(27, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '0', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['As Of:', '2010-12-31', 'MFI Name:', 'Mifos HO '])
            t.assertCellEquals(3, 1, 'Branch:')
            t.assertCellEquals(3, 2, ' All')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertRowEquals(4, ['Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(5, ['Loan Status:', ' All'])
            t.assertRowEquals(6, ['Product:', ' All'])

            // Details header
            t.assertRowEquals(7, detailsHeader)
            // Account ID: 32
            t.assertRowEquals(8, detailsAccount32_20101231)
            // Account ID: 55
            t.assertRowEquals(9, detailsAccount55_20101231)
            // Account ID: 59
            t.assertRowEquals(10, detailsAccount59_20101231)

            // Group footer
            t.assertRowEquals(11, totalBr2LOxxx_20101231)

            // Page footer
            t.assertRowEquals(12, pageFooter)
            t.assertCellEquals(13, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_br4_feesLOxxx_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.2.', 'selected_loan_officer': '7', 'selected_product': '0', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['As Of:', '2010-12-31', 'MFI Name:', 'Mifos HO '])
            t.assertCellEquals(3, 1, 'Branch:')
            t.assertCellEquals(3, 2, 'br4')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertRowEquals(4, ['Loan Officer:', 'Fees LO xxx'])
            t.assertRowEquals(5, ['Loan Status:', ' All'])
            t.assertRowEquals(6, ['Product:', ' All'])

            // Details header
            t.assertRowEquals(7, detailsHeader)
            // Account ID: 112
            t.assertRowEquals(8, detailsAccount112_20101231)

            // Group footer
            t.assertRowEquals(9, totalFeesLOxxx_20101231)

            // Page footer
            t.assertRowEquals(10, pageFooter)
            t.assertCellEquals(11, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_loanProd1_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '1', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['As Of:', '2010-12-31', 'MFI Name:', 'Mifos HO '])
            t.assertCellEquals(3, 1, 'Branch:')
            t.assertCellEquals(3, 2, ' All')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertRowEquals(4, ['Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(5, ['Loan Status:', ' All'])
            t.assertRowEquals(6, ['Product:', 'loan prod 1'])

            // Details header
            t.assertRowEquals(7, detailsHeader)
            // Account ID: 32
            t.assertRowEquals(8, detailsAccount32_20101231)
            // Account ID: 59
            t.assertRowEquals(9, detailsAccount59_20101231)

            // Group footer
            t.assertRowEquals(10, totalBr2LOxxxLoanProd1_20101231)

            // Page footer
            t.assertRowEquals(11, pageFooter)
            t.assertCellEquals(12, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_loanProd1_ActiveInBadStanding_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '1', 'selected_loan_status': 'AccountState-ActiveInBadStanding', 'out_date': '2010-12-31']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['As Of:', '2010-12-31', 'MFI Name:', 'Mifos HO '])
            t.assertCellEquals(3, 1, 'Branch:')
            t.assertCellEquals(3, 2, ' All')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertRowEquals(4, ['Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(5, ['Loan Status:', 'ActiveInBadStanding'])
            t.assertRowEquals(6, ['Product:', 'loan prod 1'])

            // Details header
            t.assertRowEquals(7, detailsHeader)
            // Account ID: 32
            t.assertRowEquals(8, detailsAccount32_20101231)

            // Group footer
            t.assertRowEquals(9, totalBr2LOxxxLoanProd1AIBS_20101231)

            // Page footer
            t.assertRowEquals(10, pageFooter)
            t.assertCellEquals(11, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_loanProd1_Cancel_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '1', 'selected_loan_status': 'AccountState-Cancel', 'out_date': '2010-12-31']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['As Of:', '2010-12-31', 'MFI Name:', 'Mifos HO '])
            t.assertCellEquals(3, 1, 'Branch:')
            t.assertCellEquals(3, 2, ' All')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertRowEquals(4, ['Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(5, ['Loan Status:', 'Cancel'])
            t.assertRowEquals(6, ['Product:', 'loan prod 1'])

            // Details header
            t.assertRowEquals(7, detailsHeader)

            // Group footer
            t.assertRowEquals(8, totalBr2LOxxxLoanProd1Cancel_20101231)

            // Page footer
            t.assertRowEquals(9, pageFooter)
            t.assertCellEquals(10, 1, 'Printed by:')
        }
    }
}
