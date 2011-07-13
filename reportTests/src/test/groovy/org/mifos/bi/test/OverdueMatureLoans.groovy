package org.mifos.bi.test

import org.junit.Test

class OverdueMatureLoans {


  def reportPath = 'reports/standardReports/prpts/OverdueMatureLoans.prpt'
  def reportName = 'Overdue Mature Loans'

  /** Headers for Overdue Mature Loans**/
  
def overdueLoansHeader = ['Group Name','Client Name','Loan Id','Disbursal Date','Disbursed Amount','Purpose Of Loan','Principal Repaid','Interest Repaid','Last Paid Date','Principal Overdue','Interest Overdue','Principal Overdue(%)','Principal Outstanding','Interest Outstanding']

def overdueMatureLoansHeader = ['Group Name','Client Name','Loan Id','Disbursal Date','Disbursed Amount','Purpose Of Loan','Principal Repaid','Interest Repaid','Last Paid Date','Principal Overdue','Interest Overdue','Principal Overdue(%)']
 
  /** assorted Labels                  ***/
  def officeLabel = "Office:"
  def loanOfficerLabel = "Loan Officer:"
  def centerLabel = "Center:"
  def overdueMatureLoansLabel = "Show Only Mature Loans:"
  def centerGroupHeaderLabel="Office, Loan Officer, Center:"
  /** *Expected Data              **/
  def mfiName = 'Mifos HO'

  def detailsAllBranch_OverdueLoans = ['br2 group 1', 'br2 client 1 xxx', '32', '2010-07-21', '3000.0000','75.1000','2.9000','2010-07-21','3000.0000','21.0000','100.00','2924.9000','18.1000']
  def centerTotal_br2center1_OverdueLoans = ['Center Total:', 'br2 center 1', '1', '3000.0000', '75.1000','2.9000', '3000.0000','21.0000','2924.9000','18.1000']
  def loanOfficerTotal_br2LOxxx_OverdueLoans = ['Loan Officer Total:', 'br2 LO xxx', '1', '3000.0000', '75.1000','2.9000', '3000.0000','21.0000','2924.9000','18.1000']
  def branchTotal_br2_OverdueLoans = ['Branch Total:', 'br2', '1', '3000.0000', '75.1000','2.9000', '3000.0000','21.0000','2924.9000','18.1000']
  def detailsAllBranch_OverdueMatureLoans = ['br2 group 1', 'br2 client 1 xxx', '32', '2010-07-21', '3000.0000', '75.1000', '2.9000','2010-07-21','3000.0000','21.0000','100.00']
  def centerTotal_br2center1_OverdueMatureLoans = ['Center Total:', 'br2 center 1', '1', '3000.0000', '75.1000','2.9000', '3000.0000','21.0000']
  def loanOfficerTotal_br2LOxxx_OverdueMatureLoans = ['Loan Officer Total:', 'br2 LO xxx', '1', '3000.0000', '75.1000','2.9000', '3000.0000','21.0000']
  def branchTotal_br2_OverdueMatureLoans = ['Branch Total:', 'br2', '1', '3000.0000', '75.1000','2.9000', '3000.0000','21.0000']
  

  def pageFooter = ['Version 1.3', 'Page']


  @Test
  void testParams_br2_OverdueLoans() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selected_office': '-1', 'selected_officer': '-1', 'selected_center': '-1', 'selected_loans': 'false']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header labels and values
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'All')
      t.assertCellEquals(3, 3, overdueMatureLoansLabel)
      t.assertCellEquals(3, 4, 'No')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'All')

      t.assertCellEquals(5, 1, centerLabel)
      t.assertCellEquals(5, 2, 'All')
     
      // Details header
      def offset = 6
      t.assertRowEquals(offset, overdueLoansHeader)
      //t.assertRowEquals(offset + 1, centerGroupHeaderLabel)
      //t.assertCellEquals(offset + 1,1, 'br2, br2 LO xxx, br2 center 1')
     

      // Details
      t.assertRowEquals(8, ['No Data Available'])

      // Group footer
      t.assertRowEquals(offset + 3, ['Center Total:','0','0','0','0','0','0','0','0'])
      t.assertRowEquals(offset + 4, ['Loan Officer Total:','0','0','0','0','0','0','0','0'])
      t.assertRowEquals(offset + 5, ['Branch Total:','0','0','0','0','0','0','0','0'])

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
  void testParams_br2_OverdueMatureLoans() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selected_office': '-1', 'selected_officer': '-1', 'selected_center': '-1', 'selected_loans': 'true']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header labels and values
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'All')
      t.assertCellEquals(3, 3, overdueMatureLoansLabel)
      t.assertCellEquals(3, 4, 'Yes')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'All')

      t.assertCellEquals(5, 1, centerLabel)
      t.assertCellEquals(5, 2, 'All')
     
      // Details header
      def offset = 6
      t.assertRowEquals(offset, overdueMatureLoansHeader)
      //t.assertRowEquals(offset + 1, centerGroupHeaderLabel)
      //t.assertCellEquals(offset + 1,1, 'br2, br2 LO xxx, br2 center 1')
     

      // Details
      t.assertRowEquals(offset + 2, ['No Data Available'])

      // Group footer
      t.assertRowEquals(offset + 3, ['Center Total:','0','0','0','0','0','0'])
      t.assertRowEquals(offset + 4, ['Loan Officer Total:','0','0','0','0','0','0'])
      t.assertRowEquals(offset + 5, ['Branch Total:','0','0','0','0','0','0'])

      // Page footer
      offset = 12
      t.assertCellEquals(offset,1, 'Version 1.3')
      t.assertCellEquals(offset,2, 'Page  ')
      t.assertCellEquals(offset, 3, '1 / 1')
      t.assertCellEquals(offset + 1, 1, 'Printed by:')
      t.assertCellEquals(offset + 1, 2, 'On:')
     
    }
  }
  }
