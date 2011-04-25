package org.mifos.bi.test

import org.junit.Test

public class WrittenOffTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Written Off Loans'
    def detailsHeader = ['Center Name', 'Group Name', 'Client Name', 'Account Number', 'Product Name', 'Disbursement Date', 'Loan Amount', 'Written Off Date', 'Written Off Principal', 'Written Off Interest', 'Reason', 'Loan Officer Name']
    def firstHeader = ['Branch Name :', 'BO 1', 'Center Name :', 'center dw1', 'Group Name :', 'group dw1 2']
	def detailsBO1_20100718 = ['center dw1', 'group dw1 2', 'client dw1 1 1 zeppelin', '000100000000004',  'loan prod 1', '2010-07-16', '3000.0000', '2010-07-18', '2752.9000', '0.0000', 'go', 'br1 lo 1 smith']
	def GrouptotalBO1 = ['Group Total', '.', '3000.0000', '2752.9000', '0.0000', '.']
	def CentertotalBO1 = ['Center Total', '.', '3000.0000', '2752.9000', '0.0000', '.']
    def BranchtotalBO1 = ['Branch Total', '.', '3000.0000', '2752.9000', '0.0000', '.']
	def grandTotalB01_20100701_20100815 = ['Grand Total', '.', '3000.0000', '2752.9000', '0.0000', '.']
	def ReportHeader1 = ['Report Run Date:', '2011-04-25']
	def ReportHeader2 = ['From Date:', '2008-04-01', 'Source Name:', 'ALL']
	def ReportHeader3 = ['To Date:', '2011-04-25', 'Branch Name:', 'BO 1']
	def ReportHeader4 = ['Product Name:', 'loan prod 1', 'Center Name:', 'center dw1']
    
    def pageFooter = ['Version 1.0', 'Page']


	
   @Test
       void testParams_All_branch1() {
        new PrptReport().execute () { t ->

             // Report settings
            t.reportPath = 'reports/standardReports/prpts/WrittenOff.prpt'
            t.reportParams = ['BRANCH_NAME': '3', 'CENTER_NAME': '1', 'PRODUCT_NAME': '1', 'SOURCE_NAME': '-1', 'FROM_DATE': '2008-04-01', 'TO_DATE': '2011-04-25']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
           // Report title
            t.assertRowEquals(2, [reportName])

            // Report header
		//	t.assertRowEquals(4, ReportHeader2 )
		//	t.assertRowEquals(5, ReportHeader3 )

           // 1st Group header
            def offset = 10
        //1st Branch Header value
            t.assertRowEquals(offset, firstHeader)
 
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
			
        //1st Details values
         t.assertRowEquals(offset+2,detailsBO1_20100718)
		 
            // 1st Group total
            t.assertRowEquals(offset+3, GrouptotalBO1)
		
			// Center Total
			
			t.assertRowEquals(offset+4, CentertotalBO1)
			
			// Branch Total
			
			t.assertRowEquals(offset+5, BranchtotalBO1)
			
			//Grand Total
			
			t.assertRowEquals(offset+6, grandTotalB01_20100701_20100815)
			

            // Page footer

            t.assertRowEquals(offset+7, pageFooter)
            t.assertCellEquals(offset+9, 1, 'Printed by:')
            t.assertCellEquals(offset+9, 3, 'On:')

        }
    }  
}