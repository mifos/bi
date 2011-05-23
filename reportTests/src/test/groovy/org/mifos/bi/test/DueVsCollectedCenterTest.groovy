package org.mifos.bi.test

import org.junit.Test

class DueVsCollectedCenterTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Due vs Collected by Center'
    def columnHeader = ['Due', 'Collections*']
    def detailsHeader = ['Repayment Date', 'Principal', 'Interest', 'Fees / Penalties', 'Arrears Principal', 'Arrears Interest', 'Principal', 'Interest', 'Fees / Penalties', 'Arrears Principal', 'Arrears Interest']

    def firstLoanOfficer = ['Center:', 'br2_center_1'] 
    def detailsbr2_20100721 = ['2010-07-21', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '75.1000', '2.9000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100803 = ['2010-08-03', '428.1000', '2.9000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100810 = ['2010-08-10', '428.1000', '2.9000', '0.0000', '353.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100817 = ['2010-08-17', '428.1000', '2.9000', '0.0000', '781.1000', '2.9000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100824 = ['2010-08-24', '428.1000', '2.9000', '0.0000', '1209.2000', '5.8000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100831 = ['2010-08-31', '428.1000', '2.9000', '0.0000', '1637.3000', '8.7000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100907 = ['2010-09-07', '428.1000', '2.9000', '0.0000', '2065.4000', '11.6000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100914 = ['2010-09-14', '431.4000', '3.6000', '0.0000', '2493.5000', '14.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000']
    def totalbr2_20100930 = ['Total', '3000.0000', '21.0000', '-', '-', '-', '75.1000', '2.9000', '-', '-', '-']
    def totalbr2_20100815 = ['Total', '856.2000', '5.8000', '-', '-', '-', '75.1000', '2.9000', '-', '-', '-']

    def collectionsFootnote = ['* These amounts do not include adjusted nor reversed payments']
    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_br2_All_All_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedCenter.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'selected_center': '-1', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(3, 2, 'Office:')
            t.assertCellEquals(3, 3, 'br2')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')
            t.assertCellEquals(4, 2, 'Loan Officer:')
            t.assertCellEquals(4, 3, ' All')
            t.assertRowEquals(5, ['Center:', 'All'])

            // Group header
            def offset = 6
            t.assertRowEquals(offset, firstLoanOfficer)
            // column header
            t.assertRowEquals(offset+1, columnHeader)
            // Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+4, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+5, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(offset+6, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(offset+7, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(offset+8, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(offset+9, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(offset+10, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(offset+11, totalbr2_20100930)

            // Page footer
            offset = 18
            t.assertRowEquals(offset, collectionsFootnote)
            t.assertRowEquals(offset+1, pageFooter)
            t.assertCellEquals(offset+2, 1, 'Printed by:')
            t.assertCellEquals(offset+2, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_br2LOxxx_All_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedCenter.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '5', 'selected_center': '-1',  'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(3, 2, 'Office:')
            t.assertCellEquals(3, 3, 'br2')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')
            t.assertCellEquals(4, 2, 'Loan Officer:')
            t.assertCellEquals(4, 3, 'br2 LO xxx')
            t.assertRowEquals(5, ['Center:', 'All'])

            // Group header
            def offset = 6
            t.assertRowEquals(offset, firstLoanOfficer)
            // column header
            t.assertRowEquals(offset+1, columnHeader)
            // Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+4, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+5, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(offset+6, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(offset+7, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(offset+8, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(offset+9, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(offset+10, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(offset+11, totalbr2_20100930)        

            // Page footer
            offset = 18
            t.assertRowEquals(offset, collectionsFootnote)
            t.assertRowEquals(offset+1, pageFooter)
            t.assertCellEquals(offset+2, 1, 'Printed by:')
            t.assertCellEquals(offset+2, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_br2LOxxx_br2_center1_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedCenter.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '5', 'selected_center': '11',  'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(3, 2, 'Office:')
            t.assertCellEquals(3, 3, 'br2')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-08-15')
            t.assertCellEquals(4, 2, 'Loan Officer:')
            t.assertCellEquals(4, 3, 'br2 LO xxx')
            t.assertRowEquals(5, ['Center:', 'br2_center_1'])

            // Group header
            def offset = 6
            t.assertRowEquals(offset, firstLoanOfficer)
            // column header
            t.assertRowEquals(offset+1, columnHeader)
            // Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+4, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+5, detailsbr2_20100810)
            // 2nd Group footer
            t.assertRowEquals(offset+6, totalbr2_20100815)

            // Page footer
            offset = 13
            t.assertRowEquals(offset, collectionsFootnote)
            t.assertRowEquals(offset+1, pageFooter)
            t.assertCellEquals(offset+2, 1, 'Printed by:')
            t.assertCellEquals(offset+2, 2, 'On:')
        }
    }
}
