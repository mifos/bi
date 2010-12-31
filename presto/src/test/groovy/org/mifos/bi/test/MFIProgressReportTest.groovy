package org.mifos.bi.test;

import org.junit.Test

class MFIProgressReportTest {

    def branch = ['Branch', ':', 'br2']
    def gender = ['Gender', ':', 'Female']

    def detailsHeader1_08 = ['OUTREACH', 'Jul 2010', 'Aug 2010', '% Change']
    def detailsHeader1_09 = ['OUTREACH', 'Jul 2010', 'Sep 2010', '% Change']
    def branches = ['Branches', '1', '0', '-100.00']
    def centers = ['Centers', '2', '0', '-100.00']
    def groups_08 = ['Groups', '3', '0', '-100.00']
    def groups_09 = ['Groups', '3', '4', '33.33']
    def clients_08 = ['Clients', '3', '0', '-100.00']
    def clients_09 = ['Clients', '3', '1', '-66.67']
    def activeBorrowers = ['Active Borrowers', '1', '0', '-100.00']
    def activeDepositors = ['Active Depositors', '2', '0', '-100.00']
    def dropouts = ['Dropouts', '0', '0', '-']
    def noOfLoanOfficers = ['No of loan officers', '1', '0', '-100.00']

    def detailsHeader2_08 = ['PORTFOLIO', 'Jul 2010', 'Aug 2010', '% Change']
    def detailsHeader2_09 = ['PORTFOLIO', 'Jul 2010', 'Sep 2010', '% Change']

    def noOfActiveLoans = ['Number of Active Loans']
    def noOfALgroupLoan = ['group loan', '0', '0']
    def noOfALloanProd1 = ['loan prod 1', '1', '1', '0.00']
    def noOfALloanProd2 = ['loan prod 2', '0', '0']
    def noOfALTotal = ['Total # Active Loans', '1', '1', '0']

    def loanDisbursals = ['Loan Disbursals']
    def lDisgroupLoan = ['group loan', '0.0000', '0.0000']
    def lDisloanProd1 = ['loan prod 1', '3000.0000', '0.0000', '-100.00']
    def lDisloanProd2 = ['loan prod 2', '0.0000', '0.0000']
    def lDisTotal = ['Total Disbursal Amount', '3000.0000', '0.0000', '-100']

    def outstandingAL = ['Outstanding of Active Loans']
    def outALgroupLoan = ['group loan', '0.0000', '0.0000']
    def outALloanProd1 = ['loan prod 1', '2924.9000', '2924.9000', '0.00']
    def outALloanProd2 = ['loan prod 2', '0.0000', '0.0000']
    def outALTotal = ['Total Outstanding Amount', '2924.9000', '2924.9000', '0']

    def noSavings = ['Number of Savings Accounts']
    def noScenter = ['center savings', '1', '1', '0.00']
    def noSgroup = ['group savings product', '1', '1', '0.00']
    def noSproduct1 = ['savings product 1', '3', '3', '0.00']
    def noSproduct2 = ['savings product 2', '0', '0']
    def noSTotal = ['Total Savings Accounts', '5', '5', '0']

    def noDeposits = ['Total Deposits']
    def noDcenter = ['center savings', '777.0000', '777.0000', '0.00']
    def noDgroup = ['group savings product', '0.0000', '0.0000']
    def noDproduct1 = ['savings product 1', '1215.0000', '1215.0000', '0.00']
    def noDproduct2 = ['savings product 2', '0.0000', '0.0000']
    def noDTotal = ['Total Savings Deposits', '1992.0000', '1992.0000', '0']

    def detailsHeader3_08 = ['INCOME', 'Jul 2010', 'Aug 2010', '% Change']
    def detailsHeader3_09 = ['INCOME', 'Jul 2010', 'Sep 2010', '% Change']

    def interestIncome = ['Interest Income', '2.9000', '0.0000', '-100.00']
    def loanFees = ['Loan Fees', '0.0000', '0.0000']
    def clientFees = ['Client Fees', '0.0000', '0.0000']
    def incomeTotal = ['Total', '2.9000', '0.0000', '-100']

