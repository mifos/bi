package org.mifos.bi.test;

import org.junit.Test

class FunderReportTest {

    def detailsHeader = ['Source of Funds', 'Disbursed', 'Paid', 'Outstanding', 'Principal in Arrears', 'Number of loans', 'Number of clients', 'Number of groups']

    def firstBranch = ['Branch:', 'BO 1']
    def detailsFirstBranchFirstFund_20100723 = ['-', '9000.0000', '0.0000', '9000.0000', '0.0000', '2', '2', '0']
    def detailsFirstBranchFirstFund_20101231 = ['-', '9000.0000', '3000.0000', '6000.0000', '0.0000', '2', '2', '0']
    def detailsFirstBranchSecondFund = ['Funding Org ..', '3000.0000', '247.1000', '2752.9000', '0.0000', '1', '1', '0']
    def grandTotalFirstBranch_20100723 = ['Grand Total', '12000.0000', '247.1000', '11752.9000', '0.0000', ' ', ' ', ' ']
    def grandTotalFirstBranch_20101231 = ['Grand Total', '12000.0000', '3247.1000', '8752.9000', '0.0000', ' ', ' ', ' ']
    def grandTotalFirstBranchSecondFund = ['Grand Total', '3000.0000', '247.1000', '2752.9000', '0.0000', ' ', ' ', ' ']

    def secondBranch = ['Branch:', 'br2']
    def detailsSecondBranchFirstFund = ['-', '3000.0000', '75.1000', '2924.9000', '0.0000', '1', '1', '0']
    def grandTotalSecondBranch = ['Grand Total', '3000.0000', '75.1000', '2924.9000', '0.0000', ' ', ' ', ' ']

    def grandTotal_20100723 = ['Grand Total', '15000.0000', '322.2000', '14677.8000', '0.0000', ' ', ' ', ' ']
    def grandTotal_20101231 = ['Grand Total', '15000.0000', '3322.2000', '11677.8000', '0.0000', ' ', ' ', ' ']
    def pageFooter = ['Version 1.1', 'Page', '1 / 1']

    @Test
    void testParams_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/FunderReport.prpt'
            t.reportParams = ['selected_office': '-1', 'selected_funder': '-1', 'out_date': '2010-12-31']

            // Report title - row 10
            t.assertRowEquals(10, ['Funder Outstanding Report'])

            // Page header - row 12
            t.assertCellEquals(12, 1, 'As On Date:')
            t.assertCellEquals(12, 2, '2010-12-31')
            t.assertCellEquals(12, 3, 'Report Date:')

            // 1st Group header - row 15
            t.assertRowEquals(15, firstBranch)
            // 1st Details header - row 17
            t.assertRowEquals(17, detailsHeader)
            // Branch: BO 1 -> Fund: '-' - row 18
            t.assertRowEquals(18, detailsFirstBranchFirstFund_20101231)
            // Branch: BO 1 -> Fund: 'Funding Org A' - row 19
            t.assertRowEquals(19, detailsFirstBranchSecondFund)

            // 2nd Group header - row 21
            t.assertRowEquals(21, secondBranch)
            // 2nd Details header - row 23
            t.assertRowEquals(23, detailsHeader)
            // Branch: br2 -> Fund: '-' - row 24
            t.assertRowEquals(24, detailsSecondBranchFirstFund)

            // Report footer - row 26
            t.assertRowEquals(26, grandTotal_20101231)
            // Page footer - row 29
            t.assertRowEquals(29, pageFooter)
        }
    }

    @Test
    void testParams_BO1_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/FunderReport.prpt'
            t.reportParams = ['selected_office': '1.1.3.2.', 'selected_funder': '-1', 'out_date': '2010-12-31']

            // Report title - row 10
            t.assertRowEquals(10, ['Funder Outstanding Report'])

            // Page header - row 12
            t.assertCellEquals(12, 1, 'As On Date:')
            t.assertCellEquals(12, 2, '2010-12-31')
            t.assertCellEquals(12, 3, 'Report Date:')

            // 1st Group header - row 15
            t.assertRowEquals(15, firstBranch)
            // 1st Details header - row 17
            t.assertRowEquals(17, detailsHeader)
            // Branch: BO 1 -> Fund: '-' - row 18
            t.assertRowEquals(18, detailsFirstBranchFirstFund_20101231)
            // Branch: BO 1 -> Fund: 'Funding Org A' - row 19
            t.assertRowEquals(19, detailsFirstBranchSecondFund)

            // Report footer - row 21
            t.assertRowEquals(21, grandTotalFirstBranch_20101231)
            // Page footer - row 24
            t.assertRowEquals(24, pageFooter)
        }
    }

    @Test
    void testParams_BO1_OrgA_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/FunderReport.prpt'
            t.reportParams = ['selected_office': '1.1.3.2.', 'selected_funder': '2', 'out_date': '2010-12-31']

            // Report title - row 10
            t.assertRowEquals(10, ['Funder Outstanding Report'])

            // Page header - row 12
            t.assertCellEquals(12, 1, 'As On Date:')
            t.assertCellEquals(12, 2, '2010-12-31')
            t.assertCellEquals(12, 3, 'Report Date:')

            // 1st Group header - row 15
            t.assertRowEquals(15, firstBranch)
            // 1st Details header - row 17
            t.assertRowEquals(17, detailsHeader)
            // Branch: BO 1 -> Fund: 'Funding Org A' - row 18
            //TODO: t.assertRowEquals(18, detailsFirstBranchSecondFund)
            t.assertRowEquals(18, ['Funding Org ..', '3000.0000', '247.1000', '2752.9000', '0.0', '1', '1', '0'])

            // Report footer - row 20
            //TODO: t.assertRowEquals(20, grandTotalFirstBranchSecondFund)
            t.assertRowEquals(20, ['Grand Total', '3000.0000', '247.1000', '2752.9000', '0.0', ' ', ' ', ' '])
            // Page footer - row 23
            t.assertRowEquals(23, pageFooter)
        }
    }

    @Test
    void testParams_All_All_20100723() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/FunderReport.prpt'
            t.reportParams = ['selected_office': '-1', 'selected_funder': '-1', 'out_date': '2010-07-23']

            // Report title - row 10
            t.assertRowEquals(10, ['Funder Outstanding Report'])

            // Page header - row 12
            t.assertCellEquals(12, 1, 'As On Date:')
            t.assertCellEquals(12, 2, '2010-07-23')
            t.assertCellEquals(12, 3, 'Report Date:')

            // 1st Group header - row 15
            t.assertRowEquals(15, firstBranch)
            // 1st Details header - row 17
            t.assertRowEquals(17, detailsHeader)
            // Branch: BO 1 -> Fund: '-' - row 18
            t.assertRowEquals(18, detailsFirstBranchFirstFund_20100723)
            // Branch: BO 1 -> Fund: 'Funding Org A' - row 19
            t.assertRowEquals(19, detailsFirstBranchSecondFund)

            // 2nd Group header - row 21
            t.assertRowEquals(21, secondBranch)
            // 2nd Details header - row 23
            t.assertRowEquals(23, detailsHeader)
            // Branch: br2 -> Fund: '-' - row 24
            t.assertRowEquals(24, detailsSecondBranchFirstFund)

            // Report footer - row 26
            t.assertRowEquals(26, grandTotal_20100723)
            // Page footer - row 29
            t.assertRowEquals(29, pageFooter)
        }
    }
}
