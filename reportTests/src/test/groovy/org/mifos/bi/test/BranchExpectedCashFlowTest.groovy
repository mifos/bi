package org.mifos.bi.test

import org.junit.Test

class BranchExpectedCashFlowTest {

    def mfiName = 'Mifos HO'
    def reportPath = 'reports/standardReports/prpts/BranchExpectedCashFlow.prpt'
    def reportName = 'Branch Expected Cash Flow';
    def detailsHeaderA = ['Date', 'Expected Cash In', 'Expected Cash Out', 'Net Expected Cash Flow']
    // TODO def detailsHeaderB = ['Principal', 'Interest', 'Loan Fees', 'Client Fees', 'Loan Disbursals']
    def detailsHeaderB1 = 'Principal'
    def detailsHeaderB2 = 'Interest'
    def detailsHeaderB3 = 'Loan Fees'
    def detailsHeaderB4 = 'Client Fees'

    def firstOffice = ['Office:', 'BO 1']
    def detailsBO1_20100708 = ['2010-07-08', '0.0000', '0.0000', '0.0000', '0.0000', '15000.0000', '-15000.0000']
    def detailsBO1_20100715 = ['2010-07-15', '1760.5000', '14.5000', '0.0000', '0.0000', '0.0000', '1775.0000']
    def detailsBO1_20100716 = ['2010-07-16', '0.0000', '0.0000', '0.0000', '0.0000', '3000.0000', '-3000.0000']
    def detailsBO1_20100718 = ['2010-07-18', '0.0000', '0.0000', '0.0000', '0.0000', '3000.0000', '-3000.0000']
    def detailsBO1_20100722 = ['2010-07-22', '1760.5000', '14.5000', '0.0000', '0.0000', '9000.0000', '-7225.0000']
    def detailsBO1_20100724 = ['2010-07-24', '0.0000', '0.0000', '0.0000', '0.0000', '6000.0000', '-6000.0000']
    def detailsBO1_20100728 = ['2010-07-28', '0.0000', '0.0000', '0.0000', '0.0000', '3000.0000', '-3000.0000']
    def detailsBO1_20100729 = ['2010-07-29', '2188.6000', '17.4000', '0.0000', '0.0000', '3000.0000', '-794.0000']
    def detailsBO1_20100731 = ['2010-07-31', '666.2000', '5.8000', '0.0000', '0.0000', '0.0000', '672.0000']
    def totalBO1_20100701_20100731 = ['Total', '6375.8000', '52.2000', '0.0000', '0.0000', '42000.0000', '-35572.0000']
    def totalBO1_20100720_20100731 = ['Total', '4615.3000', '37.7000', '0.0000', '0.0000', '21000.0000', '-16347.0000']

    def secondOffice = ['Office:', 'br2']
    def detailsbr2_20100721 = ['2010-07-21', '0.0000', '0.0000', '0.0000', '0.0000', '3000.0000', '-3000.0000']
    def detailsbr2_20100728 = ['2010-07-28', '0.0000', '0.0000', '0.0000', '0.0000', '8000.0000', '-8000.0000']
    def totalbr2_20100701_20100731 = ['Total', '0.0000', '0.0000', '0.0000', '0.0000', '11000.0000', '-11000.0000']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_All_20100701_20100731() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'start_date': '2010-07-01', 'end_date': '2010-07-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            t.assertCellEquals(4, 2, '2010-07-31')
            t.assertRowEquals(5, ['Office:', ' All'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstOffice)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeaderA)
            // TODO t.assertRowEquals(offset+2, detailsHeaderB)
            t.assertCellEquals(offset+2, 1, detailsHeaderB1)
            t.assertCellEquals(offset+2, 2, detailsHeaderB2)
            t.assertCellEquals(offset+2, 3, detailsHeaderB3)
            t.assertCellEquals(offset+2, 4, detailsHeaderB4)
            t.assertRowEquals(offset+3, detailsBO1_20100708)
            t.assertRowEquals(offset+4, detailsBO1_20100715)
            t.assertRowEquals(offset+5, detailsBO1_20100716)
            t.assertRowEquals(offset+6, detailsBO1_20100718)
            t.assertRowEquals(offset+7, detailsBO1_20100722)
            t.assertRowEquals(offset+8, detailsBO1_20100724)
            t.assertRowEquals(offset+9, detailsBO1_20100728)
            t.assertRowEquals(offset+10, detailsBO1_20100729)
            t.assertRowEquals(offset+11, detailsBO1_20100731)
            // 1st Group footer
            t.assertRowEquals(offset+12, totalBO1_20100701_20100731)

