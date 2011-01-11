package org.mifos.bi.test;

import org.junit.Test

class LoanOfficerDetailedReportTest {

    def reportPath = 'reports/standardReports/prpts/LoanOfficerDetailed.prpt'
    def reportName = 'Loan Officer Detailed'
    def branch = ['Branch:', 'br2']
    def gender = ['Gender:', 'Female']

    def detailsHeader1 = ['Group Formation', 'Key Dates']
    def numOfClientsAddedToDate_JoinedMFI = ['# of Clients added(To Date)', '3', 'Joined MFI']
    def numOfClientsAddedThisPeriod_BecameLO = ['# of Clients added(This Period)', '3', 'Became Loan Officer']
    def numOfGroupsAddedToDate_BranchMemberships = ['# of groups added(To Date)', '3', 'Branch Memberships']
    def numOfGroupsAddedThisPeriod_branchMempership_br2 = ['# of groups added(This Period)', '3', 'br2', '2010-07-20 - Current']
    def numOfDropoutClientsToDate_leftMFI = ['# of dropout clients(To Date)', '0', 'Left MFI']
    def numOfDropoutClientsThisPeriod = ['# of dropout clients(This Period)', '0']

    def detailsHeader2 = ['Client Summary', 'Account Summary']
    def numOfCentersManaged_numOfActiveLoans = ['# of Centers managed', '2', '# of active loans', '1']
    def numOfGroups_Principal_20100815 = ['# of groups', '4', 'Principal Amount Outstanding', '2924.9000']
    def numOfGroups_Principal = ['# of groups', '5', 'Principal Amount Outstanding', '2924.9000']
    def numOfClients_Interest = ['# of Clients', '4', 'Interest Amount Outstanding', '18.1000']
    def numOfClientsWithLoans = ['# of Clients with loans', '1']
    def portfolioAtRisk = ['Portfolio at Risk %', '100.00']
    def numOfClientsWithSavings = ['# of Clients with savings', '2']
    def numOfLoansWrittenOff = ['# of loans written off', '0']
    def dormantClients = ['Dormant clients', '3']
    def amountOfLoansWrittenOff = ['Amount of loans written off', '0.0000']
    def totalSavings_20100815 = ['Total Savings', '1977.1000']
    def totalSavings = ['Total Savings', '1998.8000']
    def voluntarySavings_20100815 = ['Voluntary Savings', '777.0000']
    def voluntarySavings = ['Voluntary Savings', '792.7000']
    def mandatorySavings_20100815 = ['Mandatory Savings', '1200.1000']
    def mandatorySavings = ['Mandatory Savings', '1206.1000']

