package org.mifos.bi.test;

import org.junit.Test

class LoanOfficerDetailedReportTest {

    def branch = ['Branch', ':', 'br2']
    def gender = ['Gender', ':', 'Female']

    def detailsHeader1 = ['Group Formation', 'Key Dates']
    def numOfClientsAddedToDate_JoinedMFI = ['# of Clients added(To Date)', '3', 'Joined MFI']
    def numOfClientsAddedThisPeriod_BecameLO = ['# of Clients added(This Period)', '3', 'Became Loan Officer']
    def numOfGroupsAddedToDate_BranchMemberships = ['# of groups added(To Date)', '3', 'Branch Memberships']
    def numOfGroupsAddedThisPeriod = ['# of groups added(This Period)', '3']
    def branchMempership_br2 = ['br2', '2010-07-20 - Current']
    def numOfDropoutClientsToDate = ['# of dropout clients(To Date)', '0']
    def leftMFI = ['Left MFI']
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
    def detailsHeader3_4 = ['# of Clients', '# of Loans', 'Arrears (P+I)', 'Principal Outstanding']
    def weeksInArrears1 = ['1 Week in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears2_20100815 = ['2 Weeks in Arrears', '1', '1', '784.0000', '2943.0000']
    def weeksInArrears2 = ['2 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears3 = ['3 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears4 = ['4 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears5 = ['5 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears6 = ['6 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears7 = ['7 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears8 = ['8 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears9_20100815 = ['9 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears9 = ['9 Weeks in Arrears', '1', '1', '2943.0000', '2943.0000']
    def weeksInArrears10 = ['10 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears11 = ['11 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears12 = ['12 Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def weeksInArrears12p = ['12+ Weeks in Arrears', '0', '0', '0.0000', '0.0000']
    def arrearsTotal_20100815 = ['Total', '1', '1', '784.0000', '2943.0000']
    def arrearsTotal = ['Total', '1', '1', '2943.0000', '2943.0000']

    def detailsHeader4 = ['Aging in Arrears by Days']
    def daysInArrears1_20100815 = ['0 to 30 Days in Arrears', '1', '1', '784.0000', '2943.0000']
    def daysInArrears1 = ['0 to 30 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears2_20100815 = ['30 to 60 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears2 = ['30 to 60 Days in Arrears', '1', '1', '2943.0000', '2943.0000']
    def daysInArrears3 = ['60 to 90 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears4 = ['90 to 180 Days in Arrears', '0', '0', '0.0000', '0.0000']
    def daysInArrears5 = ['> 180 Days in Arrears', '0', '0', '0.0000', '0.0000']

    def detailsHeader5 = ['Summary of Centers (Groups) Managed']
    def detailsHeader5a = ['Name', 'Clients', 'Principal', 'Center', 'Arrears', 'PAR']
    def detailsHeader5b = ['Outstanding', 'Savings', 'Amount']
    def center1_20100815 = ['br2 center 1', '3', '2924.9000', '1200.1000', '781.1000', '100.00']
    def center1 = ['br2 center 1', '3', '2924.9000', '1206.1000', '2924.9000', '100.00']
    def center2_20100815 = ['center with savings a/c', '0', '0.0000', '777.0000', '0.0000', '0.00']
    def center2 = ['center with savings a/c', '0', '0.0000', '792.7000', '0.0000', '0.00']
    def center3 = ['group w/o center hierarchy', '1', '0.0000', '0.0000', '0.0000', '0.00']
    def centerTotal_20100815 = ['Total', '4', '2924.9000', '1977.1000', '781.1000', '-']
    def centerTotal = ['Total', '4', '2924.9000', '1998.8000', '2924.9000', '-']

    def pageFooter = ['Version 1.1', 'Page 1 / 1']

    @Test
    void testParams_br2_br2LOxxx_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerDetailedReport.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'selected_loan_officer': '5', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, ['Loan Officer Detailed Report'])

            // Page header
            t.assertRowEquals(2, ['LoanOfficer', ':', 'br2 LO xxx', 'ID', ':'])
            t.assertRowEquals(3, ['TimePeriod', ':'])
            t.assertRowEquals(4, branch)
            t.assertCellEquals(5, 1, 'Reportcreationdate')
            t.assertCellEquals(5, 2, ':')
            t.assertRowEquals(6, gender)

            // 1st Details header
            t.assertRowEquals(7, detailsHeader1)
            // Details
            t.assertRowEquals(8, numOfClientsAddedToDate_JoinedMFI)
            t.assertRowEquals(9, numOfClientsAddedThisPeriod_BecameLO)
            t.assertRowEquals(10, numOfGroupsAddedToDate_BranchMemberships)
            t.assertRowEquals(11, numOfGroupsAddedThisPeriod)
            t.assertRowEquals(12, branchMempership_br2)
            t.assertRowEquals(13, numOfDropoutClientsToDate)
            t.assertRowEquals(14, leftMFI)
            t.assertRowEquals(15, numOfDropoutClientsThisPeriod)

            // 2nd Details header
            t.assertRowEquals(16, detailsHeader2)
            // Details
            t.assertRowEquals(17, numOfCentersManaged_numOfActiveLoans)
            t.assertRowEquals(18, numOfGroups_Principal)
            t.assertRowEquals(19, numOfClients_Interest)
            t.assertRowEquals(20, numOfClientsWithLoans)
            t.assertRowEquals(21, portfolioAtRisk)
            t.assertRowEquals(22, numOfClientsWithSavings)
            t.assertRowEquals(23, numOfLoansWrittenOff)
            t.assertRowEquals(24, dormantClients)
            t.assertRowEquals(25, amountOfLoansWrittenOff)
            t.assertRowEquals(26, totalSavings)
            t.assertRowEquals(27, voluntarySavings)
            t.assertRowEquals(28, mandatorySavings)

            // 3rd Details header
            t.assertRowEquals(29, detailsHeader3)
            t.assertRowEquals(30, detailsHeader3_4)
            // Details
            t.assertRowEquals(31, weeksInArrears1)
            t.assertRowEquals(32, weeksInArrears2)
            t.assertRowEquals(33, weeksInArrears3)
            t.assertRowEquals(34, weeksInArrears4)
            t.assertRowEquals(35, weeksInArrears5)
            t.assertRowEquals(36, weeksInArrears6)
            t.assertRowEquals(37, weeksInArrears7)
            t.assertRowEquals(38, weeksInArrears8)
            t.assertRowEquals(39, weeksInArrears9)
            t.assertRowEquals(40, weeksInArrears10)
            t.assertRowEquals(41, weeksInArrears11)
            t.assertRowEquals(42, weeksInArrears12)
            t.assertRowEquals(43, weeksInArrears12p)
            t.assertRowEquals(44, arrearsTotal)

            //4th Details header
            t.assertRowEquals(45, detailsHeader4)
            t.assertRowEquals(46, detailsHeader3_4)
            // Details
            t.assertRowEquals(47, daysInArrears1)
            t.assertRowEquals(48, daysInArrears2)
            t.assertRowEquals(49, daysInArrears3)
            t.assertRowEquals(50, daysInArrears4)
            t.assertRowEquals(51, daysInArrears5)
            t.assertRowEquals(52, arrearsTotal)

            // 5th Details header
            t.assertRowEquals(53, detailsHeader5)
            t.assertRowEquals(54, detailsHeader5a)
            t.assertRowEquals(55, detailsHeader5b)
            // Details
            t.assertRowEquals(56, center1)
            t.assertRowEquals(57, center2)
            t.assertRowEquals(58, center3)
            t.assertRowEquals(59, centerTotal)

            // Page footer
            t.assertRowEquals(60, pageFooter)
        }
    }

    @Test
    void testParams_br2_br2LOxxx_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanOfficerDetailedReport.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'selected_loan_officer': '5', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, ['Loan Officer Detailed Report'])

            // Page header
            t.assertRowEquals(2, ['LoanOfficer', ':', 'br2 LO xxx', 'ID', ':'])
            t.assertRowEquals(3, ['TimePeriod', ':'])
            t.assertRowEquals(4, branch)
            t.assertCellEquals(5, 1, 'Reportcreationdate')
            t.assertCellEquals(5, 2, ':')
            t.assertRowEquals(6, gender)

            // 1st Details header
            t.assertRowEquals(7, detailsHeader1)
            // Details
            t.assertRowEquals(8, numOfClientsAddedToDate_JoinedMFI)
            t.assertRowEquals(9, numOfClientsAddedThisPeriod_BecameLO)
            t.assertRowEquals(10, numOfGroupsAddedToDate_BranchMemberships)
            t.assertRowEquals(11, numOfGroupsAddedThisPeriod)
            t.assertRowEquals(12, branchMempership_br2)
            t.assertRowEquals(13, numOfDropoutClientsToDate)
            t.assertRowEquals(14, leftMFI)
            t.assertRowEquals(15, numOfDropoutClientsThisPeriod)

            // 2nd Details header
            t.assertRowEquals(16, detailsHeader2)
            // Details
            t.assertRowEquals(17, numOfCentersManaged_numOfActiveLoans)
            t.assertRowEquals(18, numOfGroups_Principal_20100815)
            t.assertRowEquals(19, numOfClients_Interest)
            t.assertRowEquals(20, numOfClientsWithLoans)
            t.assertRowEquals(21, portfolioAtRisk)
            t.assertRowEquals(22, numOfClientsWithSavings)
            t.assertRowEquals(23, numOfLoansWrittenOff)
            t.assertRowEquals(24, dormantClients)
            t.assertRowEquals(25, amountOfLoansWrittenOff)
            t.assertRowEquals(26, totalSavings_20100815)
            t.assertRowEquals(27, voluntarySavings_20100815)
            t.assertRowEquals(28, mandatorySavings_20100815)

            // 3rd Details header
            t.assertRowEquals(29, detailsHeader3)
            t.assertRowEquals(30, detailsHeader3_4)
            // Details
            t.assertRowEquals(31, weeksInArrears1)
            t.assertRowEquals(32, weeksInArrears2_20100815)
            t.assertRowEquals(33, weeksInArrears3)
            t.assertRowEquals(34, weeksInArrears4)
            t.assertRowEquals(35, weeksInArrears5)
            t.assertRowEquals(36, weeksInArrears6)
            t.assertRowEquals(37, weeksInArrears7)
            t.assertRowEquals(38, weeksInArrears8)
            t.assertRowEquals(39, weeksInArrears9_20100815)
            t.assertRowEquals(40, weeksInArrears10)
            t.assertRowEquals(41, weeksInArrears11)
            t.assertRowEquals(42, weeksInArrears12)
            t.assertRowEquals(43, weeksInArrears12p)
            t.assertRowEquals(44, arrearsTotal_20100815)

            //4th Details header
            t.assertRowEquals(45, detailsHeader4)
            t.assertRowEquals(46, detailsHeader3_4)
            // Details
            t.assertRowEquals(47, daysInArrears1_20100815)
            t.assertRowEquals(48, daysInArrears2_20100815)
            t.assertRowEquals(49, daysInArrears3)
            t.assertRowEquals(50, daysInArrears4)
            t.assertRowEquals(51, daysInArrears5)
            t.assertRowEquals(52, arrearsTotal_20100815)

            // 5th Details header
            t.assertRowEquals(53, detailsHeader5)
            t.assertRowEquals(54, detailsHeader5a)
            t.assertRowEquals(55, detailsHeader5b)
            // Details
            t.assertRowEquals(56, center1_20100815)
            t.assertRowEquals(57, center2_20100815)
            t.assertRowEquals(58, center3)
            t.assertRowEquals(59, centerTotal_20100815)

            // Page footer
            t.assertRowEquals(60, pageFooter)
        }
    }
}
