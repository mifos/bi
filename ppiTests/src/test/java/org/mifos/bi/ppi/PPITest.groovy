
package org.mifos.bi.ppi
import groovy.sql.Sql
/**
 * Tests for the {@link Example} class.
 */
class PPITest
    extends GroovyTestCase
{
	void testShow() {
		def sql = Sql.newInstance("jdbc:mysql://localhost:3306/mifos_ppi_test_dw", "root",
				"", "com.mysql.jdbc.Driver")
		sql.eachRow("select * from fact_ppi_survey_results"){ row ->
			println row.ppi_results_id + " " + row.date_survey_taken + " " + row.ppi_score
		}
		
		new File("../ppiparser/generated/testData").eachFile() { file->
		     println file.getName()
			 def props = new Properties()
			 new File("../ppiparser/generated/testData/" + file.getName()).withInputStream {
			   stream -> props.load(stream)
			 }
			 // accessing the property from Properties object using Groovy's map notation
			 println "questionGroup.name=" + props["questionGroup.name"]
		}
		

		
    }
}
