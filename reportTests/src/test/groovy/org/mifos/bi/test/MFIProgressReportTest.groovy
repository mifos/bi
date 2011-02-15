package org.mifos.bi.test

import org.junit.Test

class MFIProgressReportTest {

    def reportPath = 'reports/standardReports/prpts/MFIProgress.prpt'
    def reportName = 'MFI Progress';
    def branch = ['Office:', 'br2']
    def gender = ['Gender:', 'Female']

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

    def loanDisbursals = ['Disbursal Amount']
    def lDisgroupLoan = ['group loan', '0.0000', '0.0000']
    def lDisloanProd1 = ['loan prod 1', '3000.0000', '0.0000', '-100.00']
    def lDisloanProd2 = ['loan prod 2', '0.0000', '0.0000']
    def lDisTotal = ['Total Disbursal Amount', '3000.0000', '0.0000', '-100']

    def outstandingAL = ['Active Loans Outstanding']
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

    def overdueAmount_08 = ['Arrears Amount', '0.0000', '2077.0000']
    def overdueAmount_09 = ['Arrears Amount', '0.0000', '2943.0000']
    def outstandingOfLoansInArrears = ['PAR', '0.0000', '2943.0000']
    def par_08 = ['PAR Ratio', '0.00', '71.01']
    def par_09 = ['PAR Ratio', '0.00', '100.62']

    def detailsHeader5_6a_08 = ['AGING TABLE', 'Jul 2010', 'Aug 2010']
    def detailsHeader5_6a_09 = ['AGING TABLE', 'Jul 2010', 'Sep 2010']
    def detailsHeader5_6b = ['AGING TABLE', '# of Loans', 'Arrears Amount', 'Outstanding', '# of Loans', 'Arrears Amount', 'Outstanding']

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

    def activeBorrowersPerLO = ['Active Borrowers per Loan Officer', '1.00', '1.00', '0']
    def netLoanPortfolioPerLO = ['Net Loan Portfolio per Loan Officer', '3021.00', '3021.00', '0']
    def avgPortfolioPerActiveBorrower = ['Average Portfolio per Active Borrower', '3021.00', '3021.00', '0']
    def activeClientsPerBranch_08 = ['Active Clients per Branch', '6.00', '5.00', '-16.6666666666666666666666666666666668']
    def activeClientsPerBranch = ['Active Clients per Branch', '6.00', '6.00', '0']
    def avgClientsPerCenter_08 = ['Average Clients per Center', '3.00', '2.50', '-16.6666666666666666666666666666666668']
    def avgClientsPerCenter = ['Average Clients per Center', '3.00', '3.00', '0']
    def avgClientsPerLO_08 = ['Average Clients per Loan Officer', '6.00', '5.00', '-16.6666666666666666666666666666666668']
    def avgClientsPerLO = ['Average Clients per Loan Officer', '6.00', '6.00', '0']
    def avgClientsPerBranch_08 = ['Average Clients per Branch', '6.00', '5.00', '-16.6666666666666666666666666666666668']
    def avgClientsPerBranch = ['Average Clients per Branch', '6.00', '6.00', '0']
    def avgLoanOutstanding = ['Average Loan Outstanding', '2943.00', '2943.00', '0']
    def avgPrincipalOutstanding = ['Average Principal Outstanding', '2924.90', '2924.90', '0']
    def avgInterestOutstanding = ['Average Interest Outstanding', '18.10', '18.10', '0']
    def avgLoanSize = ['Average Loan Size', '3021.00', '3021.00', '0']

    def pageFooter = ['Version 1.1', 'Page', '1 / 1']

