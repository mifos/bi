package org.mifos.bi.test

import org.junit.Test

class GroupsInformationTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Groups Information'
    
    def summaryHeader = ['Branch Name', 'No. of Centers', 'No. of Active Groups', 'No. of On Hold Groups', 'No. of Closed Groups']
    def detailsHeader = ['External ID',	'Center Name', 'Group Name', 'System ID', 'Formation Date', 'Group Size', 'Status', 'Closed Reason', 'Closed Date', 'Loan Officer']
    
    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_All() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/GroupsInformation.prpt'
            t.reportParams = ['selected_office': '-1']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertRowEquals(3, ['Office:', ' ALL'])

            // Summary sub-report 
            def offset = 4
            t.assertRowEquals(offset, summaryHeader)
            t.assertRowEquals(offset+1, ['All Branches', '10', '23', '8', '0'])

            // Details sub-report
            offset = 6
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, ['BO1 group 1 toh', '0003-000000026', '2010-07-25', '0', 'Active', 'br1 lo 1 smith'])
            t.assertRowEquals(offset+25, ['center dw1', 'group dw1 2', '0003-000000005', '2010-07-02', '6', 'Active', 'br1 lo 1 smith'])
            t.assertRowEquals(offset+30, ['center with savings a/c', 'group for change to  center in diff branch', '0003-000000057', '2010-08-07', '0', 'On Hold', 'br2 LO xxx'])

            // Page footer
            offset = 38
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/GroupsInformation.prpt'
            t.reportParams = ['selected_office': '1.1.1.']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertRowEquals(3, ['Office:', ' br2'])

            // Summary sub-report 
            def offset = 4
            t.assertRowEquals(offset, summaryHeader)
            t.assertRowEquals(offset+1, ['br2', '2', '3', '7', '0'])

            // Details sub-report
            offset = 6
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, ['group w/o center hier  xfer branch', '0003-000000046', '2010-07-29', '1', 'On Hold'])
            t.assertRowEquals(offset+6, ['br2 center 1', 'br2 group 1', '0004-000000012', '2010-07-20', '3', 'Active', 'br2 LO xxx'])
            t.assertRowEquals(offset+10, ['center with savings a/c', 'group for change to  center in diff branch', '0003-000000057', '2010-08-07', '0', 'On Hold', 'br2 LO xxx'])

            // Page footer
            offset = 17
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