    def detailsHeader3 = ['Aging in Arrears by Week']
    def detailsHeader3_4 = ['# of Clients', '# of Loans', 'Arrears', 'Principal Outstanding']
    def weeksInArrears1 = ['1 Week in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears2_20100815 = ['2 Weeks in Arrears', '1', '1', '781.1000', '2924.9000']
    def weeksInArrears2 = ['2 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears3 = ['3 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears4 = ['4 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears5 = ['5 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears6 = ['6 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears7 = ['7 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears8 = ['8 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears9_20100815 = ['9 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears9 = ['9 Weeks in Arrears', '1', '1', '2924.9000', '2924.9000']
    def weeksInArrears10 = ['10 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears11 = ['11 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears12 = ['12 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears12p = ['12+ Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def arrearsTotal_20100815 = ['Total', '1', '1', '781.1000', '2924.9000']
    def arrearsTotal = ['Total', '1', '1', '2924.9000', '2924.9000']

    def detailsHeader4 = ['Aging in Arrears by Days']
    def daysInArrears1_20100815 = ['0 to 30 Days in Arrears', '1', '1', '781.1000', '2924.9000']
    def daysInArrears1 = ['0 to 30 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears2_20100815 = ['30 to 60 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears2 = ['30 to 60 Days in Arrears', '1', '1', '2924.9000', '2924.9000']
    def daysInArrears3 = ['60 to 90 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears4 = ['90 to 180 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears5 = ['> 180 Days in Arrears', '0', '0', '0.0000', '0.0000']

    def detailsHeader5 = ['Summary of Centers (Groups) Managed']
    def detailsHeader5a = ['Name', 'Clients', 'Principal Outstanding', 'Center Savings', 'Arrears Amount', 'PAR']
    def center1_20100815 = ['br2 center 1', '3', '2924.9000', '1200.1000', '781.1000', '100.00']
    def center1 = ['br2 center 1', '3', '2924.9000', '1206.1000', '2924.9000', '100.00']
    def center2_20100815 = ['center with savings a/c', '0', '0.0000', '777.0000', '0.0000', '0.00']
    def center2 = ['center with savings a/c', '0', '0.0000', '792.7000', '0.0000', '0.00']
    def center3 = ['group w/o center hierarchy', '1', '0.0000', '0.0000', '0.0000', '0.00']
    def centerTotal_20100815 = ['Total', '4', '2924.9000', '1977.1000', '781.1000', '-']
    def centerTotal = ['Total', '4', '2924.9000', '1998.8000', '2924.9000', '-']

    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_br2_br2LOxxx_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'selected_loan_officer': '5', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['MFI Name:', 'Mifos HO', 'ID:'])
            t.assertRowEquals(3, ['TimePeriod:'])
            t.assertRowEquals(4, ['LoanOfficer:', 'br2 LO xxx'])
            t.assertRowEquals(5, branch)
            t.assertCellEquals(6, 1, 'Reportcreationdate:')
            t.assertRowEquals(7, gender)

            // 1st Details header
            def offset = 8
            t.assertRowEquals(offset, detailsHeader1)
            // Details
            t.assertRowEquals(offset+1, numOfClientsAddedToDate_JoinedMFI)
            t.assertRowEquals(offset+2, numOfClientsAddedThisPeriod_BecameLO)
            t.assertRowEquals(offset+3, numOfGroupsAddedToDate_BranchMemberships)
            t.assertRowEquals(offset+4, numOfGroupsAddedThisPeriod_branchMempership_br2)
            t.assertRowEquals(offset+5, numOfDropoutClientsToDate_leftMFI)
            t.assertRowEquals(offset+6, numOfDropoutClientsThisPeriod)

            // 2nd Details header
            offset = 15
            t.assertRowEquals(offset, detailsHeader2)
            // Details
            t.assertRowEquals(offset+1, numOfCentersManaged_numOfActiveLoans)
            t.assertRowEquals(offset+2, numOfGroups_Principal)
            t.assertRowEquals(offset+3, numOfClients_Interest)
            t.assertRowEquals(offset+4, numOfClientsWithLoans)
            t.assertRowEquals(offset+5, portfolioAtRisk)
            t.assertRowEquals(offset+6, numOfClientsWithSavings)
            t.assertRowEquals(offset+7, numOfLoansWrittenOff)
            t.assertRowEquals(offset+8, dormantClients)
            t.assertRowEquals(offset+9, amountOfLoansWrittenOff)
            t.assertRowEquals(offset+10, totalSavings)
            t.assertRowEquals(offset+11, voluntarySavings)
            t.assertRowEquals(offset+12, mandatorySavings)

            // 3rd Details header
            offset = 28
            t.assertRowEquals(offset, detailsHeader3)
            t.assertRowEquals(offset+1, detailsHeader3_4)
            // Details
            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal)

            //4th Details header
            offset = 44
            t.assertRowEquals(offset, detailsHeader4)
            t.assertRowEquals(offset+1, detailsHeader3_4)
            // Details
            t.assertRowEquals(offset+2, daysInArrears1)
            t.assertRowEquals(offset+3, daysInArrears2)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal)

            // 5th Details header
            offset = 52
            t.assertRowEquals(offset, detailsHeader5)
            t.assertRowEquals(offset+1, detailsHeader5a)
            // Details
            t.assertRowEquals(offset+2, center1)
            t.assertRowEquals(offset+3, center2)
            t.assertRowEquals(offset+4, center3)
            t.assertRowEquals(offset+5, centerTotal)

            // Page footer
            offset = 58
            t.assertRowEquals(offset, pageFooter)
        }
    }

    @Test
    void testParams_br2_br2LOxxx_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'selected_loan_officer': '5', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertRowEquals(2, ['MFI Name:', 'Mifos HO', 'ID:'])
            t.assertRowEquals(3, ['TimePeriod:'])
            t.assertRowEquals(4, ['LoanOfficer:', 'br2 LO xxx'])
            t.assertRowEquals(5, branch)
            t.assertCellEquals(6, 1, 'Reportcreationdate:')
            t.assertRowEquals(7, gender)

            // 1st Details header
            def offset = 8
            t.assertRowEquals(offset, detailsHeader1)
            // Details
            t.assertRowEquals(offset+1, numOfClientsAddedToDate_JoinedMFI)
            t.assertRowEquals(offset+2, numOfClientsAddedThisPeriod_BecameLO)
            t.assertRowEquals(offset+3, numOfGroupsAddedToDate_BranchMemberships)
            t.assertRowEquals(offset+4, numOfGroupsAddedThisPeriod_branchMempership_br2)
            t.assertRowEquals(offset+5, numOfDropoutClientsToDate_leftMFI)
            t.assertRowEquals(offset+6, numOfDropoutClientsThisPeriod)

            // 2nd Details header
            offset = 15
            t.assertRowEquals(offset, detailsHeader2)
            // Details
            t.assertRowEquals(offset+1, numOfCentersManaged_numOfActiveLoans)
            t.assertRowEquals(offset+2, numOfGroups_Principal_20100815)
            t.assertRowEquals(offset+3, numOfClients_Interest)
            t.assertRowEquals(offset+4, numOfClientsWithLoans)
            t.assertRowEquals(offset+5, portfolioAtRisk)
            t.assertRowEquals(offset+6, numOfClientsWithSavings)
            t.assertRowEquals(offset+7, numOfLoansWrittenOff)
            t.assertRowEquals(offset+8, dormantClients)
            t.assertRowEquals(offset+9, amountOfLoansWrittenOff)
            t.assertRowEquals(offset+10, totalSavings_20100815)
            t.assertRowEquals(offset+11, voluntarySavings_20100815)
            t.assertRowEquals(offset+12, mandatorySavings_20100815)

            // 3rd Details header
            offset = 28
            t.assertRowEquals(offset, detailsHeader3)
            t.assertRowEquals(offset+1, detailsHeader3_4)
            // Details
            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2_20100815)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9_20100815)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal_20100815)

            //4th Details header
            offset = 44
            t.assertRowEquals(offset, detailsHeader4)
            t.assertRowEquals(offset+1, detailsHeader3_4)
            // Details
            t.assertRowEquals(offset+2, daysInArrears1_20100815)
            t.assertRowEquals(offset+3, daysInArrears2_20100815)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal_20100815)

            // 5th Details header
            offset = 52
            t.assertRowEquals(offset, detailsHeader5)
            t.assertRowEquals(offset+1, detailsHeader5a)
            // Details
            t.assertRowEquals(offset+2, center1_20100815)
            t.assertRowEquals(offset+3, center2_20100815)
            t.assertRowEquals(offset+4, center3)
            t.assertRowEquals(offset+5, centerTotal_20100815)

            // Page footer
            offset = 58
            t.assertRowEquals(offset, pageFooter)
        }
    }
}
