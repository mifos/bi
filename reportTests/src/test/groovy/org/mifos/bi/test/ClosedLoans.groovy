package org.mifos.bi.test

import org.junit.Test

class ClosedLoans {


  def reportPath = 'reports/standardReports/prpts/ClosedLoans.prpt'
  def reportName = 'Closed Loans'

  /** Headers for Closed Loans**/
  
  def closedLoansHeader = ['Group Name','Client Name','Loan Id','Disbursal Date','Disbursal Amount','Purpose Of Loan','Loan Cycle','Interest Rate(%)','Principal Collected','Interest Collected',
  'Total Collected','Closed / Rescheduled Date','Reason','Days Since Loan Closed','New Loan  Taken']
 
  /** assorted Labels                  ***/
  def officeLabel = "Office:"
  def loanOfficerLabel = "Loan Officer:"
  def centerLabel = "Center:"
  def disbursalPeriodLabel = "Disbursal Period:"
  def closurePeriodLabel = "Closure Period:"
  def toLabel="To" 
  def centerGroupHeaderLabel="Office, Loan Officer, Center:"
  /** *Expected Data              **/
  def mfiName = 'Mifos HO'

 /**Details Closed obligation met**/
  def groupName_Closedobligationmet='group dw1 1'
  def memberName_Closedobligationmet='lose group ..'
  def loanId_Closedobligationmet='38'
  def disbursalDate_Closedobligationmet='2010-07-22'
  def disbursalAmount_Closedobligationmet='3000.0000'
  def purposeOfLoan_Closedobligationmet=''
  def loanCycle_Closedobligationmet='1'
  def interestRate_Closedobligationmet='5.0000000000'
  def principalCollected_Closedobligationmet='3000.0000'
  def interestCollected_Closedobligationmet='2.9000'
  def totalCollected_Closedobligationmet='3002.9000'
  def closureDate_Closedobligationmet='2010-07-24'
  def reason_Closedobligationmet='Closed obligation met'
  def daysSinceLoanClosed_Closedobligationmet='233'
  def newLoanTaken_Closedobligationmet='No'
  
   /**Details Closed Written Off**/
  def groupName_ClosedWrittenOff='group dw1 2'
  def memberName_ClosedWrittenOff='client dw1 1 1 ..'
  def loanId_ClosedWrittenOff='4'
  def disbursalDate_ClosedWrittenOff='2010-07-16'
  def disbursalAmount_ClosedWrittenOff='3000.0000'
  def purposeOfLoan_ClosedWrittenOff=''
  def loanCycle_ClosedWrittenOff='1'
  def interestRate_ClosedWrittenOff='5.0000000000'
  def principalCollected_ClosedWrittenOff='247.1000'
  def interestCollected_ClosedWrittenOff='2.9000'
  def totalCollected_ClosedWrittenOff='250.0000'
  def closureDate_ClosedWrittenOff='2010-07-18'
  def reason_ClosedWrittenOff='Closed written off'
  def daysSinceLoanClosed_ClosedWrittenOff='239'
  def newLoanTaken_ClosedWrittenOff='No'
  
  /**Details Closed Loan Obligatinmet and  Closed Written Off**/
  def groupName='group 1 for ..'
  def memberName='xfer to gr in sam ..'
  def loanId='44'
  def disbursalDate='2010-07-22'
  def disbursalAmount='6000.0000'
  def purposeOfLoan=''
  def loanCycle='1'
  def interestRate='5.0000000000'
  def principalCollected='0.0000'
  def interestCollected='0.0000'
  def totalCollected='0.0000'
  def closureDate='2010-07-23'
  def reason='Closed written off'
  def daysSinceLoanClosed='252'
  def newLoanTaken='No'
  
