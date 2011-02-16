package org.mifos.bi.test

import org.junit.Test

class FundsMovementTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Funds Movement'
    def detailsHeader = ['Account ID', 'Client name', 'Loan Disbursal Date', 'Loan Amount Disbursed', 'No. of Installments',
            'Installment Frequency', 'Principal Outstanding', 'Interest Outstanding', 'Loan Fees Outstanding', 'Arrears Amount', 'Arrears Days']

    def firstFund = ['Source of Funds:', '-']
    def detailsFirstFundFirstAccount_20100723 = ['32', 'br2 client 1 xxx', '2010-07-21', '3000.0000', '7', '1 week(s)', '2924.9000', '18.1000', '0.0000', '0.0000', '0']
    def detailsFirstFundFirstAccount_20101231 = ['32', 'br2 client 1 xxx', '2010-07-21', '3000.0000', '7', '1 week(s)', '2924.9000', '18.1000', '0.0000', '2924.9000', '151']
    def detailsFirstFundSecondAccount_20100723 = ['38', 'lose group ..', '2010-07-22', '3000.0000', '7', '1 week(s)', '3000.0000', '2.9000', '0.0000', '0.0000', '0']
    def detailsFirstFundSecondAccount_20101231 = ['38', 'lose group ..', '2010-07-22', '3000.0000', '7', '1 week(s)', '0.0000', '0.0000', '0.0000', '0.0000', '0']
    def detailsFirstFundThirdAccount_20101231 = ['44', 'xfer to gr in same ..', '2010-07-22', '6000.0000', '9', '1 week(s)', '6000.0000', '5.8000', '0.0000', '0.0000', '0']
    def subTotalFirstFund_20100723 = ['Sub Total', '3', ' ', '12000.0000', ' ', ' ', '11924.9000', '26.8000', '0.0000', '0.0000', ' ']
    def subTotalFirstFund_20101231 = ['Sub Total', '3', ' ', '12000.0000', ' ', ' ', '8924.9000', '23.9000', '0.0000', '2924.9000', ' ']
    def subTotalFirstFundBO1Branch_20101231 = ['Sub Total', '2', ' ', '9000.0000', ' ', ' ', '6000.0000', '5.8000', '0.0000', '0.0000', ' ']

    def secondFund = ['Source of Funds:', 'Funding Org A']
    def detailsSecondFundFirstAccount_20101231 = ['4', 'client dw1 1 1 ..', '2010-07-16', '3000.0000', '7', '1 week(s)', '2752.9000', '0.0000', '0.0000', '0.0000', '0']
    def subTotalSecondFund_20101231 = ['Sub Total', '1', ' ', '3000.0000', ' ', ' ', '2752.9000', '0.0000', '0.0000', '0.0000', ' ']

    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_All_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/FundsMovement.prpt'
            t.reportParams = ['selected_office': '-1', 'selected_funder': '-1', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31'])
            t.assertRowEquals(4, ['Office:', ' All'])
            t.assertRowEquals(5, ['Source of Funds:', ' All'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstFund)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: '-' -> Account ID: 32
            t.assertRowEquals(offset+2, detailsFirstFundFirstAccount_20101231)
            // Fund: '-' -> Account ID: 38
            t.assertRowEquals(offset+3, detailsFirstFundSecondAccount_20101231)
            // Fund: '-' -> Account ID: 44
            t.assertRowEquals(offset+4, detailsFirstFundThirdAccount_20101231)
            // 1st Group footer
            t.assertRowEquals(offset+5, subTotalFirstFund_20101231)

            // 2nd Group header
            offset = 12
            t.assertRowEquals(offset, secondFund)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: 'Funding Org A' -> Account ID: 4
            t.assertRowEquals(offset+2, detailsSecondFundFirstAccount_20101231)
            // 2nd Group footer
            t.assertRowEquals(offset+3, subTotalSecondFund_20101231)

            // Page footer
            offset = 16
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_BO1_All_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/FundsMovement.prpt'
            t.reportParams = ['selected_office': '1.1.3.2.', 'selected_funder': '-1', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31'])
            t.assertRowEquals(4, ['Office:', 'BO 1'])
            t.assertRowEquals(5, ['Source of Funds:', ' All'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstFund)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: '-' -> Account ID: 38
            t.assertRowEquals(offset+2, detailsFirstFundSecondAccount_20101231)
            // Fund: '-' -> Account ID: 44
            t.assertRowEquals(offset+3, detailsFirstFundThirdAccount_20101231)
            // 1st Group footer
            t.assertRowEquals(offset+4, subTotalFirstFundBO1Branch_20101231)

            // 2nd Group header
            offset = 11
            t.assertRowEquals(offset, secondFund)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: 'Funding Org A' -> Account ID: 4
            t.assertRowEquals(offset+2, detailsSecondFundFirstAccount_20101231)
            // 2nd Group footer
            t.assertRowEquals(offset+3, subTotalSecondFund_20101231)

            // Page footer
            offset = 15
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_BO1_OrgA_20101231() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/FundsMovement.prpt'
            t.reportParams = ['selected_office': '1.1.3.2.', 'selected_funder': '2', 'out_date': '2010-12-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-12-31'])
            t.assertRowEquals(4, ['Office:', 'BO 1'])
            t.assertRowEquals(5, ['Source of Funds:', 'Funding Org A'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, secondFund)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: 'Funding Org A' -> Account ID: 4
            t.assertRowEquals(offset+2, detailsSecondFundFirstAccount_20101231)
            // 1st Group footer
            t.assertRowEquals(offset+3, subTotalSecondFund_20101231)

            // Page footer
            offset = 10
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_All_All_20100723() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/FundsMovement.prpt'
            t.reportParams = ['selected_office': '-1', 'selected_funder': '-1', 'out_date': '2010-07-23']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2010-07-23'])
            t.assertRowEquals(4, ['Office:', ' All'])
            t.assertRowEquals(5, ['Source of Funds:', ' All'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstFund)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: '-' -> Account ID: 32
            t.assertRowEquals(offset+2, detailsFirstFundFirstAccount_20100723)
            // Fund: '-' -> Account ID: 38
            t.assertRowEquals(offset+3, detailsFirstFundSecondAccount_20100723)
            // Fund: '-' -> Account ID: 44
            t.assertRowEquals(offset+4, detailsFirstFundThirdAccount_20101231)
            // 1st Group footer
            t.assertRowEquals(offset+5, subTotalFirstFund_20100723)

            // 2nd Group header
            offset = 12
            t.assertRowEquals(offset, secondFund)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Fund: 'Funding Org A' -> Account ID: 4
            t.assertRowEquals(offset+2, detailsSecondFundFirstAccount_20101231)
            // 2nd Group footer
            t.assertRowEquals(offset+3, subTotalSecondFund_20101231)

            // Page footer
            offset = 16
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
