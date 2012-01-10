package org.mifos.bi.test

import org.junit.Test

class ClientSummaryTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Client Summary'
    
    def clientDetailsAndAgeHeaders = ['Client Details', 'Age']
    def maritalStatusAndGenderHeaders = ['Marital Status', 'Gender']
    def educationLevelAndPovertyStatusHeaders = ['Education Level', 'Poverty Status']
    def citizenshipAndEthinicityHeaders = ['Citizenship', 'Ethinicity']
    
    def pageFooter = ['Version 1.3', 'Page', '1 / 1']

    @Test
    void testParams_All() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/ClientSummary.prpt'
            t.reportParams = ['selected_office': '-1', 'current_date': '2011-02-02']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertRowEquals(3, ['Office:', ' ALL'])

            // Client details and Age
            def offset = 4
            t.assertRowEquals(offset, clientDetailsAndAgeHeaders)
            t.assertRowEquals(offset+1, ['Total Clients', '31', '18 - 25', '16'])
            t.assertRowEquals(offset+2, ['Active Clients', '26', '26 - 30', '0'])
            t.assertRowEquals(offset+3, ['On Hold Clients', '4', '31 - 35', '5'])
            t.assertRowEquals(offset+4, ['Closed Clients', '1', '36 - 40', '3'])
            t.assertRowEquals(offset+5, ['Active Centers', '10', '41 - 45', '2'])
            t.assertRowEquals(offset+6, ['Active Groups', '23', '46 - 50', '0'])
            t.assertRowEquals(offset+7, ['> 50', '2'])

            // Marital Status and Gender
            offset = 12
            t.assertRowEquals(offset, maritalStatusAndGenderHeaders)
            t.assertRowEquals(offset+1, ['Single', '1', 'Male', '10'])
            t.assertRowEquals(offset+2, ['Married', '1', 'Female', '21'])
            t.assertRowEquals(offset+3, ['N/A', '29', 'N/A', '0'])

            // Education Level and Poverty Status
            offset = 16
            t.assertRowEquals(offset, educationLevelAndPovertyStatusHeaders)
            t.assertRowEquals(offset+1, ['None', '2', 'VeryPoor', '13'])
            t.assertRowEquals(offset+2, ['Degree', '1', 'Poor', '17'])
            t.assertRowEquals(offset+3, ['N/A', '28', 'NonPoor', '1'])
            t.assertRowEquals(offset+4, ['N/A', '0'])

            // Citizenship and Ethinicity
            offset = 21
            t.assertRowEquals(offset, citizenshipAndEthinicityHeaders)
            t.assertRowEquals(offset+1, ['Us', '2', 'Irish', '2'])
            t.assertRowEquals(offset+2, ['Ghana', '1', 'European', '0'])
            t.assertRowEquals(offset+3, ['N/A', '28', 'Arabic', '1'])
            t.assertRowEquals(offset+4, ['N/A', '28'])

            // Page footer
            offset = 26
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/ClientSummary.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'current_date': '2011-02-02']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Report params
            t.assertRowEquals(3, ['Office:', 'br2'])

            // Client details and Age
            def offset = 4
            t.assertRowEquals(offset, clientDetailsAndAgeHeaders)
            t.assertRowEquals(offset+1, ['Total Clients', '8', '18 - 25', '5'])
            t.assertRowEquals(offset+2, ['Active Clients', '4', '26 - 30', '0'])
            t.assertRowEquals(offset+3, ['On Hold Clients', '4', '31 - 35', '1'])
            t.assertRowEquals(offset+4, ['Closed Clients', '0', '36 - 40', '0'])
            t.assertRowEquals(offset+5, ['Active Centers', '2', '41 - 45', '1'])
            t.assertRowEquals(offset+6, ['Active Groups', '3', '46 - 50', '0'])
            t.assertRowEquals(offset+7, ['> 50', '1'])

            // Marital Status and Gender
            offset = 12
            t.assertRowEquals(offset, maritalStatusAndGenderHeaders)
            t.assertRowEquals(offset+1, ['Single', '0', 'Male', '4'])
            t.assertRowEquals(offset+2, ['Married', '0', 'Female', '4'])
            t.assertRowEquals(offset+3, ['N/A', '8', 'N/A', '0'])

            // Education Level and Poverty Status
            offset = 16
            t.assertRowEquals(offset, educationLevelAndPovertyStatusHeaders)
            t.assertRowEquals(offset+1, ['None', '1', 'VeryPoor', '4'])
            t.assertRowEquals(offset+2, ['Degree', '0', 'Poor', '4'])
            t.assertRowEquals(offset+3, ['N/A', '7', 'NonPoor', '0'])
            t.assertRowEquals(offset+4, ['N/A', '0'])

            // Citizenship and Ethinicity
            offset = 21
            t.assertRowEquals(offset, citizenshipAndEthinicityHeaders)
            t.assertRowEquals(offset+1, ['Us', '1', 'Irish', '1'])
            t.assertRowEquals(offset+2, ['Ghana', '0', 'European', '0'])
            t.assertRowEquals(offset+3, ['N/A', '7', 'Arabic', '0'])
            t.assertRowEquals(offset+4, ['N/A', '7'])

            // Page footer
            offset = 26
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
