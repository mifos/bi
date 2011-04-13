package org.mifos.bi.test

import org.junit.Test

public class WrittenOffTest {

    def mfiName = 'office-1'
    def reportName = 'Written Off Loans'
    def detailsHeader = ['Center Name', 'Group Name', 'Client Name', 'Account Number', 'Product Name', 'Disbursement Date', 'Loan Amount', 'Written Off Date', 'Written Off Principal', 'Written Off Interest', 'Reason', 'Loan Officer Name']
    def firstHeader = ['Branch Name :', 'office-2', 'Center Name :', 'center-1888', 'Group Name :', 'group-1890']
	def secondHeader = ['Branch Name :', 'office-2', 'Center Name :', 'center-1888', 'Group Name :', 'group-2070']
    def detailsBO1_20100718 = ['center-1888', 'group-1890', 'client-1930', '000100000047400',  'loan-1', '2010-02-22', '10000.0000', '2010-08-18', '7915.0000', '1425.0000', 'approved', 'user-21']
	def detailsBO2_20100718 = ['center-1888', 'group-2070', 'client-2088', '000100000031900',  'loan-1', '2009-10-05', '10000.0000', '2010-04-13', '7915.0000', '1425.0000', 'approved 10/02/2009', 'user-21']
    def GrouptotalBO1 = ['Group Total', '.', '10000.0000', '7915.0000', '1425.0000', '.']
	def GrouptotalBO2 = ['Group Total', '.', '10000.0000', '7915.0000', '1425.0000', '.']
    def CentertotalBO1 = ['Center Total', '.', '20000.0000', '15830.0000', '2850.0000', '.']
    def BranchtotalBO1 = ['Branch Total', '.', '20000.0000', '15830.0000', '2850.0000', '.']
	def grandTotalB01_20100701_20100815 = ['Grand Total', '.', '20000.0000', '15830.0000', '2850.0000', '.']
	def ReportHeader1 = ['Report Run Date:', '2011-04-12']
	def ReportHeader2 = ['From Date:', '2008-04-01', 'Source Name:', 'ALL']
	def ReportHeader3 = ['To Date:', '2011-04-12', 'Branch Name:', 'office-2']
	def ReportHeader4 = ['Product Name:', 'ALL', 'Center Name:', 'center-1888']
    
    def pageFooter = ['Version 1.0', 'Page']
	//for second branch
	
	def firstHeader2 = ['Branch Name :', 'office-5', 'Center Name :', 'center-7544', 'Group Name :', 'group-7549']
	def secondHeader2 = ['Branch Name :', 'office-5', 'Center Name :', 'center-8051', 'Group Name :', 'group-8131']
	def detailsBO1_20100718_1 = ['center-7544', 'group-7549', 'client-7583', '000100000056000',  'loan-2', '2010-05-12', '5000.0000', '2010-10-29', '3960.0000', '710.0000', 'approved', 'user-23']
	def detailsBO2_20100718_2 = ['center-8051', 'group-8131', 'client-8146', '000100000052600',  'loan-2', '2010-02-04', '3000.0000', '2010-07-30', '2375.0000', '425.0000', 'Automatic Status Update (Redo Loan)', 'user-33']
	def GrouptotalBO1_1 = ['Group Total', '.', '5000.0000', '3960.0000', '710.0000', '.']
	def GrouptotalBO2_1 = ['Group Total', '.', '3000.0000', '2375.0000', '425.0000', '.']
	def CentertotalBO1_1 = ['Center Total', '.', '5000.0000', '3960.0000', '710.0000', '.']
	def CentertotalBO2_1 = ['Center Total', '.', '3000.0000', '2375.0000', '425.0000', '.']
	def BranchtotalBO1_1 = ['Branch Total', '.', '8000.0000', '6335.0000', '1135.0000', '.']
	def grandTotalB01_20100701_20100815_1 = ['Grand Total', '.', '8000.0000', '6335.0000', '1135.0000', '.']
	def ReportHeader1_1 = ['Report Run Date:', '2011-04-12']
	def ReportHeader2_1 = ['From Date:', '2008-04-01', 'Source Name:', 'ALL']
	def ReportHeader3_1 = ['To Date:', '2011-04-12', 'Branch Name:', 'office-5']
	def ReportHeader4_1 = ['Product Name:', 'loan-2', 'Center Name:', 'ALL']
	
