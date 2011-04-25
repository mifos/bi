package Test_Groovy;

import org.junit.Test;

import org.junit.Test;

class ClientStatusTest {
   def mfiName = 'office-1'
    def reportName = 'Members Profile'
    def detailsHeader = ['Member Name', 'AccountNo', 'Member Age', 'Guardian Name', 'Guardian Age', 'Relation', 'Locality', 'City', 'State', 'Activation Date', 'Drop Out Date', 'Drop Out Reason', 'Member Status']

    def firstBranch = ['Branch Name', 'office-2']
    def firstCenter = ['Center Name', 'center-10872']
    def firstGroup = ['Group Name', 'group-12820']
    def detailsBO1_20100718 = ['client-12822', '0002-000012822', '50', '2010-03-12', 'Customer Was Hold']
	def detailsBO1_20100719 = ['client-12824', '0002-000012824', '35', '2010-03-12', 'Customer Was Active']
	def detailsBO1_20100720 = ['client-12828', '0002-000012828', '27', '2010-03-12', 'Customer Was Hold']
	def detailsBO1_20100721 = ['client-12830', '0002-000012830', '56', '2010-03-12', 'Customer Was Active']
	def detailsBO1_20100722 = ['client-12831', '0002-000012831', '46', '2010-03-12', 'Customer Was Active']
    def GrouptotalBO1 = ['Group Members:', '5.']
	def CentertotalBO1 = ['Center Members:', '5.']
	def BranchtotalBO1 = ['Branch Members:', '5.']
	def GrandtotalBO1 = ['Total Members:', '5.']
    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_All_20090101_20110101() {
        new PrptReport().execute () { t ->

            /* Report settings.*/
            t.reportPath = 'reports/standardReports/prpts/ClientStatus.prpt'
            t.reportParams = ['From_Date': '2010-01-12', 'To_Date': '2010-04-27', 'Branches': '2', 'Centers': '10872', 'Member_Status': '-1']

            /* MFI Name*/
            t.assertRowEquals(1, [mfiName])
            /* Report title*/
            t.assertRowEquals(2, [reportName])

            // Report header
            t.assertCellEquals(4, 1, 'From Date:')
            t.assertCellEquals(5, 1, 'To Date:')
       t.assertCellEquals(6, 1, 'Branch Name:')
        t.assertCellEquals(7, 1, 'Center Name:')
        t.assertCellEquals(8, 1, 'Member Status:')
        t.assertCellEquals(4, 2, '2010-01-12')
        t.assertCellEquals(5, 2, '2010-04-27')
        t.assertCellEquals(6, 2, 'office-2')
        t.assertCellEquals(7, 2, 'center-10872')
		t.assertCellEquals(8, 2, 'ALL')

            // 1st Group header
            def offset = 9
        //1st Branch Header value
            t.assertRowEquals(offset, firstBranch)
        //1st Center Header value
            t.assertRowEquals(offset+1, firstCenter)
        //1st Group Header value
            t.assertRowEquals(offset+2, firstGroup)
            // 1st Details header
            t.assertRowEquals(offset+3, detailsHeader)
        //1st Details values
       t.assertRowEquals(offset+4,detailsBO1_20100718)
	   //2nd row
	   t.assertRowEquals(offset+5,detailsBO1_20100719)
	   //3 row
	   t.assertRowEquals(offset+6,detailsBO1_20100720)
	   //4 row
	   t.assertRowEquals(offset+7,detailsBO1_20100721)
	   //5 row
	   t.assertRowEquals(offset+8,detailsBO1_20100722)
            // 1st Group footer
            t.assertRowEquals(offset+9, GrouptotalBO1)
        // 1st Center footer
			
            t.assertRowEquals(offset+10, CentertotalBO1)
        // 1st Group footer
			
            t.assertRowEquals(offset+11, BranchtotalBO1)

        // Report footer
			
            t.assertRowEquals(offset+12, GrandtotalBO1)

            // Page footer
            offset = 22
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 3, 'On:')

        }
    }  
}