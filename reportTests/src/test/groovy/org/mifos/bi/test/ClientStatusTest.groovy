package org.mifos.bi.test

import org.junit.Test;


class ClientStatusTest {
   def mfiName = 'Mifos HO'
    def reportName = 'Client Status'
    def detailsHeader = ['Client Name', 'Client ID', 'Client Age', 'Relation', 'Relative Name', 'Relative  Age', 'Address', 'City', 'State', 'Activation Date', 'Drop Out Date', 'Drop Out Reason', 'Client Status']

    def firstBranchHeader = ['Branch Name:', 'BO 1', 'Center Name:', 'center 2', 'Group Name:', 'group 1 for  center 2']
	def SecondBranchHeader = ['Branch Name:', 'BO 1', 'Center Name:', 'center 2', 'Group Name:', 'group standalone']
	//def ThirdBranchHeader = ['Branch Name:', 'BO 1', 'Center Name:', 'center 2', 'Group Name:', 'group xfer  another branch']
    def detailsBO1_20100718 = ['xfer to gr in same  branch xxx', '0003-000000023', '23', '2010-07-22', 'Active']
	def detailsBO1_20100719 = ['client group standalone  xxx', '0003-000000038', '23', '2010-07-29', 'Active']
	//def detailsBO1_20100720 = ['client xfer to another  branch xxx', '0003-000000040', '23', '2010-07-29', 'Active']
    def GrouptotalBO1 = ['Group Total:', '1']
	def GrouptotalBO1_2 = ['Group Total:', '1']
	//def GrouptotalBO1_3 = ['Group Total:', '1']
	def CentertotalBO1 = ['Center Total:', '2']
	def BranchtotalBO1 = ['Branch Total:', '2']
	def GrandtotalBO1 = ['Grand Total:', '2']
    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_All_20090101_20110101() {
        new PrptReport().execute () { t ->

            /* Report settings.*/
            t.reportPath = 'reports/standardReports/prpts/ClientStatus.prpt'
            t.reportParams = ['From_Date': '2010/04/01 00:00:00.000', 'To_Date': '2011/05/12 00:00:00.000', 'Branches': '3', 'Centers': '19', 'Member_Status': 'Active']

            /* MFI Name*/
            t.assertRowEquals(1, [mfiName])
            /* Report title*/
            t.assertRowEquals(2, [reportName])

            // Report header
            t.assertCellEquals(3, 1, 'From Date:')
            t.assertCellEquals(4, 1, 'To Date:')
			t.assertCellEquals(5, 1, 'Branch Name:')
			t.assertCellEquals(6, 1, 'Center Name:')
        	t.assertCellEquals(6, 3, 'Client Status:')
			//t.assertCellEquals(3, 2, '2010-04-01')
			//t.assertCellEquals(4, 2, '2011-05-17')
			t.assertCellEquals(5, 2, 'BO 1')
			t.assertCellEquals(6, 2, 'center 2')
			t.assertCellEquals(6, 4, 'Active')

            // 1st Group header
            def offset = 8
        //1st Branch Header value
            t.assertRowEquals(offset, firstBranchHeader)
        //1st  Header value
            t.assertRowEquals(offset+1, detailsHeader)
        //1st detail row
            t.assertRowEquals(offset+2, detailsBO1_20100718)
            // 1st group total
			t.assertRowEquals(offset+3, GrouptotalBO1)
        //2nd group Header
			t.assertRowEquals(offset+4, SecondBranchHeader)
	   // detail header
			t.assertRowEquals(offset+5, detailsHeader)
	   // 2 details
			t.assertRowEquals(offset+6, detailsBO1_20100719)
	   // 2nd group total
			t.assertRowEquals(offset+7, GrouptotalBO1_2)
	 /*  // 3rd group header
			t.assertRowEquals(offset+8, ThirdBranchHeader)
            // detail header
            t.assertRowEquals(offset+9, detailsHeader)
        // 3rd row
			
            t.assertRowEquals(offset+10, detailsBO1_20100720)
        // 3rd group total
			
            t.assertRowEquals(offset+11, GrouptotalBO1_3)*/

        // center total
			
            t.assertRowEquals(offset+8, CentertotalBO1)
			// branch total
			t.assertRowEquals(offset+9, BranchtotalBO1)
			//grand total
			t.assertRowEquals(offset+10, GrandtotalBO1)


            // Page footer

            t.assertRowEquals(offset+11, pageFooter)
            t.assertCellEquals(offset+12, 1, 'Printed by:')
           // t.assertCellEquals(offset+12, 3, 'On:') 

        }
    }  
}