package org.mifos.bi.test

import org.junit.Test

class LoanStatusTest {

    def mfiName = 'Mifos HO'
    def reportPath = 'reports/standardReports/prpts/LoanStatus.prpt'
    def reportName = 'Loan Status';
    def detailsHeader = ['Account ID', 'Client name', 'Product name', 'Loan Officer', 'Loan Amount', 'Loan Status', 'Time in existing status (days)', 'Last edited by']

    def detailsAccount32_20101231 = ['000100000000032', 'br2 client 1 xxx', 'loan prod 1', 'br2 LO xxx', '3000.0000', 'Active in bad standing', '46', 'br2 LO xxx']
    def detailsAccount38_20101231 = ['000100000000038', 'lose group ..', 'loan prod 1', 'br1 lo 1 smith', '3000.0000', 'Closed - obligation met', '152', 'br1 lo3 Sturty xxx']
    def detailsAccount55_20101231 = ['000100000000055', 'group w/o center ..', 'group loan', 'br2 LO xxx', '5000.0000', 'Application approved', '159', 'br2 LO xxx']
    def detailsAccount59_20101231 = ['000100000000059', 'client of group w/o ..', 'loan prod 1', 'br2 LO xxx', '3000.0000', 'Application approved', '159', 'br2 LO xxx']
    def detailsAccount112_20101231 = ['000100000000112', 'group for loan fees', 'group loan', 'Fees LO xxx', '5000.0000', 'Canceled', '125', 'Fees LO xxx']
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

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31', 'Loan Status:', ' All'])
            t.assertRowEquals(4, ['Branch:', 'All', 'Product:', ' All'])
            t.assertRowEquals(5, ['Loan Officer:', ' All'])

            // Details header
            t.assertRowEquals(6, detailsHeader)
            // Account ID: 32 - 7th row
            t.assertRowEquals(13, detailsAccount32_20101231)
            // Account ID: 38 - 8th row
            t.assertRowEquals(14, detailsAccount38_20101231)
            // Account ID: 55 - 11th row
            t.assertRowEquals(17, detailsAccount55_20101231)
            // Account ID: 59 - 12ve row
            t.assertRowEquals(18, detailsAccount59_20101231)
            // Account ID: 112 - 17th row
            t.assertRowEquals(23, detailsAccount112_20101231)

            // Group footer
            t.assertRowEquals(24, totalAll_20101231)

            // Page footer
            t.assertRowEquals(25, pageFooter)
            t.assertCellEquals(26, 1, 'Printed by:')
            t.assertCellEquals(26, 2, 'On:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '0', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31', 'Loan Status:', ' All'])
            t.assertRowEquals(4, ['Branch:', 'All', 'Product:', ' All'])
            t.assertRowEquals(5, ['Loan Officer:', 'br2 LO xxx'])

            // Details header
            t.assertRowEquals(6, detailsHeader)
            // Account ID: 32
            t.assertRowEquals(7, detailsAccount32_20101231)
            // Account ID: 55
            t.assertRowEquals(8, detailsAccount55_20101231)
            // Account ID: 59
            t.assertRowEquals(9, detailsAccount59_20101231)

            // Group footer
            t.assertRowEquals(10, totalBr2LOxxx_20101231)

            // Page footer
            t.assertRowEquals(11, pageFooter)
            t.assertCellEquals(12, 1, 'Printed by:')
            t.assertCellEquals(12, 2, 'On:')
        }
    }

    @Test
    void testParams_br4_feesLOxxx_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.2.', 'selected_loan_officer': '7', 'selected_product': '0', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31', 'Loan Status:', ' All'])
            t.assertRowEquals(4, ['Branch:', 'br4', 'Product:', ' All'])
            t.assertRowEquals(5, ['Loan Officer:', 'Fees LO xxx'])

            // Details header
            t.assertRowEquals(6, detailsHeader)
            // Account ID: 112
            t.assertRowEquals(7, detailsAccount112_20101231)

            // Group footer
            t.assertRowEquals(8, totalFeesLOxxx_20101231)

            // Page footer
            t.assertRowEquals(9, pageFooter)
            t.assertCellEquals(10, 1, 'Printed by:')
            t.assertCellEquals(10, 2, 'On:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_loanProd1_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '1', 'selected_loan_status': 'All', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31', 'Loan Status:', ' All'])
            t.assertRowEquals(4, ['Branch:', 'All', 'Product:', 'loan prod 1'])
            t.assertRowEquals(5, ['Loan Officer:', 'br2 LO xxx'])

            // Details header
            t.assertRowEquals(6, detailsHeader)
            // Account ID: 32
            t.assertRowEquals(7, detailsAccount32_20101231)
            // Account ID: 59
            t.assertRowEquals(8, detailsAccount59_20101231)

            // Group footer
            t.assertRowEquals(9, totalBr2LOxxxLoanProd1_20101231)

            // Page footer
            t.assertRowEquals(10, pageFooter)
            t.assertCellEquals(11, 1, 'Printed by:')
            t.assertCellEquals(11, 2, 'On:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_loanProd1_ActiveInBadStanding_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '1', 'selected_loan_status': 'AccountState-ActiveInBadStanding', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31', 'Loan Status:', 'ActiveInBadStanding'])
            t.assertRowEquals(4, ['Branch:', 'All', 'Product:', 'loan prod 1'])
            t.assertRowEquals(5, ['Loan Officer:', 'br2 LO xxx'])

            // Details header
            t.assertRowEquals(6, detailsHeader)
            // Account ID: 32
            t.assertRowEquals(7, detailsAccount32_20101231)

            // Group footer
            t.assertRowEquals(8, totalBr2LOxxxLoanProd1AIBS_20101231)

            // Page footer
            t.assertRowEquals(9, pageFooter)
            t.assertCellEquals(10, 1, 'Printed by:')
            t.assertCellEquals(10, 2, 'On:')
        }
    }

    @Test
    void testParams_All_br2LOxxx_loanProd1_Cancel_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '5', 'selected_product': '1', 'selected_loan_status': 'AccountState-Cancel', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31', 'Loan Status:', 'Cancel'])
            t.assertRowEquals(4, ['Branch:', 'All', 'Product:', 'loan prod 1'])
            t.assertRowEquals(5, ['Loan Officer:', 'br2 LO xxx'])

            // Details header
            t.assertRowEquals(6, detailsHeader)

            // Group footer
            t.assertRowEquals(7, totalBr2LOxxxLoanProd1Cancel_20101231)

            // Page footer
            t.assertRowEquals(8, pageFooter)
            t.assertCellEquals(9, 1, 'Printed by:')
            t.assertCellEquals(9, 2, 'On:')
        }
    }
}

