package org.mifos.bi.test

import org.junit.Test

class CenterCollectionSheetTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Center Collection Sheet'

    def group69 = ['69', 'group for change  to center in diff branch', 'Other Fees', 'Group Fee Default Periodic  40: 400.00', '400.0000']
    def group70 = ['70', 'group for change  to center in diff branch', 'Other Fees', 'Group Fee Default Periodic  40: 400.00', '400.0000']
    def total1 = ['TOTAL:', '0', '0', '800.0000']

    def br2Client1xxxlp1 = ['13', 'br2 client 1 xxx', 'lp1 - 32', '7', '2924.9000', '18.1000', '2943.0000']
    def sp1 = ['sp1 - 30', '400.0000']
    def total2 = ['TOTAL:', '2924.9000', '18.1000', '3343.0000']

    def summary1 = ['Summary', 'Total Amount Due:', '4143.0000']
    def summary2 = ['Collection', 'Issues']
    def summary3 = ['Amount Collected Before Meeting:', '0', 'Total Withdrawal Issued:']
    def summary4 = ['Amount Collected During Meeting:', 'Total Disbursals Issued:']
    def summary5 = ['TOTAL:', 'TOTAL:']
    def summary6 = ['NET COLLECTION:']
    def summary7 = ['Signatures:']
    def summary8 = ['Signature 1', 'Signature 2', 'Signature 3']

    @Test
    void testParams_MifosHO_All_All_20110208() {
        new PrptReport().execute () { t ->
            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/CenterCollectionSheet.prpt'
            t.reportParams = ['selected_current_date': '2011-02-07', 'selected_next_meeting_date': '2011-02-08',
                    'selected_office_id': '1', 'selected_loan_officer_id': '-1', 'selected_top_customer_hierarchy_id': '-1']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['Branch Office:', 'br2', 'Meeting Date:', '2011-02-08', 'Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(4, ['Meeting Location:', 'xxxx', 'Center Name:', 'br2 center 1'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, group69)
            t.assertRowEquals(offset+1, group70)
            t.assertRowEquals(offset+2, total1)

            // 2nd Group header
            offset = 8
            t.assertRowEquals(offset, br2Client1xxxlp1)
            t.assertRowEquals(offset+1, sp1)
            t.assertRowEquals(offset+2, total2)

            // Summary
            offset = 11
            t.assertRowEquals(offset, summary1)
            t.assertRowEquals(offset+1, summary2)
            t.assertRowEquals(offset+2, summary3)
            t.assertRowEquals(offset+3, summary4)
            t.assertRowEquals(offset+4, summary5)
            t.assertRowEquals(offset+5, summary6)
            t.assertRowEquals(offset+6, summary7)
            t.assertRowEquals(offset+7, summary8)

            // Page footer
            offset = 19
            t.assertCellEquals(offset, 1, 'v1.1/<null>')
            t.assertCellEquals(offset, 2, 'Page 1 / 1')
        }
    }

    @Test
    void testParams_br2_All_All_20110208() {
        new PrptReport().execute () { t ->
            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/CenterCollectionSheet.prpt'
            t.reportParams = ['selected_current_date': '2011-02-07', 'selected_next_meeting_date': '2011-02-08',
                    'selected_office_id': '4', 'selected_loan_officer_id': '-1', 'selected_top_customer_hierarchy_id': '-1']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['Branch Office:', 'br2', 'Meeting Date:', '2011-02-08', 'Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(4, ['Meeting Location:', 'xxxx', 'Center Name:', 'br2 center 1'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, group69)
            t.assertRowEquals(offset+1, group70)
            t.assertRowEquals(offset+2, total1)

            // 2nd Group header
            offset = 8
            t.assertRowEquals(offset, br2Client1xxxlp1)
            t.assertRowEquals(offset+1, sp1)
            t.assertRowEquals(offset+2, total2)

            // Summary
            offset = 11
            t.assertRowEquals(offset, summary1)
            t.assertRowEquals(offset+1, summary2)
            t.assertRowEquals(offset+2, summary3)
            t.assertRowEquals(offset+3, summary4)
            t.assertRowEquals(offset+4, summary5)
            t.assertRowEquals(offset+5, summary6)
            t.assertRowEquals(offset+6, summary7)
            t.assertRowEquals(offset+7, summary8)

            // Page footer
            offset = 19
            t.assertCellEquals(offset, 1, 'v1.1/<null>')
            t.assertCellEquals(offset, 2, 'Page 1 / 1')
        }
    }

    @Test
    void testParams_br2_br2LOxxx_All_20110208() {
        new PrptReport().execute () { t ->
            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/CenterCollectionSheet.prpt'
            t.reportParams = ['selected_current_date': '2011-02-07', 'selected_next_meeting_date': '2011-02-08',
                    'selected_office_id': '4', 'selected_loan_officer_id': '5', 'selected_top_customer_hierarchy_id': '-1']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['Branch Office:', 'br2', 'Meeting Date:', '2011-02-08', 'Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(4, ['Meeting Location:', 'xxxx', 'Center Name:', 'br2 center 1'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, group69)
            t.assertRowEquals(offset+1, group70)
            t.assertRowEquals(offset+2, total1)

            // 2nd Group header
            offset = 8
            t.assertRowEquals(offset, br2Client1xxxlp1)
            t.assertRowEquals(offset+1, sp1)
            t.assertRowEquals(offset+2, total2)

            // Summary
            offset = 11
            t.assertRowEquals(offset, summary1)
            t.assertRowEquals(offset+1, summary2)
            t.assertRowEquals(offset+2, summary3)
            t.assertRowEquals(offset+3, summary4)
            t.assertRowEquals(offset+4, summary5)
            t.assertRowEquals(offset+5, summary6)
            t.assertRowEquals(offset+6, summary7)
            t.assertRowEquals(offset+7, summary8)

            // Page footer
            offset = 19
            t.assertCellEquals(offset, 1, 'v1.1/<null>')
            t.assertCellEquals(offset, 2, 'Page 1 / 1')
        }
    }

    @Test
    void testParams_br2_br2LOxxx_br2center1_20110208() {
        new PrptReport().execute () { t ->
            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/CenterCollectionSheet.prpt'
            t.reportParams = ['selected_current_date': '2011-02-07', 'selected_next_meeting_date': '2011-02-08',
                    'selected_office_id': '4', 'selected_loan_officer_id': '5', 'selected_top_customer_hierarchy_id': '11']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['Branch Office:', 'br2', 'Meeting Date:', '2011-02-08', 'Loan Officer:', 'br2 LO xxx'])
            t.assertRowEquals(4, ['Meeting Location:', 'xxxx', 'Center Name:', 'br2 center 1'])

            // 1st Group header
            def offset = 5
            t.assertRowEquals(offset, group69)
            t.assertRowEquals(offset+1, group70)
            t.assertRowEquals(offset+2, total1)

            // 2nd Group header
            offset = 8
            t.assertRowEquals(offset, br2Client1xxxlp1)
            t.assertRowEquals(offset+1, sp1)
            t.assertRowEquals(offset+2, total2)

            // Summary
            offset = 11
            t.assertRowEquals(offset, summary1)
            t.assertRowEquals(offset+1, summary2)
            t.assertRowEquals(offset+2, summary3)
            t.assertRowEquals(offset+3, summary4)
            t.assertRowEquals(offset+4, summary5)
            t.assertRowEquals(offset+5, summary6)
            t.assertRowEquals(offset+6, summary7)
            t.assertRowEquals(offset+7, summary8)

            // Page footer
            offset = 19
            t.assertCellEquals(offset, 1, 'v1.1/<null>')
            t.assertCellEquals(offset, 2, 'Page 1 / 1')
        }
    }
}