            // 2nd Group header
            offset = 19
            t.assertRowEquals(offset, secondOffice)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeaderA)
            // TODO t.assertRowEquals(offset+2, detailsHeaderB)
            t.assertCellEquals(offset+2, 1, detailsHeaderB1)
            t.assertCellEquals(offset+2, 2, detailsHeaderB2)
            t.assertCellEquals(offset+2, 3, detailsHeaderB3)
            t.assertCellEquals(offset+2, 4, detailsHeaderB4)
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            t.assertRowEquals(offset+4, detailsbr2_20100728)
            // 2nd Group footer
            t.assertRowEquals(offset+5, totalbr2_20100701_20100731)

            // Page footer
            offset = 25
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_BO1_20100701_20100731() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.3.2.', 'start_date': '2010-07-01', 'end_date': '2010-07-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            t.assertCellEquals(4, 2, '2010-07-31')
            t.assertRowEquals(5, ['Office:', 'BO 1'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstOffice)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeaderA)
            // TODO t.assertRowEquals(offset+2, detailsHeaderB)
            t.assertCellEquals(offset+2, 1, detailsHeaderB1)
            t.assertCellEquals(offset+2, 2, detailsHeaderB2)
            t.assertCellEquals(offset+2, 3, detailsHeaderB3)
            t.assertCellEquals(offset+2, 4, detailsHeaderB4)
            t.assertRowEquals(offset+3, detailsBO1_20100708)
            t.assertRowEquals(offset+4, detailsBO1_20100715)
            t.assertRowEquals(offset+5, detailsBO1_20100716)
            t.assertRowEquals(offset+6, detailsBO1_20100718)
            t.assertRowEquals(offset+7, detailsBO1_20100722)
            t.assertRowEquals(offset+8, detailsBO1_20100724)
            t.assertRowEquals(offset+9, detailsBO1_20100728)
            t.assertRowEquals(offset+10, detailsBO1_20100729)
            t.assertRowEquals(offset+11, detailsBO1_20100731)
            // 1st Group footer
            t.assertRowEquals(offset+12, totalBO1_20100701_20100731)

            // Page footer
            offset = 19
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_20100701_20100731() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-07-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            t.assertCellEquals(4, 2, '2010-07-31')
            t.assertRowEquals(5, ['Office:', 'br2'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, secondOffice)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeaderA)
            // TODO t.assertRowEquals(offset+2, detailsHeaderB)
            t.assertCellEquals(offset+2, 1, detailsHeaderB1)
            t.assertCellEquals(offset+2, 2, detailsHeaderB2)
            t.assertCellEquals(offset+2, 3, detailsHeaderB3)
            t.assertCellEquals(offset+2, 4, detailsHeaderB4)
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            t.assertRowEquals(offset+4, detailsbr2_20100728)
            // 1st Group footer
            t.assertRowEquals(offset+5, totalbr2_20100701_20100731)

            // Page footer
            offset = 12
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_All_20100720_20100731() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'start_date': '2010-07-20', 'end_date': '2010-07-31']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            t.assertCellEquals(3, 2, '2010-07-20')
            t.assertCellEquals(4, 1, 'To:')
            t.assertCellEquals(4, 2, '2010-07-31')
            t.assertRowEquals(5, ['Office:', ' All'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstOffice)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeaderA)
            // TODO t.assertRowEquals(offset+2, detailsHeaderB)
            t.assertCellEquals(offset+2, 1, detailsHeaderB1)
            t.assertCellEquals(offset+2, 2, detailsHeaderB2)
            t.assertCellEquals(offset+2, 3, detailsHeaderB3)
            t.assertCellEquals(offset+2, 4, detailsHeaderB4)
            t.assertRowEquals(offset+3, detailsBO1_20100722)
            t.assertRowEquals(offset+4, detailsBO1_20100724)
            t.assertRowEquals(offset+5, detailsBO1_20100728)
            t.assertRowEquals(offset+6, detailsBO1_20100729)
            t.assertRowEquals(offset+7, detailsBO1_20100731)
            // 1st Group footer
            t.assertRowEquals(offset+8, totalBO1_20100720_20100731)

            // 2nd Group header
            offset = 15
            t.assertRowEquals(offset, secondOffice)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeaderA)
            // TODO t.assertRowEquals(offset+2, detailsHeaderB)
            t.assertCellEquals(offset+2, 1, detailsHeaderB1)
            t.assertCellEquals(offset+2, 2, detailsHeaderB2)
            t.assertCellEquals(offset+2, 3, detailsHeaderB3)
            t.assertCellEquals(offset+2, 4, detailsHeaderB4)
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            t.assertRowEquals(offset+4, detailsbr2_20100728)
            // 2nd Group footer
            t.assertRowEquals(offset+5, totalbr2_20100701_20100731)

            // Page footer
            offset = 21
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}