    @Test
    void testParams_br2_br2LOxxx_2010Jul_2010Sep() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'selected_period1': '2010-Jul', 'selected_period2': '2010-Sep']

            // MFI name
            t.assertRowEquals(1, ['Mifos HO'])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, branch)
            t.assertRowEquals(4, ['Period 1:', 'Jul 2010'])
            t.assertRowEquals(5, ['Period 2:', 'Sep 2010'])

            // 1st Details header
            def offset = 6
            t.assertRowEquals(offset, detailsHeader1_09)
            // Details
            t.assertRowEquals(offset+1, branches)
            t.assertRowEquals(offset+2, centers)
            t.assertRowEquals(offset+3, groups_09)
            t.assertRowEquals(offset+4, clients_09)
            t.assertRowEquals(offset+5, activeBorrowers)
            t.assertRowEquals(offset+6, activeDepositors)
            t.assertRowEquals(offset+7, dropouts)
            t.assertRowEquals(offset+8, noOfLoanOfficers)

            // 2nd Details header
            offset = 15
            t.assertRowEquals(offset, detailsHeader2_09)

            t.assertRowEquals(offset+1, noOfActiveLoans)
            t.assertRowEquals(offset+2, noOfALgroupLoan)
            t.assertRowEquals(offset+3, noOfALloanProd1)
            t.assertRowEquals(offset+4, noOfALloanProd2)
            t.assertRowEquals(offset+5, noOfALTotal)

            t.assertRowEquals(offset+6, loanDisbursals)
            t.assertRowEquals(offset+7, lDisgroupLoan)
            t.assertRowEquals(offset+8, lDisloanProd1)
            t.assertRowEquals(offset+9, lDisloanProd2)
            t.assertRowEquals(offset+10, lDisTotal)

            t.assertRowEquals(offset+11, outstandingAL)
            t.assertRowEquals(offset+12, outALgroupLoan)
            t.assertRowEquals(offset+13, outALloanProd1)
            t.assertRowEquals(offset+14, outALloanProd2)
            t.assertRowEquals(offset+15, outALTotal)

            t.assertRowEquals(offset+16, noSavings)
            t.assertRowEquals(offset+17, noScenter)
            t.assertRowEquals(offset+18, noSgroup)
            t.assertRowEquals(offset+19, noSproduct1)
            t.assertRowEquals(offset+20, noSproduct2)
            t.assertRowEquals(offset+21, noSTotal)

            t.assertRowEquals(offset+22, noDeposits)
            t.assertRowEquals(offset+23, noDcenter)
            t.assertRowEquals(offset+24, noDgroup)
            t.assertRowEquals(offset+25, noDproduct1)
            t.assertRowEquals(offset+26, noDproduct2)
            t.assertRowEquals(offset+27, noDTotal)

            // 3rd Details header
            offset = 43
            t.assertRowEquals(offset, detailsHeader3_09)

            t.assertRowEquals(offset+1, interestIncome)
            t.assertRowEquals(offset+2, loanFees)
            t.assertRowEquals(offset+3, clientFees)
            t.assertRowEquals(offset+4, incomeTotal)

            // 4th Details header
            offset = 48
            t.assertRowEquals(offset, detailsHeader4_09)
            
            t.assertRowEquals(offset+1, overdueAmount_09)
            t.assertRowEquals(offset+2, outstandingOfLoansInArrears)
            t.assertRowEquals(offset+3, par_09)

            // 5th Details header
            offset = 52
            t.assertRowEquals(offset, detailsHeader5_6a_09)
            t.assertRowEquals(offset+1, detailsHeader5_6b)

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

            // 6th Details header
            offset = 68
            t.assertRowEquals(offset, detailsHeader5_6a_09)
            t.assertRowEquals(offset+1, detailsHeader5_6b)

            t.assertRowEquals(offset+2, daysInArrears1)
            t.assertRowEquals(offset+3, daysInArrears2)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal)

            // 7th Details header
            offset = 76
            t.assertRowEquals(offset, detailsHeader7_09)
            t.assertRowEquals(offset+1, activeBorrowersPerLO)
            t.assertRowEquals(offset+2, netLoanPortfolioPerLO)
            t.assertRowEquals(offset+3, avgPortfolioPerActiveBorrower)
            t.assertRowEquals(offset+4, activeClientsPerBranch)
            t.assertRowEquals(offset+5, avgClientsPerCenter)
            t.assertRowEquals(offset+6, avgClientsPerLO)
            t.assertRowEquals(offset+7, avgClientsPerBranch)
            t.assertRowEquals(offset+8, avgLoanOutstanding)
            t.assertRowEquals(offset+9, avgPrincipalOutstanding)
            t.assertRowEquals(offset+10, avgInterestOutstanding)
            t.assertRowEquals(offset+11, avgLoanSize)

            // Page footer
            offset = 88
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_br2LOxxx_2010Jul_2010Aug() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'selected_period1': '2010-Jul', 'selected_period2': '2010-Aug']

            // MFI name
            t.assertRowEquals(1, ['Mifos HO'])

            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, branch)
            t.assertRowEquals(4, ['Period 1:', 'Jul 2010'])
            t.assertRowEquals(5, ['Period 2:', 'Aug 2010'])

            // 1st Details header
            def offset = 6
            t.assertRowEquals(offset, detailsHeader1_08)
            // Details
            t.assertRowEquals(offset+1, branches)
            t.assertRowEquals(offset+2, centers)
            t.assertRowEquals(offset+3, groups_08)
            t.assertRowEquals(offset+4, clients_08)
            t.assertRowEquals(offset+5, activeBorrowers)
            t.assertRowEquals(offset+6, activeDepositors)
            t.assertRowEquals(offset+7, dropouts)
            t.assertRowEquals(offset+8, noOfLoanOfficers)

            // 2nd Details header
            offset = 15
            t.assertRowEquals(offset, detailsHeader2_08)

            t.assertRowEquals(offset+1, noOfActiveLoans)
            t.assertRowEquals(offset+2, noOfALgroupLoan)
            t.assertRowEquals(offset+3, noOfALloanProd1)
            t.assertRowEquals(offset+4, noOfALloanProd2)
            t.assertRowEquals(offset+5, noOfALTotal)

            t.assertRowEquals(offset+6, loanDisbursals)
            t.assertRowEquals(offset+7, lDisgroupLoan)
            t.assertRowEquals(offset+8, lDisloanProd1)
            t.assertRowEquals(offset+9, lDisloanProd2)
            t.assertRowEquals(offset+10, lDisTotal)

            t.assertRowEquals(offset+11, outstandingAL)
            t.assertRowEquals(offset+12, outALgroupLoan)
            t.assertRowEquals(offset+13, outALloanProd1)
            t.assertRowEquals(offset+14, outALloanProd2)
            t.assertRowEquals(offset+15, outALTotal)

            t.assertRowEquals(offset+16, noSavings)
            t.assertRowEquals(offset+17, noScenter)
            t.assertRowEquals(offset+18, noSgroup)
            t.assertRowEquals(offset+19, noSproduct1)
            t.assertRowEquals(offset+20, noSproduct2)
            t.assertRowEquals(offset+21, noSTotal)

            t.assertRowEquals(offset+22, noDeposits)
            t.assertRowEquals(offset+23, noDcenter)
            t.assertRowEquals(offset+24, noDgroup)
            t.assertRowEquals(offset+25, noDproduct1)
            t.assertRowEquals(offset+26, noDproduct2)
            t.assertRowEquals(offset+27, noDTotal)

            // 3rd Details header
            offset = 43
            t.assertRowEquals(offset, detailsHeader3_08)

            t.assertRowEquals(offset+1, interestIncome)
            t.assertRowEquals(offset+2, loanFees)
            t.assertRowEquals(offset+3, clientFees)
            t.assertRowEquals(offset+4, incomeTotal)

            // 4th Details header
            offset = 48
            t.assertRowEquals(offset, detailsHeader4_08)

            t.assertRowEquals(offset+1, overdueAmount_08)
            t.assertRowEquals(offset+2, outstandingOfLoansInArrears)
            t.assertRowEquals(offset+3, par_08)

            // 5th Details header
            offset = 52
            t.assertRowEquals(offset, detailsHeader5_6a_08)
            t.assertRowEquals(offset+1, detailsHeader5_6b)

            t.assertRowEquals(offset+2, weeksInArrears1)
            t.assertRowEquals(offset+3, weeksInArrears2)
            t.assertRowEquals(offset+4, weeksInArrears3)
            t.assertRowEquals(offset+5, weeksInArrears4)
            t.assertRowEquals(offset+6, weeksInArrears5_08)
            t.assertRowEquals(offset+7, weeksInArrears6)
            t.assertRowEquals(offset+8, weeksInArrears7)
            t.assertRowEquals(offset+9, weeksInArrears8)
            t.assertRowEquals(offset+10, weeksInArrears9_08)
            t.assertRowEquals(offset+11, weeksInArrears10)
            t.assertRowEquals(offset+12, weeksInArrears11)
            t.assertRowEquals(offset+13, weeksInArrears12)
            t.assertRowEquals(offset+14, weeksInArrears12p)
            t.assertRowEquals(offset+15, arrearsTotal_08)

            // 6th Details header
            offset = 68
            t.assertRowEquals(offset, detailsHeader5_6a_08)
            t.assertRowEquals(offset+1, detailsHeader5_6b)

            t.assertRowEquals(offset+2, daysInArrears1_08)
            t.assertRowEquals(offset+3, daysInArrears2_08)
            t.assertRowEquals(offset+4, daysInArrears3)
            t.assertRowEquals(offset+5, daysInArrears4)
            t.assertRowEquals(offset+6, daysInArrears5)
            t.assertRowEquals(offset+7, arrearsTotal_08)

            // 7th Details header
            offset = 76
            t.assertRowEquals(offset, detailsHeader7_08)
            t.assertRowEquals(offset+1, activeBorrowersPerLO)
            t.assertRowEquals(offset+2, netLoanPortfolioPerLO)
            t.assertRowEquals(offset+3, avgPortfolioPerActiveBorrower)
            t.assertRowEquals(offset+4, activeClientsPerBranch_08)
            t.assertRowEquals(offset+5, avgClientsPerCenter_08)
            t.assertRowEquals(offset+6, avgClientsPerLO_08)
            t.assertRowEquals(offset+7, avgClientsPerBranch_08)
            t.assertRowEquals(offset+8, avgLoanOutstanding)
            t.assertRowEquals(offset+9, avgPrincipalOutstanding)
            t.assertRowEquals(offset+10, avgInterestOutstanding)
            t.assertRowEquals(offset+11, avgLoanSize)

            // Page footer
            offset = 88
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
