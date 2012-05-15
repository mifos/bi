package org.mifos.bi.test

import org.junit.Test

class BalanceOutstandingTest {


  def reportPath = 'reports/standardReports/prpts/BalanceOutstanding.prpt'
  def reportName = 'Balance Outstanding'

  /** Headers for Loan , Saving Products and Details                    **/
  def loanProductsHeader = ['Loan Products']
  def savingProductsHeader = ['Saving Products']
  def loanProductDetailsHeader = ['Account Id', 'Client Name', 'Loan Amount',
          'Balance Amount', 'Loan Status',
          'Disbursal Date', 'Gender', 'Group Name',
          'Loan Officer', 'Source Of Funds']
  def savingProductDetailsHeader = ['Account Id', 'Client Name',
          'Balance Amount', 'Saving Status',
          'Date Of Opening', 'Gender', 'Group Name',
          'Loan Officer']
  /** assorted Labels                  ***/
  def officeLabel = "Office:"
  def loanOfficerLabel = "Loan Officer:"
  def productLabel = "Product:"
  def statusLabel = "Status:"
  def asOnDateLabel = "As On Date:"

  /** *Expected Data              **/
  def mfiName = 'Mifos HO'

  def detailsBr2_SavingsProduct1_20110130 = ['109', 'client charge anyone xxx', '20.0000', 'Active', '2010-08-27', 'Female', 'Group with lots of fees', 'Fees LO xxx']
  def detailsBr2_LoanProduct1_20110128 = ['32', 'br2 client 1 xxx', '3000.0000', '2924.9000', 'Active in Bad Standing', '2010-07-21', 'Female', 'br2 group 1', 'br2 LO xxx', '-']
  def detailsBr2_CentersSavings_20110128 = ['61', 'center with savings a/c', '800.7000', 'Active', '2010-07-25', 'br2 LO xxx']
  def detailsBr2_GroupSavings_20110128 = ['56', 'group w/o center hierarchy', '0.0000', 'Active', '2010-07-25', 'group w/o center hierarchy', 'br2 LO xxx']
  def detailsBr2_SavingProduct1_20110128 = ['30', 'br2 client 1 xxx', '1209.2000', 'Active', '2010-07-21', 'Female', 'br2 group 1', 'br2 LO xxx']
  def detailsBr2_GroupSavings1_20110128 = ['58', 'client of group w/o center xxx', '0.0000', 'Active', '2010-07-25', 'Male', 'group w/o center hierarchy', 'br2 LO xxx']
  def totalBr2_20110128 = ['Total for', 'loan prod 1', '3000.0000', '2924.9000']
  def totalBr2_20110130 = ['Total for', 'savings product 1', '20.0000']
  def totalBr2_LoanProduct_20110128 = ['Total for', 'loan prod 1', '3000.0000', '2924.9000']
  def totalBr2_CenterSavings_20110128 = ['Total for', 'center savings', '800.7000']
  def totalBr2_GroupSavings_20110128 = ['Total for', 'group savings product', '0.0000']
  def totalBr2_SavingsProduct_20110128 = ['Total for', 'savings product 1', '1209.2000']
  def loanProduct = ['Loan Product:', 'loan prod 1']
  def savingProduct = ['Saving Product:', 'savings product 1']

  def pageFooter = ['Version 1.3.1', 'Page:']


