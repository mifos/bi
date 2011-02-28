package org.mifos.bi.test

import org.junit.Test

class PPIClientExportReportTest {

    def reportPath = 'reports/standardReports/prpts/PPIClientExportJob.kjb'

    def reportHeader = [
        'Customer Name', 'Customer Id', 'Date Survey Taken', 'Survey Name', 'Branch', 'Start Date', 'Loan Product Type',
        'Initial Loan Amount', 'Savings Balance', 'Gender', 'Business Activity', 'Principal in Arrears', 'Number of Children',
        'Education Level', 'Ethnicity', 'Date of Birth', 'PPI Score', 'below upper national', 'below lower national',
        'below usaid extreme', 'below 1 25 per day 2005 ppp', 'below 1 75 per day 2005 ppp', 'below 2 50 per day 2005 ppp',
        'below national', 'below 150 percent of national', 'below 200 percent of national', 'below national food',
        'below 3 75 per day 2005 ppp', 'below quarter minimum wage', 'below half minimum wage', 'below one minimum wage',
        'below two minimum wage', 'below 5 00 per day 2005 ppp', 'below 125 percent of national', 'below lower national food',
        'below food', 'below 1 00 per day 2005 ppp', 'bottom half below 1 00 per day 1993 ppp', 'below 1 00 per day 1993 ppp',
        'below 0 75 per day 1993 ppp', 'below 1 25 per day 1993 ppp', 'below 1 50 per day 1993 ppp', 'below 2 00 per day 1993 ppp',
        'below national capacity', 'below national asset', 'below 125 percent of national asset', 'below 150 percent of national asset',
        'below 1 08 per day 1993 ppp', 'below 2 16 per day 1993 ppp', 'below 3 24 per day 1993 ppp', 'below 0 25 per day 1993 ppp',
        'below 0 50 per day 1993 ppp', 'below 50 percent of national', 'below 75 percent of national', 'below subsistence',
        'below 4 32 per day 1993 ppp', 'below laeken', 'below 6 25 per day 2005 ppp', 'below upper', 'below 4 00 per day 2005 ppp',
        'below 300 percent of national', 'below 150 percent of upper national', 'below 200 percent of upper national', 'below molisa',
        'below 3 00 per day 2005 ppp'
    ]

    @Test
    void test_20100101_20110101() {
        new PrptReport().executeFromKjb () { t ->
            t.reportPath = reportPath
            t.reportParams = [
                'startDate': '2010-01-01',
                'endDate': '2011-01-01',
            ]

            // Check report header:
            t.assertRowEquals(1, reportHeader)

            // Check row for PPI Bolivia 2009:
            t.assertRowEquals(3, ['client dw1 2 1 xxx', '6', '2010-11-01', 'PPI Bolivia 2009', 'BO 1', '2010-07-03', '50.0000', 'Female', '1987-07-07', '0', '75.7', '72.5', '78.8', '100.0', '100.0', '100.0', '95.6', '95.6'])

            // Check row for PPI Kenya 2008:
            t.assertRowEquals(16, ['client dw1 2 1 xxx', '6', '2010-11-01', 'PPI Kenya 2008', 'BO 1', '2010-07-03', '50.0000', 'Female', '1987-07-07', '0', '55.8', '81.2', '63.1', '10.0', '63.4'])

            // Check row for PPI Honduras 2010:
            t.assertRowEquals(45, ['client dw1 2 1 xxx', '6', '2010-11-02', 'PPI Honduras 2010', 'BO 1', '2010-07-03', '50.0000', 'Female', '1987-07-07', '100', '0.0', '0.0', '0.0', '2.7', '0.0', '2.7'])
        }  
    }
}