  def totalAllBranch_centerdw1_20100101_20110314 = ['Center Total:', 'center dw1', '1', '3000.0000', '3000.0000','2.9000', '3002.9000']
  def totalAllBranch_br2LOxxx_20100101_20110314 = ['Loan Officer Total:', 'br2 LO xxx', '1', '3000.0000', '3000.0000', '2.9000', '3002.9000']
  def totalBranch_BO1_20100101_20110314 = ['Branch Total:', 'BO 1', '1', '3000.0000', '3000.0000', '2.9000', '3002.9000']
 
  def totalBO1_centerdw1_20100718_20100720 = ['Center Total:', 'center dw1', '1', '3000.0000', '247.1000','2.9000', '250.0000']
  def totalBO1_br1lo1smith_20100718_20100720 = ['Loan Officer Total:', 'br1 lo 1 smith', '1', '3000.0000', '247.1000', '2.9000', '250.0000']
  def totalBO1_BO1_20100718_20100720 = ['Branch Total:', 'BO 1', '1', '3000.0000', '247.1000', '2.9000', '250.0000']
  
  
  def centerTotal=['Center Total:','center 2','1','6000.0000','0.0000','0.0000','0.0000']
  def loanOfficerTotal=['Loan Officer Total:','br1 lo 1 smith','2','9000.0000','247.1000','2.9000','250.0000']
  def branchTotal=['Branch Total:','BO 1','3','12000.0000','3247.1000','5.8000','3252.9000']

  def pageFooter = ['Version 1.3', 'Page']