	// for third branch
	
	def firstHeader3 = ['Branch Name :', 'office-6', 'Center Name :', 'center-7342', 'Group Name :', 'group-7516']
	def secondHeader3 = ['Branch Name :', 'office-6', 'Center Name :', 'center-8193', 'Group Name :', 'group-8194']
	def detailsBO1_20100718_3 = ['center-7342', 'group-7516', 'client-7537', '000100000031500',  'loan-2', '2009-09-26', '1447.0000', '2009-11-14', '417.0000', '69.0000', 'Initial Data Entry', 'user-25']
	def detailsBO2_20100718_3 = ['center-8193', 'group-8194', 'client-8225', '000100000030100',  'loan-2', '2009-09-24', '2911.0000', '2009-11-12', '831.0000', '150.0000', 'Initial Data Entry', 'user-18']
	def GrouptotalBO1_3 = ['Group Total', '.', '1447.0000', '417.0000', '69.0000', '.']
	def GrouptotalBO2_3 = ['Group Total', '.', '2911.0000', '831.0000', '150.0000', '.']
	def CentertotalBO1_3 = ['Center Total', '.', '1447.0000', '417.0000', '69.0000', '.']
	def CentertotalBO2_3 = ['Center Total', '.', '2911.0000', '831.0000', '150.0000', '.']
	def BranchtotalBO1_3 = ['Branch Total', '.', '4358.0000', '1248.0000', '219.0000', '.']
	def grandTotalB01_20100701_20100815_3 = ['Grand Total', '.', '4358.0000', '1248.0000', '219.0000', '.']
	def ReportHeader1_3 = ['Report Run Date:', '2011-04-12']
	def ReportHeader2_3 = ['From Date:', '2008-04-01', 'Source Name:', 'fund-2']
	def ReportHeader3_3 = ['To Date:', '2009-12-31', 'Branch Name:', 'office-6']
	def ReportHeader4_3 = ['Product Name:', 'loan-2', 'Center Name:', 'ALL']

	
   @Test
       void testParams_All_branch1() {
        new PrptReport().execute () { t ->

             // Report settings
            t.reportPath = 'reports/standardReports/prpts/WrittenOff.prpt'
            t.reportParams = ['BRANCH_NAME': '2', 'CENTER_NAME': '1888', 'PRODUCT_NAME': '-1', 'SOURCE_NAME': '-1', 'FROM_DATE': '2008-04-01', 'TO_DATE': '2011-04-02']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
           // Report title
            t.assertRowEquals(2, [reportName])

            // Report header
			t.assertRowEquals(4, ReportHeader2 )
			t.assertRowEquals(5, ReportHeader3 )

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
			// 2nd Header
			t.assertRowEquals(offset+4, secondHeader)
        // 2nd Details Header
			t.assertRowEquals(offset+5, detailsHeader)
		//2nd details
			t.assertRowEquals(offset+6, detailsBO2_20100718)
			
        // 2nd Group Total
            t.assertRowEquals(offset+7, GrouptotalBO2)
			
			// Center Total
			
			t.assertRowEquals(offset+8, CentertotalBO1)
			
			// Branch Total
			
			t.assertRowEquals(offset+9, BranchtotalBO1)
			
			//Grand Total
			
			t.assertRowEquals(offset+10, grandTotalB01_20100701_20100815)
			

            // Page footer

            t.assertRowEquals(offset+11, pageFooter)
            t.assertCellEquals(offset+13, 1, 'Printed by:')
            t.assertCellEquals(offset+13, 3, 'On:')

        }
    }  
	
	
	@Test
	
