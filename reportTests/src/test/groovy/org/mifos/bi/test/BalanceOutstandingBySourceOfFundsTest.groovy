package org.mifos.bi.test

import org.junit.Test

class BalanceOutstandingBySourceOfFundsTest {

    def mfiName = 'Mifos HO'
    def reportPath = 'reports/standardReports/prpts/BalanceOutstandingBySourceOfFunds.prpt'
    def reportName = 'Balance Outstanding by Source of Funds'
    def detailsHeader = ['Source of Funds', 'Amount Disbursed', 'Amount Paid', 'Amount Outstanding', 'Principal in Arrears', 'Number of Loans', 'Number of Clients']

    def firstBranch = ['Office:', 'BO 1']
    def detailsFirstBranchFirstFund_20100723 = ['-', '9000.0000', '0.0000', '9000.0000', '0.0000', '2', '2']
    def detailsFirstBranchFirstFund_20101231 = ['-', '9000.0000', '3000.0000', '6000.0000', '0.0000', '2', '2']
    def detailsFirstBranchSecondFund = ['Funding Org A', '3000.0000', '247.1000', '2752.9000', '0.0000', '1', '1']
    def grandTotalFirstBranch_20100723 = ['Total', '12000.0000', '247.1000', '11752.9000', '0.0000', '3', ' ']
    def grandTotalFirstBranch_20101231 = ['Total', '12000.0000', '3247.1000', '8752.9000', '0.0000', '3', ' ']
    def grandTotalFirstBranchSecondFund = ['Total', '3000.0000', '247.1000', '2752.9000', '0.0000', '3', ' ']

    def secondBranch = ['Office:', 'br2']
    def detailsSecondBranchFirstFund_20100723 = ['-', '3000.0000', '75.1000', '2924.9000', '0.0000', '1', '1']
    def detailsSecondBranchFirstFund_20101231 = ['-', '3000.0000', '75.1000', '2924.9000', '2924.9000', '1', '1']

    def grandTotal_20100723 = ['Total', '15000.0000', '322.2000', '14677.8000', '0.0000', '4', ' ']
    def grandTotal_20101231 = ['Total', '15000.0000', '3322.2000', '11677.8000', '2924.9000', '4', ' ']
    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_funder': '-1', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'As On Date:')
            t.assertCellEquals(3, 2, '2010-12-31')
            t.assertCellEquals(3, 3, 'Source of Funds:')
            t.assertCellEquals(3, 4, 'All')
            t.assertRowEquals(4, ['Office:', 'All'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, firstBranch)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: BO 1 -> Fund: '-'
            t.assertRowEquals(offset+2, detailsFirstBranchFirstFund_20101231)
            // Branch: BO 1 -> Fund: 'Funding Org A'
            t.assertRowEquals(offset+3, detailsFirstBranchSecondFund)

            // 2nd Group header
            offset = 9
            t.assertRowEquals(offset, secondBranch)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br2 -> Fund: '-'
            t.assertRowEquals(offset+2, detailsSecondBranchFirstFund_20101231)

            // Report footer
            offset = 12
            t.assertRowEquals(offset, grandTotal_20101231)

            // Page footer
            offset = 13
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_BO1_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.3.2.', 'selected_funder': '-1', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'As On Date:')
            t.assertCellEquals(3, 2, '2010-12-31')
            t.assertCellEquals(3, 3, 'Source of Funds:')
            t.assertCellEquals(3, 4, 'All')
            t.assertRowEquals(4, ['Office:', 'BO 1'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, firstBranch)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: BO 1 -> Fund: '-'
            t.assertRowEquals(offset+2, detailsFirstBranchFirstFund_20101231)
            // Branch: BO 1 -> Fund: 'Funding Org A'
            t.assertRowEquals(offset+3, detailsFirstBranchSecondFund)

            // Report footer
            offset = 9
            t.assertRowEquals(offset, grandTotalFirstBranch_20101231)

            // Page footer
            offset = 10
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_BO1_OrgA_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.3.2.', 'selected_funder': '2', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'As On Date:')
            t.assertCellEquals(3, 2, '2010-12-31')
            t.assertCellEquals(3, 3, 'Source of Funds:')
            t.assertCellEquals(3, 4, 'Funding Org A')
            t.assertRowEquals(4, ['Office:', 'BO 1'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, firstBranch)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: BO 1 -> Fund: 'Funding Org A'
            //TODO: t.assertRowEquals(18, detailsFirstBranchSecondFund)
            t.assertRowEquals(offset+2, ['Funding Org A', '3000.0000', '247.1000', '2752.9000', '0.0', '1', '1'])

            // Report footer
            offset = 8
            //TODO: t.assertRowEquals(20, grandTotalFirstBranchSecondFund)
            t.assertRowEquals(offset, ['Total', '3000.0000', '247.1000', '2752.9000', '0.0', '1', ' '])

            // Page footer
            offset = 9
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_All_All_20100723() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_funder': '-1', 'out_date': '2010-07-23']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'As On Date:')
            t.assertCellEquals(3, 2, '2010-07-23')
            t.assertCellEquals(3, 3, 'Source of Funds:')
            t.assertCellEquals(3, 4, 'All')
            t.assertRowEquals(4, ['Office:', 'All'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, firstBranch)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: BO 1 -> Fund: '-'
            t.assertRowEquals(offset+2, detailsFirstBranchFirstFund_20100723)
            // Branch: BO 1 -> Fund: 'Funding Org A'
            t.assertRowEquals(offset+3, detailsFirstBranchSecondFund)

            // 2nd Group header
            offset = 9
            t.assertRowEquals(offset, secondBranch)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br2 -> Fund: '-'
            t.assertRowEquals(offset+2, detailsSecondBranchFirstFund_20100723)

            // Report footer
            offset = 12
            t.assertRowEquals(offset, grandTotal_20100723)

            // Page footer
            offset = 13
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
