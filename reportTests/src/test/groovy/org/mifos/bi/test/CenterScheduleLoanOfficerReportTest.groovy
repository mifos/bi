package org.mifos.bi.test

import org.junit.Test

class CenterScheduleLoanOfficerReportTest {

    def reportPath = 'reports/standardReports/prpts/CenterScheduleLoanOfficer.prpt'

    def mfiName = 'Mifos HO'
    def reportName = 'Center Schedule by Loan Officer'

    def reportHeader = ['Loan Officer', 'Meeting Day', 'Center', 'Group', 'Other']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_MifosHO_20110211_20110225() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['branch_filter': '1.1.', 'from_date': '2011-02-11', 'to_date': '2011-02-25']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertRowEquals(3, ['Office:', 'Mifos HO'])
            t.assertCellEquals(4, 1, 'From:')
            // TODO t.assertCellEquals(4, 2, '2010-02-11')
            t.assertCellEquals(5, 1, 'To:')
            // TODO t.assertCellEquals(5, 2, '2010-02-25')

            // Report header
            t.assertRowEquals(6, reportHeader)

            // Report details
            def offset = 7
            t.assertRowEquals(offset, ['br1 lo 1 smith', '\"Monday, 2011-02-14\"', 'center dw1', 'group going back to a center ..'])
            t.assertRowEquals(offset+1, [' ', '\"Wednesday, 2011-02-16\"', 'center 3', 'group move out of center?'])
            t.assertRowEquals(offset+2, [' ', ' ', 'center 3', 'group redo loans'])
            t.assertRowEquals(offset+3, [' ', '\"Thursday, 2011-02-17\"', 'center dw1', 'group dw1 1'])
            t.assertRowEquals(offset+4, [' ', ' ', 'center dw1', 'group dw1 2'])
            t.assertRowEquals(offset+5, [' ', ' ', 'center dw1', 'group dw1 3'])
            t.assertRowEquals(offset+6, [' ', '\"Monday, 2011-02-21\"', 'center dw1', 'group going back to a center ..'])
            t.assertRowEquals(offset+7, [' ', '\"Wednesday, 2011-02-23\"', 'center 3', 'group move out of center?'])
            t.assertRowEquals(offset+8, [' ', ' ', 'center 3', 'group redo loans'])
            t.assertRowEquals(offset+9, [' ', '\"Thursday, 2011-02-24\"', 'center dw1', 'group dw1 1'])
            t.assertRowEquals(offset+10, [' ', ' ', 'center dw1', 'group dw1 2'])
            t.assertRowEquals(offset+11, [' ', ' ', 'center dw1', 'group dw1 3'])
            t.assertRowEquals(offset+12, ['No. of Centers: 2', 'No. of Groups: 6'])

            offset = 50
            t.assertRowEquals(offset, ['Total No. of Centers: 8', 'Total No. of Groups: 19'])
            
            // Page footer
            offset = 51
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed By:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['branch_filter': '1.1.1.', 'from_date': '2011-01-10', 'to_date': '2011-01-17']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertRowEquals(3, ['Office:', 'br2'])
            t.assertCellEquals(4, 1, 'From:')
            // TODO t.assertCellEquals(4, 2, '2010-02-11')
            t.assertCellEquals(5, 1, 'To:')
            // TODO t.assertCellEquals(5, 2, '2010-02-25')

            // Report header
            t.assertRowEquals(6, reportHeader)

            // Report details
            def offset = 7
            t.assertRowEquals(offset, ['br2 LO xxx', '\"Monday, 2011-01-10\"', 'center with savings a/c', 'group for change to center in ..'])
            t.assertRowEquals(offset+1, [' ', '\"Tuesday, 2011-01-11\"', 'br2 center 1', 'br2 group 1'])
            t.assertRowEquals(offset+2, [' ', ' ', 'br2 center 1', 'br2 group 2'])
            t.assertRowEquals(offset+3, [' ', ' ', 'br2 center 1', 'group for change to center in ..'])
            t.assertRowEquals(offset+4, [' ', ' ', 'br2 center 1', 'group for change to center in ..'])
            t.assertRowEquals(offset+5, [' ', '\"Monday, 2011-01-17\"', 'center with savings a/c', 'group for change to center in ..'])
            t.assertRowEquals(offset+6, ['No. of Centers: 2', 'No. of Groups: 5'])

            offset = 14
            t.assertRowEquals(offset, ['Total No. of Centers: 2', 'Total No. of Groups: 5'])
            
            // Page footer
            offset = 15
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed By:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