	void testParams_All_branch2() {
		new PrptReport().execute () { t ->

			// Report settings
			t.reportPath = 'reports/standardReports/prpts/WrittenOff.prpt'
			t.reportParams = ['BRANCH_NAME': '5', 'CENTER_NAME': '-1', 'PRODUCT_NAME': '2', 'SOURCE_NAME': '-1', 'FROM_DATE': '2008-04-01', 'TO_DATE': '2011-04-02']

			// MFI Name
			t.assertRowEquals(1, [mfiName])
			// Report title
			t.assertRowEquals(2, [reportName])

			// Report header
			t.assertRowEquals(4, ReportHeader2_1 )
			t.assertRowEquals(5, ReportHeader3_1 )

		   // 1st Group header
			def offset = 10
		//1st Branch Header value
			
		t.assertRowEquals(offset, firstHeader2)
 
			// 1st Details header
			
		 t.assertRowEquals(offset+1, detailsHeader)
			
		//1st Details values
		 t.assertRowEquals(offset+2,detailsBO1_20100718_1)
		 
			// 1st Group total
			t.assertRowEquals(offset+3, GrouptotalBO1_1)
			//1st Center total
			
			t.assertRowEquals(offset+4, CentertotalBO1_1)
			
			// 2nd Header
			t.assertRowEquals(offset+5, secondHeader2)
		// 2nd Details Header
			
			t.assertRowEquals(offset+6, detailsHeader)
			
		//2nd details
			
			t.assertRowEquals(offset+7, detailsBO2_20100718_2)
			
		// 2nd Group Total
			t.assertRowEquals(offset+8, GrouptotalBO2_1)
			
			// Center Total
			
			t.assertRowEquals(offset+9, CentertotalBO2_1)
			
			// Branch Total
			
			t.assertRowEquals(offset+10, BranchtotalBO1_1)
			
			//Grand Total
			
			t.assertRowEquals(offset+11, grandTotalB01_20100701_20100815_1)
			

			// Page footer

			t.assertRowEquals(offset+12, pageFooter)
			t.assertCellEquals(offset+14, 1, 'Printed by:')
			t.assertCellEquals(offset+14, 3, 'On:')

		}
	}
	
	
	@Test
	
	void testParams_All_branch3() {
		new PrptReport().execute () { t ->

			/* Report settings.*/
			t.reportPath = 'reports/standardReports/prpts/WrittenOff.prpt'
			t.reportParams = ['BRANCH_NAME': '6', 'CENTER_NAME': '-1', 'PRODUCT_NAME': '2', 'SOURCE_NAME': '2', 'FROM_DATE': '2008-04-01', 'TO_DATE': '2009-12-31']

			/* MFI Name*/
			t.assertRowEquals(1, [mfiName])
			/* Report title*/
			t.assertRowEquals(2, [reportName])

			// Report header
			t.assertRowEquals(4, ReportHeader2_3 )
			t.assertRowEquals(5, ReportHeader3_3 )

		   // 1st Group header
			def offset = 10
		//1st Branch Header value
			
		t.assertRowEquals(offset, firstHeader3)
 
			// 1st Details header
			
		 t.assertRowEquals(offset+1, detailsHeader)
			
		//1st Details values
		 t.assertRowEquals(offset+2,detailsBO1_20100718_3)
		 
			// 1st Group total
			t.assertRowEquals(offset+3, GrouptotalBO1_3)
			//1st Center total
			
			t.assertRowEquals(offset+4, CentertotalBO1_3)
			
			// 2nd Header
			t.assertRowEquals(offset+5, secondHeader3)
		// 2nd Details Header
			
			t.assertRowEquals(offset+6, detailsHeader)
			
		//2nd details
			
			t.assertRowEquals(offset+7, detailsBO2_20100718_3)
			
		// 2nd Group Total
			t.assertRowEquals(offset+8, GrouptotalBO2_3)
			
			// Center Total
			
			t.assertRowEquals(offset+9, CentertotalBO2_3)
			
			// Branch Total
			
			t.assertRowEquals(offset+10, BranchtotalBO1_3)
			
			//Grand Total
			
			t.assertRowEquals(offset+11, grandTotalB01_20100701_20100815_3)
			

			// Page footer

			t.assertRowEquals(offset+12, pageFooter)
			t.assertCellEquals(offset+14, 1, 'Printed by:')
			t.assertCellEquals(offset+14, 3, 'On:')

		}
	}
}