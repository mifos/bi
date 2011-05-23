package org.mifos.bi.test

import static org.junit.Assert.*
import org.junit.Test

class ClientExitTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Client Exit'

    def firstOffice = ['Office:', 'br4']
    def detailsHeader = ['Client ID', 'Client Name', 'Group Name', 'National ID', 'Closed Date', 'Reason', 'Notes', '# Loans', 'Amount Disbursed', 'Loan Officer']

    def client = ['76', 'She2\'ll also be deleted Very2 soon', 'Group with lots of fees', '', '2011-01-13',	 'Blacklisted',
            '"closed after approval, then blacklisted"', '0', '0.0000', 'Fees LO xxx']

    def subTotalsClient = ['Total', '1', '', '', '', '', '', '', '0.0000', '']
    def subTotalsEmpty = ['Total', '0', '', '', '', '', '', '', '0', '']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_20100101_20110123_All_All_All() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-01', 'to_date': '2011-01-23', 'p_branch_id': '-1', 'p_loan_officer': '-1', 'p_group': '-1']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-01')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'ALL')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2011-01-23')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'ALL')
            t.assertRowEquals(5, ['Office:', ' ALL'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstOffice)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // client
            t.assertRowEquals(offset+2, client)
            // subtotal
            t.assertRowEquals(offset+3, subTotalsClient)

            // Page footer
            offset = 10
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_20100101_20110123_BO1_All_All() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-01', 'to_date': '2011-01-23', 'p_branch_id': '3', 'p_loan_officer': '-1', 'p_group': '-1']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-01')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'ALL')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2011-01-23')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'ALL')
            t.assertRowEquals(5, ['Office:', 'BO 1'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, ['Office:'])
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // subtotal
            t.assertRowEquals(offset+2, subTotalsEmpty)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_20100101_20110123_All_br2LOxxx_All() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-01', 'to_date': '2011-01-23', 'p_branch_id': '-1', 'p_loan_officer': '5', 'p_group': '-1']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-01')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'br2 LO xxx')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2011-01-23')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'ALL')
            t.assertRowEquals(5, ['Office:', 'ALL'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, ['Office:'])
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // subtotal
            t.assertRowEquals(offset+2, subTotalsEmpty)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_20100101_20110123_All_All_br2Group1() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-01', 'to_date': '2011-01-23', 'p_branch_id': '-1', 'p_loan_officer': '-1', 'p_group': '12']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-01')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'ALL')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2011-01-23')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'br2 group 1')
            t.assertRowEquals(5, ['Office:', 'ALL'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, ['Office:'])
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // subtotal
            t.assertRowEquals(offset+2, subTotalsEmpty)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_20100101_20100112_All_All_All() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-01', 'to_date': '2010-01-12', 'p_branch_id': '-1', 'p_loan_officer': '-1', 'p_group': '-1']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-01')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'ALL')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-01-12')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'ALL')
            t.assertRowEquals(5, ['Office:', 'ALL'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, ['Office:'])
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // subtotal
            t.assertRowEquals(offset+2, subTotalsEmpty)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_20100114_20110112_All_All_All() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-14', 'to_date': '2011-01-12', 'p_branch_id': '-1', 'p_loan_officer': '-1', 'p_group': '-1']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-14')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'ALL')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2011-01-12')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'ALL')
            t.assertRowEquals(5, ['Office:', 'ALL'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, ['Office:'])
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // subtotal
            t.assertRowEquals(offset+2, subTotalsEmpty)

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_20100101_20110123_br4_FeesLOxxx_GroupWithLotsOfFees() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['from_date': '2010-01-01', 'to_date': '2011-01-23', 'p_branch_id': '6', 'p_loan_officer': '7', 'p_group': '62']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-01-01')
            t.assertCellEquals(3, 2, 'Loan Officer:')
            t.assertCellEquals(3, 3, 'Fees LO xxx')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2011-01-23')
            t.assertCellEquals(4, 2, 'Group:')
            t.assertCellEquals(4, 3, 'Group with lots of fees')
            t.assertRowEquals(5, ['Office:', 'br4'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstOffice)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // client
            t.assertRowEquals(offset+2, client)
            // subtotal
            t.assertRowEquals(offset+3, subTotalsClient)

            // Page footer
            offset = 10
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
