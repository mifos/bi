package org.mifos.bi.test

import org.junit.Test

class MPESALoanDisbursalsExportSummaryTest {

    def reportPath = 'reports/mpesa/prpts/MPESALoanDisbursalsExportSummary.prpt'
	
	def reportHeader = 'MPESA Loan Disbursals Export Summary'
	def mfiName = 'Mifos HO'

	def tableName = 'List Of Export Errors:'
	def detailsHeader = ['Loan Account Number', 'Error Description', 'Phone Number']

	def versionAndPage = ['Version 1.1', 'Page', '1 / 1']

    @Test
    void testParams_All_All_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '0', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, [reportHeader])
			t.assertRowEquals(2, [mfiName])

			// Selected parameters
			t.assertRowEquals(3, ['Selected Group:', 'ALL'])
			t.assertRowEquals(4, ['Selected Product:', 'ALL'])
			t.assertRowEquals(5, ['Selected Export Date:', '2010-07-08'])
			
            // Summary details:
            t.assertRowEquals(6, ['Total Amount Of Disbursals:', '9000.0000'])
			t.assertRowEquals(7, ['Number Of Exported Records:', '2'])

			// Details header:
			t.assertRowEquals(8, [tableName])
			t.assertRowEquals(9, detailsHeader)

			// Details:
			t.assertRowEquals(10, ['000100000000016', 'No phone number specified'])

			// Page footer:
			t.assertRowEquals(11, versionAndPage)
			t.assertCellEquals(12, 1, 'Printed by:')
			t.assertCellEquals(13, 1, 'On:')

        }
    }

	@Test
    void testParams_All_All_20100728() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '0', 'extract_date': '2010-07-28']

            // Report header
            t.assertRowEquals(1, [reportHeader])
			t.assertRowEquals(2, [mfiName])

			// Selected parameters
			t.assertRowEquals(3, ['Selected Group:', 'ALL'])
			t.assertRowEquals(4, ['Selected Product:', 'ALL'])
			t.assertRowEquals(5, ['Selected Export Date:', '2010-07-28'])
			
            // Summary details:
            t.assertRowEquals(6, ['Total Amount Of Disbursals:', '5000.0000'])
			t.assertRowEquals(7, ['Number Of Exported Records:', '1'])

			// Details header:
			t.assertRowEquals(8, [tableName])
			t.assertRowEquals(9, detailsHeader)

			// Details:
			t.assertRowEquals(10, ['000100000000059', 'Incorrect phone number format', '435'])
			t.assertRowEquals(11, ['000100000000066', 'No phone number specified'])

			// Page footer:
			t.assertRowEquals(12, versionAndPage)
			t.assertCellEquals(13, 1, 'Printed by:')
			t.assertCellEquals(14, 1, 'On:')

        }
    }

	@Test
    void testParams_groupdw12_All_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '5', 'l_product': '0', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, [reportHeader])
			t.assertRowEquals(2, [mfiName])

			// Selected parameters
			t.assertRowEquals(3, ['Selected Group:', 'group dw1 2'])
			t.assertRowEquals(4, ['Selected Product:', 'ALL'])
			t.assertRowEquals(5, ['Selected Export Date:', '2010-07-08'])
			
            // Summary details:
            t.assertRowEquals(6, ['Total Amount Of Disbursals:', '3000.0000'])
			t.assertRowEquals(7, ['Number Of Exported Records:', '1'])

			// Details header:
			t.assertRowEquals(8, [tableName])
			t.assertRowEquals(9, detailsHeader)

			// Details:
			t.assertRowEquals(10, ['000100000000016', 'No phone number specified'])

			// Page footer:
			t.assertRowEquals(11, versionAndPage)
			t.assertCellEquals(12, 1, 'Printed by:')
			t.assertCellEquals(13, 1, 'On:')

        }
    }

	@Test
    void testParams_All_loanprod1_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '1', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, [reportHeader])
			t.assertRowEquals(2, [mfiName])

			// Selected parameters
			t.assertRowEquals(3, ['Selected Group:', 'ALL'])
			t.assertRowEquals(4, ['Selected Product:', 'loan prod 1'])
			t.assertRowEquals(5, ['Selected Export Date:', '2010-07-08'])
			
            // Summary details:
            t.assertRowEquals(6, ['Total Amount Of Disbursals:', '9000.0000'])
			t.assertRowEquals(7, ['Number Of Exported Records:', '2'])

			// Details header:
			t.assertRowEquals(8, [tableName])
			t.assertRowEquals(9, detailsHeader)

			// Page footer:
			t.assertRowEquals(10, versionAndPage)
			t.assertCellEquals(11, 1, 'Printed by:')
			t.assertCellEquals(12, 1, 'On:')

        }
    }

	@Test
    void testParams_groupdw12_loanprod1_20100708() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '5', 'l_product': '1', 'extract_date': '2010-07-08']

            // Report header
            t.assertRowEquals(1, [reportHeader])
			t.assertRowEquals(2, [mfiName])

			// Selected parameters
			t.assertRowEquals(3, ['Selected Group:', 'group dw1 2'])
			t.assertRowEquals(4, ['Selected Product:', 'loan prod 1'])
			t.assertRowEquals(5, ['Selected Export Date:', '2010-07-08'])
			
            // Summary details:
            t.assertRowEquals(6, ['Total Amount Of Disbursals:', '3000.0000'])
			t.assertRowEquals(7, ['Number Of Exported Records:', '1'])

			// Details header:
			t.assertRowEquals(8, [tableName])
			t.assertRowEquals(9, detailsHeader)

			// Page footer:
			t.assertRowEquals(10, versionAndPage)
			t.assertCellEquals(11, 1, 'Printed by:')
			t.assertCellEquals(12, 1, 'On:')

        }
    }

	@Test
    void testParams_All_All_20100701() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['c_group': '-1', 'l_product': '0', 'extract_date': '2010-07-01']

            // Report header
            t.assertRowEquals(1, [reportHeader])
			t.assertRowEquals(2, [mfiName])

			// Selected parameters
			t.assertRowEquals(3, ['Selected Group:', 'ALL'])
			t.assertRowEquals(4, ['Selected Product:', 'ALL'])
			t.assertRowEquals(5, ['Selected Export Date:', '2010-07-01'])
			
            // Summary details:
            t.assertRowEquals(6, ['Total Amount Of Disbursals:'])
			t.assertRowEquals(7, ['Number Of Exported Records:', '0'])

			// Details header:
			t.assertRowEquals(8, [tableName])
			t.assertRowEquals(9, detailsHeader)

			// Page footer:
			t.assertRowEquals(10, versionAndPage)
			t.assertCellEquals(11, 1, 'Printed by:')
			t.assertCellEquals(12, 1, 'On:')

        }
    }

}