  @Test
  void testParams_BO1_ClosedObligationMet_20100101_20110314() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selected_office': '-1', 'selected_officer': '-1', 'selected_center': '-1', 'selected_status': 'Closed - obligation met', 'start_date': '2010-01-01', 'end_date': '2011-03-14', 'disbursal_or_closed_date': 'true']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header labels and values
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'All')
      t.assertCellEquals(3, 3, disbursalPeriodLabel)
     // TODO t.assertCellEquals(3, 4, '2010-01-01')
      //t.assertCellEquals(3, 5, toLabel)
     //TODO t.assertCellEquals(3, 6, '2011-03-14')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'All')

      t.assertCellEquals(5, 1, centerLabel)
      t.assertCellEquals(5, 2, 'All')
     
      // Details header
      def offset = 6
      t.assertRowEquals(offset, closedLoansHeader)
      //t.assertCellEquals(offset + 1, 1, centerGroupHeaderLabel)
      //t.assertCellEquals(offset + 1, 2, 'BO 1, br2 LO xxx, center dw1')
     

      // Details
      t.assertCellEquals(offset + 2,1, groupName_Closedobligationmet)
      t.assertCellEquals(offset + 2,2, memberName_Closedobligationmet)
      t.assertCellEquals(offset + 2,3, loanId_Closedobligationmet)
      t.assertCellEquals(offset + 2,4, disbursalDate_Closedobligationmet)
      t.assertCellEquals(offset + 2,5, disbursalAmount_Closedobligationmet)
      // t.assertCellEquals(offset + 2,6, purposeOfLoan_Closedobligationmet)
      t.assertCellEquals(offset + 2,6, loanCycle_Closedobligationmet)
      t.assertCellEquals(offset + 2,7, interestRate_Closedobligationmet)
      t.assertCellEquals(offset + 2,8, principalCollected_Closedobligationmet)
      t.assertCellEquals(offset + 2,9, interestCollected_Closedobligationmet)
      t.assertCellEquals(offset + 2,10, totalCollected_Closedobligationmet)
      t.assertCellEquals(offset + 2,11, closureDate_Closedobligationmet)
      t.assertCellEquals(offset + 2,12, reason_Closedobligationmet)
      //TODO t.assertCellEquals(offset + 2,13, daysSinceLoanClosed_Closedobligationmet)
      t.assertCellEquals(offset + 2,14, newLoanTaken_Closedobligationmet)

      // Group footer
      t.assertRowEquals(offset + 3, totalAllBranch_centerdw1_20100101_20110314)
      t.assertRowEquals(offset + 4, totalAllBranch_br2LOxxx_20100101_20110314)
      t.assertRowEquals(offset + 5, totalBranch_BO1_20100101_20110314)

      // Page footer
      offset = 12
      t.assertCellEquals(offset,1, 'Version 1.3')
      t.assertCellEquals(offset,2, 'Page  ')
      t.assertCellEquals(offset, 3, '1 / 1')
      t.assertCellEquals(offset + 1, 1, 'Printed by:')
      t.assertCellEquals(offset + 1, 2, 'On:')
    }
  }

 @Test
  void testParams_BO1_ClosedWriteenOff_20100718_20100720() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selected_office': '3', 'selected_officer': '-1', 'selected_center': '-1', 'selected_status': 'Closed - written off', 'start_date': '2010-07-08', 'end_date': '2010-07-20', 'disbursal_or_closed_date': 'false']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'BO 1')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'All')
      t.assertCellEquals(4, 3, closurePeriodLabel)
      //TODO t.assertCellEquals(4, 4, '2010-07-18')
      //t.assertCellEquals(4, 5, 'toLabel')
     //TODO  t.assertCellEquals(4, 6, '2011-07-20')
      t.assertCellEquals(5, 1, centerLabel)
      t.assertCellEquals(5, 2, 'All')
     

      // Details header
      def offset = 6
      t.assertRowEquals(offset, closedLoansHeader)
      //t.assertRowEquals(offset + 1, centerGroupHeaderLabel)
     // t.assertCellEquals(offset + 1,1, 'BO 1, br1 lo 1 smith, center dw1')

      /** Details **/
     
       t.assertCellEquals(offset + 2,1, groupName_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,2, memberName_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,3, loanId_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,4, disbursalDate_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,5, disbursalAmount_ClosedWrittenOff)
     // t.assertCellEquals(offset + 2,6, purposeOfLoan_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,6, loanCycle_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,7, interestRate_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,8, principalCollected_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,9, interestCollected_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,10, totalCollected_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,11, closureDate_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,12, reason_ClosedWrittenOff)
      //TODO t.assertCellEquals(offset + 2,13, daysSinceLoanClosed_ClosedWrittenOff)
      t.assertCellEquals(offset + 2,14, newLoanTaken_ClosedWrittenOff)

      
     

      // Group footer
      t.assertRowEquals(offset + 3, totalBO1_centerdw1_20100718_20100720)
      t.assertRowEquals(offset + 4, totalBO1_br1lo1smith_20100718_20100720)
      t.assertRowEquals(offset + 5, totalBO1_BO1_20100718_20100720)
      // Page footer
      offset = 12

       t.assertCellEquals(offset,1, 'Version 1.3')
      t.assertCellEquals(offset,2, 'Page  ')
      t.assertCellEquals(offset, 3, '1 / 1')
      t.assertCellEquals(offset + 1, 1, 'Printed by:')
      t.assertCellEquals(offset + 1, 2, 'On:')
      
      

    }
  }

 @Test
  void testParams_All_ClosedObligationMet_20100101_20110314() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selected_office': '-1', 'selected_officer': '-1', 'selected_center': '-1', 'selected_status': 'All', 'start_date': '2010-01-01', 'end_date': '2011-03-14', 'disbursal_or_closed_date': 'true']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header labels and values
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'All')
      t.assertCellEquals(3, 3, disbursalPeriodLabel)
     // TODO t.assertCellEquals(3, 4, '2010-01-01')
      //t.assertCellEquals(3, 5, toLabel)
     //TODO t.assertCellEquals(3, 6, '2011-03-14')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'All')

      t.assertCellEquals(5, 1, centerLabel)
      t.assertCellEquals(5, 2, 'All')
     
      // Details header
      def offset = 6
      t.assertRowEquals(offset, closedLoansHeader)
      //t.assertCellEquals(offset + 1, 1, centerGroupHeaderLabel)
      //t.assertCellEquals(offset + 1, 2, 'BO 1, br2 LO xxx, center dw1')
     

      // Details
      t.assertCellEquals(offset + 2,1, groupName)
      t.assertCellEquals(offset + 2,2, memberName)
      t.assertCellEquals(offset + 2,3, loanId)
      t.assertCellEquals(offset + 2,4, disbursalDate)
      t.assertCellEquals(offset + 2,5, disbursalAmount)
      // t.assertCellEquals(offset + 2,6, purposeOfLoan)
      t.assertCellEquals(offset + 2,6, loanCycle)
      t.assertCellEquals(offset + 2,7, interestRate)
      t.assertCellEquals(offset + 2,8, principalCollected)
      t.assertCellEquals(offset + 2,9, interestCollected)
      t.assertCellEquals(offset + 2,10, totalCollected)
      t.assertCellEquals(offset + 2,11, closureDate)
      t.assertCellEquals(offset + 2,12, reason_ClosedWrittenOff)
      //TODO t.assertCellEquals(offset + 2,13, daysSinceLoanClosed)
      t.assertCellEquals(offset + 2,14, newLoanTaken)

      // Group footer(Center Total)
      t.assertRowEquals(offset + 3, centerTotal)
      
       /** Details **/
     
      t.assertCellEquals(offset + 5,1, groupName_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,2, memberName_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,3, loanId_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,4, disbursalDate_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,5, disbursalAmount_ClosedWrittenOff)
     // t.assertCellEquals(offset + 5,6, purposeOfLoan_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,6, loanCycle_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,7, interestRate_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,8, principalCollected_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,9, interestCollected_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,10, totalCollected_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,11, closureDate_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,12, reason_ClosedWrittenOff)
      //TODO t.assertCellEquals(offset + 5,13, daysSinceLoanClosed_ClosedWrittenOff)
      t.assertCellEquals(offset + 5,14, newLoanTaken_ClosedWrittenOff)

	  // Group footer(Center Total and Loan OfficerTotal)
	  t.assertRowEquals(offset + 6, totalBO1_centerdw1_20100718_20100720)
	  t.assertRowEquals(offset + 7, loanOfficerTotal)
	  
	  
      // Details
      t.assertCellEquals(offset + 9,1, groupName_Closedobligationmet)
      t.assertCellEquals(offset + 9,2, memberName_Closedobligationmet)
      t.assertCellEquals(offset + 9,3, loanId_Closedobligationmet)
      t.assertCellEquals(offset + 9,4, disbursalDate_Closedobligationmet)
      t.assertCellEquals(offset + 9,5, disbursalAmount_Closedobligationmet)
      // t.assertCellEquals(offset + 2,6, purposeOfLoan_Closedobligationmet)
      t.assertCellEquals(offset + 9,6, loanCycle_Closedobligationmet)
      t.assertCellEquals(offset + 9,7, interestRate_Closedobligationmet)
      t.assertCellEquals(offset + 9,8, principalCollected_Closedobligationmet)
      t.assertCellEquals(offset + 9,9, interestCollected_Closedobligationmet)
      t.assertCellEquals(offset + 9,10, totalCollected_Closedobligationmet)
      t.assertCellEquals(offset + 9,11, closureDate_Closedobligationmet)
      t.assertCellEquals(offset + 9,12, reason_Closedobligationmet)
      //TODO t.assertCellEquals(offset + 9,13, daysSinceLoanClosed_Closedobligationmet)
      t.assertCellEquals(offset + 9,14, newLoanTaken_Closedobligationmet)
	  
	  // Group footer
      t.assertRowEquals(offset + 10, totalAllBranch_centerdw1_20100101_20110314)
	  t.assertRowEquals(offset + 11, totalAllBranch_br2LOxxx_20100101_20110314)
	  t.assertRowEquals(offset + 12, branchTotal)
      // Page footer
      offset = 19
      t.assertCellEquals(offset,1, 'Version 1.3')
      t.assertCellEquals(offset,2, 'Page  ')
      t.assertCellEquals(offset, 3, '1 / 1')
      t.assertCellEquals(offset + 1, 1, 'Printed by:')
      t.assertCellEquals(offset + 1, 2, 'On:')
    }
  }

 

}