    def detailsHeader4_08 = ['AGING ANALYSIS', 'Jul 2010', 'Aug 2010', '% Change']
    def detailsHeader4_09 = ['AGING ANALYSIS', 'Jul 2010', 'Sep 2010', '% Change']

    def overdueAmount_08 = ['Overdue Amount', '0.0000', '2077.0000']
    def overdueAmount_09 = ['Overdue Amount', '0.0000', '2943.0000']
    def outstandingOfLoansInArrears = ['Outstanding of Loans in Arrears', '0.0000', '2943.0000']
    def par_08 = ['PAR', '0.00', '71.01']
    def par_09 = ['PAR', '0.00', '100.62']

    def detailsHeader5_6a_08 = ['AGING TABLE', 'Jul 2010', 'Aug 2010']
    def detailsHeader5_6a_09 = ['AGING TABLE', 'Jul 2010', 'Sep 2010']
    def detailsHeader5_6b = ['AGING TABLE', '# of Loans', 'Arrears', 'Outstanding', '# of Loans', 'Arrears', 'Outstanding']

    def weeksInArrears1 = ['1 Week in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears2 = ['2 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears3 = ['3 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears4 = ['4 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears5_08 = ['5 Weeks in Arrears', '0', '0.0000', '0.0000', '1', '2077.0000', '2943.0000']
    def weeksInArrears5 = ['5 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears6 = ['6 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears7 = ['7 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears8 = ['8 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears9_08 = ['9 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears9 = ['9 Weeks in Arrears', '0', '0.0000', '0.0000', '1', '2943.0000', '2943.0000']
    def weeksInArrears10 = ['10 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears11 = ['11 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears12 = ['12 Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def weeksInArrears12p = ['12+ Weeks in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def arrearsTotal_08 = ['Total', '0', '0.0000', '0.0000', '1', '2077.0000', '2943.0000']
    def arrearsTotal = ['Total', '0', '0.0000', '0.0000', '1', '2943.0000', '2943.0000']

    def daysInArrears1_08 = ['0 to 30 Days in Arrears', '0', '0.0000', '0.0000', '1', '2077.0000', '2943.0000']
    def daysInArrears1 = ['0 to 30 Days in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def daysInArrears2_08 = ['30 to 60 Days in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def daysInArrears2 = ['30 to 60 Days in Arrears', '0', '0.0000', '0.0000', '1', '2943.0000', '2943.0000']
    def daysInArrears3 = ['60 to 90 Days in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def daysInArrears4 = ['90 to 180 Days in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']
    def daysInArrears5 = ['> 180 Days in Arrears', '0', '0.0000', '0.0000', '0', '0.0000', '0.0000']

    def detailsHeader7_08 = ['PERFORMANCE RATIOS', 'Jul 2010', 'Aug 2010', '% Change']
    def detailsHeader7_09 = ['PERFORMANCE RATIOS', 'Jul 2010', 'Sep 2010', '% Change']

    def activeBorrowersPerLO = ['Active Borrowers per Loanofficer', '1.00', '1.00', '0']
    def netLoanPortfolioPerLO = ['Net Loan Portfolio per Loanofficer', '3021.00', '3021.00', '0']
    def avgPortfolioPerActiveBorrower = ['Average Portfolio per Active Borrower', '3021.00', '3021.00', '0']
    def activeClientsPerBranch_08 = ['Active Clients per Branch', '6.00', '5.00', '-16.6666666666666666666666666666666668']
    def activeClientsPerBranch = ['Active Clients per Branch', '6.00', '6.00', '0']
    def avgClientsPerCenter_08 = ['Average Clients per Center', '3.00', '2.50', '-16.6666666666666666666666666666666668']
    def avgClientsPerCenter = ['Average Clients per Center', '3.00', '3.00', '0']
    def avgClientsPerLO_08 = ['Average Clients per Loanofficer', '6.00', '5.00', '-16.6666666666666666666666666666666668']
    def avgClientsPerLO = ['Average Clients per Loanofficer', '6.00', '6.00', '0']
    def avgClientsPerBranch_08 = ['Average Clients per Branch', '6.00', '5.00', '-16.6666666666666666666666666666666668']
    def avgClientsPerBranch = ['Average Clients per Branch', '6.00', '6.00', '0']
    def avgLoanOutstanding = ['Average Loan Outstanding', '2943.00', '2943.00', '0']
    def avgPrincipalOutstanding = ['Average Principal Outstanding', '2924.90', '2924.90', '0']
    def avgInterestOutstanding = ['Average Interest Outstanding', '18.10', '18.10', '0']
    def avgLoanSize = ['Average Loan Size', '3021.00', '3021.00', '0']

    @Test
    void testParams_br2_br2LOxxx_2010Jul_2010Sep() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/MFIProgressReport.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'selected_period1': '2010-Jul', 'selected_period2': '2010-Sep']

            // Report title
            t.assertRowEquals(1, ['MFI Progress Report'])

            // Page header
            t.assertRowEquals(2, branch)
            t.assertRowEquals(3, [':'])
            t.assertCellEquals(4, 1, 'Period 1')
            t.assertCellEquals(4, 2, ':')
            t.assertCellEquals(4, 3, 'Jul 2010')
            t.assertCellEquals(4, 4, 'Report Creation Date')
            t.assertRowEquals(5, ['Period 2', ':', 'Sep 2010'])

            // 1st Details header
            t.assertRowEquals(6, detailsHeader1_09)
            // Details
            t.assertRowEquals(7, branches)
            t.assertRowEquals(8, centers)
            t.assertRowEquals(9, groups_09)
            t.assertRowEquals(10, clients_09)
            t.assertRowEquals(11, activeBorrowers)
            t.assertRowEquals(12, activeDepositors)
            t.assertRowEquals(13, dropouts)
            t.assertRowEquals(14, noOfLoanOfficers)

            // 2nd Details header
            t.assertRowEquals(15, detailsHeader2_09)

            t.assertRowEquals(16, noOfActiveLoans)
            t.assertRowEquals(17, noOfALgroupLoan)
            t.assertRowEquals(18, noOfALloanProd1)
            t.assertRowEquals(19, noOfALloanProd2)
            t.assertRowEquals(20, noOfALTotal)

            t.assertRowEquals(21, loanDisbursals)
            t.assertRowEquals(22, lDisgroupLoan)
            t.assertRowEquals(23, lDisloanProd1)
            t.assertRowEquals(24, lDisloanProd2)
            t.assertRowEquals(25, lDisTotal)

            t.assertRowEquals(26, outstandingAL)
            t.assertRowEquals(27, outALgroupLoan)
            t.assertRowEquals(28, outALloanProd1)
            t.assertRowEquals(29, outALloanProd2)
            t.assertRowEquals(30, outALTotal)

            t.assertRowEquals(31, noSavings)
            t.assertRowEquals(32, noScenter)
            t.assertRowEquals(33, noSgroup)
            t.assertRowEquals(34, noSproduct1)
            t.assertRowEquals(35, noSproduct2)
            t.assertRowEquals(36, noSTotal)

            t.assertRowEquals(37, noDeposits)
            t.assertRowEquals(38, noDcenter)
            t.assertRowEquals(39, noDgroup)
            t.assertRowEquals(40, noDproduct1)
            t.assertRowEquals(41, noDproduct2)
            t.assertRowEquals(42, noDTotal)

            // 3rd Details header
            t.assertRowEquals(43, detailsHeader3_09)

            t.assertRowEquals(44, interestIncome)
            t.assertRowEquals(45, loanFees)
            t.assertRowEquals(46, clientFees)
            t.assertRowEquals(47, incomeTotal)

            // 4th Details header
            t.assertRowEquals(48, detailsHeader4_09)
            
            t.assertRowEquals(49, overdueAmount_09)
            t.assertRowEquals(50, outstandingOfLoansInArrears)
            t.assertRowEquals(51, par_09)


            // 5th Details header
            t.assertRowEquals(52, detailsHeader5_6a_09)
            t.assertRowEquals(53, detailsHeader5_6b)

            t.assertRowEquals(54, weeksInArrears1)
            t.assertRowEquals(55, weeksInArrears2)
            t.assertRowEquals(56, weeksInArrears3)
            t.assertRowEquals(57, weeksInArrears4)
            t.assertRowEquals(58, weeksInArrears5)
            t.assertRowEquals(59, weeksInArrears6)
            t.assertRowEquals(60, weeksInArrears7)
            t.assertRowEquals(61, weeksInArrears8)
            t.assertRowEquals(62, weeksInArrears9)
            t.assertRowEquals(63, weeksInArrears10)
            t.assertRowEquals(64, weeksInArrears11)
            t.assertRowEquals(65, weeksInArrears12)
            t.assertRowEquals(66, weeksInArrears12p)
            t.assertRowEquals(67, arrearsTotal)

            // 6th Details header
            t.assertRowEquals(68, detailsHeader5_6a_09)
            t.assertRowEquals(69, detailsHeader5_6b)

            t.assertRowEquals(70, daysInArrears1)
            t.assertRowEquals(71, daysInArrears2)
            t.assertRowEquals(72, daysInArrears3)
            t.assertRowEquals(73, daysInArrears4)
            t.assertRowEquals(74, daysInArrears5)
            t.assertRowEquals(75, arrearsTotal)

            // 7th Details header
            t.assertRowEquals(76, detailsHeader7_09)
            t.assertRowEquals(77, activeBorrowersPerLO)
            t.assertRowEquals(78, netLoanPortfolioPerLO)
            t.assertRowEquals(79, avgPortfolioPerActiveBorrower)
            t.assertRowEquals(80, activeClientsPerBranch)
            t.assertRowEquals(81, avgClientsPerCenter)
            t.assertRowEquals(82, avgClientsPerLO)
            t.assertRowEquals(83, avgClientsPerBranch)
            t.assertRowEquals(84, avgLoanOutstanding)
            t.assertRowEquals(85, avgPrincipalOutstanding)
            t.assertRowEquals(86, avgInterestOutstanding)
            t.assertRowEquals(87, avgLoanSize)

        }
    }

    @Test
    void testParams_br2_br2LOxxx_2010Jul_2010Aug() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/MFIProgressReport.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'selected_period1': '2010-Jul', 'selected_period2': '2010-Aug']

            // Report title
            t.assertRowEquals(1, ['MFI Progress Report'])

            // Page header
            t.assertRowEquals(2, branch)
            t.assertRowEquals(3, [':'])
            t.assertCellEquals(4, 1, 'Period 1')
            t.assertCellEquals(4, 2, ':')
            t.assertCellEquals(4, 3, 'Jul 2010')
            t.assertCellEquals(4, 4, 'Report Creation Date')
            t.assertRowEquals(5, ['Period 2', ':', 'Aug 2010'])

            // 1st Details header
            t.assertRowEquals(6, detailsHeader1_08)
            // Details
            t.assertRowEquals(7, branches)
            t.assertRowEquals(8, centers)
            t.assertRowEquals(9, groups_08)
            t.assertRowEquals(10, clients_08)
            t.assertRowEquals(11, activeBorrowers)
            t.assertRowEquals(12, activeDepositors)
            t.assertRowEquals(13, dropouts)
            t.assertRowEquals(14, noOfLoanOfficers)

            // 2nd Details header
            t.assertRowEquals(15, detailsHeader2_08)

            t.assertRowEquals(16, noOfActiveLoans)
            t.assertRowEquals(17, noOfALgroupLoan)
            t.assertRowEquals(18, noOfALloanProd1)
            t.assertRowEquals(19, noOfALloanProd2)
            t.assertRowEquals(20, noOfALTotal)

            t.assertRowEquals(21, loanDisbursals)
            t.assertRowEquals(22, lDisgroupLoan)
            t.assertRowEquals(23, lDisloanProd1)
            t.assertRowEquals(24, lDisloanProd2)
            t.assertRowEquals(25, lDisTotal)

            t.assertRowEquals(26, outstandingAL)
            t.assertRowEquals(27, outALgroupLoan)
            t.assertRowEquals(28, outALloanProd1)
            t.assertRowEquals(29, outALloanProd2)
            t.assertRowEquals(30, outALTotal)

            t.assertRowEquals(31, noSavings)
            t.assertRowEquals(32, noScenter)
            t.assertRowEquals(33, noSgroup)
            t.assertRowEquals(34, noSproduct1)
            t.assertRowEquals(35, noSproduct2)
            t.assertRowEquals(36, noSTotal)

            t.assertRowEquals(37, noDeposits)
            t.assertRowEquals(38, noDcenter)
            t.assertRowEquals(39, noDgroup)
            t.assertRowEquals(40, noDproduct1)
            t.assertRowEquals(41, noDproduct2)
            t.assertRowEquals(42, noDTotal)

            // 3rd Details header
            t.assertRowEquals(43, detailsHeader3_08)

            t.assertRowEquals(44, interestIncome)
            t.assertRowEquals(45, loanFees)
            t.assertRowEquals(46, clientFees)
            t.assertRowEquals(47, incomeTotal)

            // 4th Details header
            t.assertRowEquals(48, detailsHeader4_08)

            t.assertRowEquals(49, overdueAmount_08)
            t.assertRowEquals(50, outstandingOfLoansInArrears)
            t.assertRowEquals(51, par_08)


            // 5th Details header
            t.assertRowEquals(52, detailsHeader5_6a_08)
            t.assertRowEquals(53, detailsHeader5_6b)

            t.assertRowEquals(54, weeksInArrears1)
            t.assertRowEquals(55, weeksInArrears2)
            t.assertRowEquals(56, weeksInArrears3)
            t.assertRowEquals(57, weeksInArrears4)
            t.assertRowEquals(58, weeksInArrears5_08)
            t.assertRowEquals(59, weeksInArrears6)
            t.assertRowEquals(60, weeksInArrears7)
            t.assertRowEquals(61, weeksInArrears8)
            t.assertRowEquals(62, weeksInArrears9_08)
            t.assertRowEquals(63, weeksInArrears10)
            t.assertRowEquals(64, weeksInArrears11)
            t.assertRowEquals(65, weeksInArrears12)
            t.assertRowEquals(66, weeksInArrears12p)
            t.assertRowEquals(67, arrearsTotal_08)

            // 6th Details header
            t.assertRowEquals(68, detailsHeader5_6a_08)
            t.assertRowEquals(69, detailsHeader5_6b)

            t.assertRowEquals(70, daysInArrears1_08)
            t.assertRowEquals(71, daysInArrears2_08)
            t.assertRowEquals(72, daysInArrears3)
            t.assertRowEquals(73, daysInArrears4)
            t.assertRowEquals(74, daysInArrears5)
            t.assertRowEquals(75, arrearsTotal_08)

            // 7th Details header
            t.assertRowEquals(76, detailsHeader7_08)
            t.assertRowEquals(77, activeBorrowersPerLO)
            t.assertRowEquals(78, netLoanPortfolioPerLO)
            t.assertRowEquals(79, avgPortfolioPerActiveBorrower)
            t.assertRowEquals(80, activeClientsPerBranch_08)
            t.assertRowEquals(81, avgClientsPerCenter_08)
            t.assertRowEquals(82, avgClientsPerLO_08)
            t.assertRowEquals(83, avgClientsPerBranch_08)
            t.assertRowEquals(84, avgLoanOutstanding)
            t.assertRowEquals(85, avgPrincipalOutstanding)
            t.assertRowEquals(86, avgInterestOutstanding)
            t.assertRowEquals(87, avgLoanSize)

        }
    }
}
