package org.mifos.bi.test

import org.junit.Test;


class ClientStatusTest {
    def mfiName = 'Mifos HO'
    def reportName = 'Client Status'
    def detailsHeader = ['Client Name', 'Client ID', 'Client Age', 'Relation', 'Relative Name', 'Relative  Age', 'Address', 'City', 'State', 'Activation Date', 'Drop Out Date', 'Drop Out Reason', 'Client Status']

    def firstBranchHeader = ['Branch :', 'BO 1', 'Center :', 'center 3', 'Group :', 'group move out  of center?']
	def SecondBranchHeader = ['Branch :', 'br2', 'Center :', 'N/A', 'Group :', 'group w/o center  hier xfer branch ..']
	def ThirdBranchHeader = ['Branch :', 'BO 1', 'Center :', ' N/A', 'Group :', ' N/A']
	def FourthBranchHeader = ['Branch :', 'BO 1', 'Center :', ' Fee and Charge  Testing Center', 'Group :', 'Group with lots  of fees']

	def FifthBranchHeader = ['Branch :', 'BO 1', 'Center :', ' N/A', 'Group :', 'N/A']
	def SixthBranchHeader = ['Branch :', 'BO 1', 'Center :', ' center 3', 'Group :', 'group redo loans']
	def SeventhBranchHeader = ['Branch :', 'BO 1', 'Center :', ' center dw1', 'Group :', 'group dw1 2']
	def EighthBranchHeader = ['Branch :', 'br4', 'Center :', 'Fee and Charge  Testing Center', 'Group :', 'Group with lots  of fees']
	
    def detailsBO1_20100718 = ['client remove group  membership xxx', '0003-000000050', '21', '2010-08-01', 'Active']
	def detailsBO1_20100719 = ['remove group  membership xxx', '0003-000000054', '21', '2010-08-04', 'Active']
	
	def detailsBO1_20100720 = ['Will be deleted Very  soon', '0006-000000075', '24', '2010-07-18', 'Active']
//	def detailsBO1_20100721 = ['She2'll also be deleted  Very2 soon', '0003-000000050', '21', '2010-08-01', 'Active']
	
	def detailsBO1_20100722 = ['client remove group  membership xxx', '0003-000000050', '21', '2010-08-01', 'Active']
	def detailsBO1_20100723 = ['remove group  membership xxx', '0003-000000054', '21', '2010-08-04', 'Active']
	def detailsBO1_20100724 = ['client redo loans xxx', '0003-000000059', '21', '2010-08-20', 'Active']
	def detailsBO1_20100725 = ['client add back to group  hierarchy after xxx', '0003-000000051', '23', '2010-08-01', 'Active']
	def detailsBO1_20100726 = ['client charge anyone  xxx', '0006-000000063', '34', '2010-08-27', 'Active']
	
    def GrouptotalBO1 = ['Group Total:', '1']
	def GrouptotalBO2 = ['Group Total:', '2']


	def CentertotalBO1 = ['Center Total:', '1']
	def CentertotalBO2 = ['Center Total:', '2']

	def BranchtotalBO1 = ['Branch Total:', '1']
	def BranchtotalBO2 = ['Branch Total:', '2']
	def BranchtotalBO3 = ['Branch Total:', '4']
	def GrandtotalBO1 = ['Grand Total:', '2']
	def GrandtotalBO2 = ['Grand Total:', '5']
    def pageFooter = ['Version 1.3', 'Page', '1 / 1']

    @Test
    void testParams_All_20090101_20110101() {
        new PrptReport().execute () { t ->

            /* Report settings.*/
            t.reportPath = 'reports/standardReports/prpts/ClientStatus.prpt'
            t.reportParams = ['From_Date': '2010/08/01 00:00:00.000', 'To_Date': '2010/08/31 00:00:00.000', 'Branches': '3', 'Centers': '19', 'Member_Status': 'Active']

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
            def offset = 7
        //1st Branch Header value
            t.assertRowEquals(offset, ThirdBranchHeader)
        //1st  Header value
            t.assertRowEquals(offset+1, detailsHeader)
        //1st detail row
            t.assertRowEquals(offset+2, detailsBO1_20100718)
			t.assertRowEquals(offset+3, detailsBO1_20100719)
			t.assertRowEquals(offset+4, GrouptotalBO2)
			t.assertRowEquals(offset+5, CentertotalBO2)
			t.assertRowEquals(offset+6, BranchtotalBO2)
			t.assertRowEquals(offset+7, GrandtotalBO1)

            // Page footer

            t.assertRowEquals(offset+8, pageFooter)
            t.assertCellEquals(offset+9, 1, 'Printed by:')
           // t.assertCellEquals(offset+12, 3, 'On:') 

        }
    }  
	
	
	@Test
	void testParams_All_20090101_20110102() {
		new PrptReport().execute () { t ->

			/* Report settings.*/
			t.reportPath = 'reports/standardReports/prpts/ClientStatus.prpt'
			t.reportParams = ['From_Date': '2010/08/01 00:00:00.000', 'To_Date': '2010/08/31 00:00:00.000', 'Branches': '-1', 'Centers': '-1', 'Member_Status': ' All']

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
			t.assertCellEquals(5, 2, 'ALL')
			t.assertCellEquals(6, 2, 'ALL')
			t.assertCellEquals(6, 4, 'ALL')

			// 1st Group header
			def offset = 7
		//1st Branch Header value
			t.assertRowEquals(offset, FifthBranchHeader)
		//1st  Header value
			t.assertRowEquals(offset+1, detailsHeader)
		//1st detail row
			t.assertRowEquals(offset+2, detailsBO1_20100722)
			t.assertRowEquals(offset+3, detailsBO1_20100723)
			t.assertRowEquals(offset+4, GrouptotalBO2)
			t.assertRowEquals(offset+5, CentertotalBO2)
			t.assertRowEquals(offset+6, SixthBranchHeader)
			t.assertRowEquals(offset+7, detailsHeader)
			// 1st group total
			t.assertRowEquals(offset+8, detailsBO1_20100724)
		//2nd group Header
			t.assertRowEquals(offset+9, GrouptotalBO1)
	   // detail header
			t.assertRowEquals(offset+10, CentertotalBO1)
	   // 2 details
			t.assertRowEquals(offset+11, SeventhBranchHeader)
	 

		// center total
			
			t.assertRowEquals(offset+12, detailsHeader)
			// branch total
			t.assertRowEquals(offset+13, detailsBO1_20100725)
			//grand total
			t.assertRowEquals(offset+14, GrouptotalBO1)
			t.assertRowEquals(offset+15, CentertotalBO1)
			t.assertRowEquals(offset+16, BranchtotalBO3)
			t.assertRowEquals(offset+17, EighthBranchHeader)
			t.assertRowEquals(offset+18, detailsHeader)
			t.assertRowEquals(offset+19, detailsBO1_20100726)
			t.assertRowEquals(offset+20, GrouptotalBO1)
			t.assertRowEquals(offset+21, CentertotalBO1)
			t.assertRowEquals(offset+22, BranchtotalBO1)
			t.assertRowEquals(offset+23, GrandtotalBO2)

			// Page footer

			t.assertRowEquals(offset+24, pageFooter)
			t.assertCellEquals(offset+25, 1, 'Printed by:')
		   // t.assertCellEquals(offset+12, 3, 'On:')

		}
	}
}