  @Test
  void testParams_br2_loanProduct_20110128() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selectedBranch': '1.1.1.', 'selectedLoanOfficer': '5', 'selectedProduct': '1', 'selectedProductStatus': 'AccountState-ActiveInBadStanding', 'asOnDate': '2011-01-28', 'groupTotal': 'false', 'loanOfficerTotal': 'false', 'branchTotal': 'false']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header labels and values
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'br2')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'br2 LO xxx')

      t.assertCellEquals(5, 1, productLabel)
      t.assertCellEquals(5, 2, 'loan prod 1')
      t.assertCellEquals(6, 1, statusLabel)
      t.assertCellEquals(6, 2, 'Loan - Active in Bad Standing')
      t.assertCellEquals(7, 1, asOnDateLabel)
      // TODO t.assertCellEquals(7, 2, '2011-01-28')

      // Details header
      def offset = 8
      t.assertRowEquals(offset, loanProductsHeader)
      t.assertRowEquals(offset + 1, loanProduct)
      t.assertRowEquals(offset + 2, loanProductDetailsHeader)

      // Details
      t.assertRowEquals(offset + 3, detailsBr2_LoanProduct1_20110128)

      // Group footer
      t.assertRowEquals(offset + 4, totalBr2_20110128)

      // Page footer
      offset = 13
      t.assertRowEquals(offset, pageFooter)
      t.assertCellEquals(offset + 1, 1, 'Printed On:')

      t.assertCellEquals(offset + 1, 3, '1 / 1')
      t.assertCellEquals(offset + 2, 1, 'Printed By:')
      // t.assertCellEquals(offset + 2, 2, 'Designer')
    }
  }

  @Test
  void testParams_br2_savingProduct_20110130() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selectedBranch': '1.1.2.', 'selectedLoanOfficer': '7', 'selectedProduct': '2', 'selectedProductStatus': 'SavingsStatus-Active', 'asOnDate': '2011-01-30', 'groupTotal': 'false', 'loanOfficerTotal': 'false', 'branchTotal': 'false']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Report header
      t.assertCellEquals(3, 1, officeLabel)
      t.assertCellEquals(3, 2, 'br4')
      t.assertCellEquals(4, 1, loanOfficerLabel)
      t.assertCellEquals(4, 2, 'Fees LO xxx')

      t.assertCellEquals(5, 1, productLabel)
      t.assertCellEquals(5, 2, 'savings product 1')
      t.assertCellEquals(6, 1, statusLabel)
      t.assertCellEquals(6, 2, 'Saving - Active')
      t.assertCellEquals(7, 1, asOnDateLabel)
      // TODO t.assertCellEquals(7, 2, '2011-01-30')

      // Details header
      def offset = 8
      t.assertRowEquals(offset, savingProductsHeader)
      t.assertRowEquals(offset + 1, savingProduct)

      /** Loan Product  **/
      // Group loan
      t.assertRowEquals(offset + 2, savingProductDetailsHeader)
      // loan prod 1
      t.assertRowEquals(offset + 3, detailsBr2_SavingsProduct1_20110130)

      // Group footer
      t.assertRowEquals(offset + 4, totalBr2_20110130)

      // Page footer
      offset = 13

      t.assertRowEquals(offset, pageFooter)
      t.assertCellEquals(offset + 1, 1, 'Printed On:')

      t.assertCellEquals(offset + 1, 3, '1 / 1')
      t.assertCellEquals(offset + 2, 1, 'Printed By:')

    }
  }

  @Test
  void testParams_br2_allProducts_20110128() {
    new PrptReport().execute() { t ->

      // Report settings.
      t.reportPath = reportPath
      t.reportParams = ['selectedBranch': '1.1.1.', 'selectedLoanOfficer': '5', 'selectedProduct': '0', 'selectedProductStatus': 'ALL', 'asOnDate': '2011-01-31', 'groupTotal': 'false', 'loanOfficerTotal': 'false', 'branchTotal': 'false']

      // MFI Name
      t.assertRowEquals(1, [mfiName])
      // Report title
      t.assertRowEquals(2, [reportName])

      // Page header
      t.assertCellEquals(3, 1, 'Office:')
      t.assertCellEquals(3, 2, 'br2')
      t.assertCellEquals(4, 1, 'Loan Officer:')
      t.assertCellEquals(4, 2, 'br2 LO xxx')

      t.assertCellEquals(5, 1, 'Product:')
      t.assertCellEquals(5, 2, 'ALL')
      t.assertCellEquals(6, 1, 'Status:')
      t.assertCellEquals(6, 2, 'ALL')
      t.assertCellEquals(7, 1, 'As On Date:')
      // TODO t.assertCellEquals(7, 2, '2011-01-28')

      // Loan Product Details header
      def offset = 8
      t.assertRowEquals(offset, loanProductsHeader)
      t.assertRowEquals(offset + 1, loanProduct)
      t.assertRowEquals(offset + 2, loanProductDetailsHeader)

      // loan prod 1
      t.assertRowEquals(offset + 3, detailsBr2_LoanProduct1_20110128)
      // 1st Group footer
      t.assertRowEquals(offset + 4, totalBr2_LoanProduct_20110128)

      //(Centre Savings) Saving Product Details header
      offset = 13
      t.assertRowEquals(offset, savingProductsHeader)
      t.assertCellEquals(offset + 1, 1, 'Saving Product:')
      t.assertCellEquals(offset + 1, 2, 'center savings')
      t.assertRowEquals(offset + 2, savingProductDetailsHeader)
      // centerSavings
      t.assertRowEquals(offset + 3, detailsBr2_CentersSavings_20110128)
      // Group footer
      t.assertRowEquals(offset + 4, totalBr2_CenterSavings_20110128)

      //(Group Savings) Saving Product Details header
      offset = 18

      t.assertCellEquals(offset, 1, 'Saving Product:')
      t.assertCellEquals(offset, 2, 'group savings product')
      t.assertRowEquals(offset + 1, savingProductDetailsHeader)
      //groupSavings
      t.assertRowEquals(offset + 2, detailsBr2_GroupSavings_20110128)
      // Group footer
      t.assertRowEquals(offset + 3, totalBr2_GroupSavings_20110128)

      //(Client Savings) Saving Product Details header
      offset = 22
      t.assertCellEquals(offset, 1, 'Saving Product:')
      t.assertCellEquals(offset, 2, 'savings product 1')
      t.assertRowEquals(offset + 1, savingProductDetailsHeader)
      //savingProduct
      t.assertRowEquals(offset + 2, detailsBr2_SavingProduct1_20110128)
      t.assertRowEquals(offset + 3, detailsBr2_GroupSavings1_20110128)
      // Group footer
      t.assertRowEquals(offset + 4, totalBr2_SavingsProduct_20110128)

      // Page footer
      offset = 27
      t.assertRowEquals(offset, pageFooter)
      t.assertCellEquals(offset + 1, 1, 'Printed On:')

      t.assertCellEquals(offset + 1, 3, '1 / 1')
      t.assertCellEquals(offset + 2, 1, 'Printed By:')

    }
  }

}
