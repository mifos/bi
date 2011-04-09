package org.mifos.bi.test

import org.junit.Test
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import org.joda.time.Days

class LoansToBeDisbursedTest {

    def today = DateTimeFormat.forPattern("yyyy-MM-dd").print(new DateTime())
    def timeOffset = Days.daysBetween(new DateTime(2010, 12, 31, 0, 0, 0, 0), new DateTime()).getDays()

    def mfiName = 'Mifos HO'
    def reportPath = 'reports/standardReports/prpts/LoansToBeDisbursed.prpt'
    def reportName = 'Loans To Be Disbursed';
    def detailsHeader = ['Office', 'Account ID', 'Center name', 'Group name', 'Client name', 'Product name', 'Loan Officer', 'Loan Amount', 'Days awaiting disbursal', 'Last edited by']

    def detailsAccount55 = ['br2', '000100000000055', 'a', 'group w/o center ..', 'group w/o center ..', 'group loan', 'br2 LO xxx', '5000.0000', String.valueOf(159+timeOffset), 'mifos']
    def detailsAccount59 = ['br2', '000100000000059', 'a', 'group w/o center ..', 'client of group w/o ..', 'loan prod 1', 'br2 LO xxx', '3000.0000', String.valueOf(159+timeOffset), 'mifos']
    def totalAll = ['Total', '41000.0000']
    def totalbr4FeesLOxxx = ['Total', '0']
    def totalAllLoanProd1 = ['Total', '18000.0000']

    def pageFooter = ['Version 1.1', 'Page', '1 / 1']

    @Test
    void testParams_All_All_All() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '0', 'selected_product': '0']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['As Of:', today, 'Office:', 'All'])
            t.assertRowEquals(4, ['Product:', 'All', 'Loan Officer:', 'All'])

            // Details header
            t.assertRowEquals(5, detailsHeader)
            t.assertRowEquals(11, detailsAccount55)
            t.assertRowEquals(12, detailsAccount59)

            // Group footer
            t.assertRowEquals(16, totalAll)

            // Page footer
            t.assertRowEquals(17, pageFooter)
            t.assertCellEquals(18, 1, 'Printed by:')
            t.assertCellEquals(18, 2, 'On:')
        }
    }

    @Test
    void testParams_br4_feesLOxxx_All() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.2.', 'selected_loan_officer': '7', 'selected_product': '0']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['As Of:', today, 'Office:', 'br4'])
            t.assertRowEquals(4, ['Product:', 'All', 'Loan Officer:', 'Fees LO xxx'])

            // Details header
            t.assertRowEquals(5, detailsHeader)

            // Group footer
            t.assertRowEquals(6, totalbr4FeesLOxxx)

            // Page footer
            t.assertRowEquals(7, pageFooter)
            t.assertCellEquals(8, 1, 'Printed by:')
            t.assertCellEquals(8, 2, 'On:')
        }
    }

    @Test
    void testParams_All_All_loanProd1() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '-1', 'selected_loan_officer': '0', 'selected_product': '1']

            // Report title
            t.assertRowEquals(1, [reportName])
            // MFI Name
            t.assertRowEquals(2, [mfiName])


            // Page header
            t.assertRowEquals(3, ['As Of:', today, 'Office:', 'All'])
            t.assertRowEquals(4, ['Product:', 'loan prod 1', 'Loan Officer:', 'All'])

            // Details header
            t.assertRowEquals(5, detailsHeader)
            t.assertRowEquals(8, detailsAccount59)

            // Group footer
            t.assertRowEquals(12, totalAllLoanProd1)

            // Page footer
            t.assertRowEquals(13, pageFooter)
            t.assertCellEquals(14, 1, 'Printed by:')
            t.assertCellEquals(14, 2, 'On:')
        }
    }
}

