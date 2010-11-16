
package org.mifos.bi.ppi
import groovy.sql.Sql
/**
 * Tests for the {@link Example} class.
 */
class PPITest
    extends GroovyTestCase
{
	void testPpiScores() {
		def score_map = ["surveykey":0]
		def sql = Sql.newInstance(System.properties['biTestDbUrl'], System.properties['biTestDbUser'],
				System.properties['biTestDbPassword'], System.properties['biTestDbDriver'])
		sql.eachRow("SELECT survey.survey_name, DATE_FORMAT(results.date_survey_taken, '%d/%m/%Y') as date_survey_taken, results.ppi_score FROM fact_ppi_survey_results results JOIN dw_ppi_survey survey ON results.survey_id = survey.survey_id"){ row ->
			println row.survey_name + " " + row.date_survey_taken + " " + row.ppi_score
			def score_map_key = row.survey_name + row.date_survey_taken
			score_map[score_map_key] = row.ppi_score
		}
		
		new File("../ppiparser/generated/testData").eachFile() { file->
		     println file.getName()
			 def props = new Properties()
			 new File("../ppiparser/generated/testData/" + file.getName()).withInputStream {
			   stream -> props.load(stream)
			 }
			 // accessing the property from Properties object using Groovy's map notation
			 def survey_name = props["questionGroup.name"]
			 println "questionGroup.name=" + survey_name
			 def num_surveys = props["survey.count"].toInteger()
			
			 for (survey_num in 1..num_surveys) {
				 def survey_date = props["survey." + survey_num + ".question.1.response.text"]
				 def expected_ppi_score = props["survey." + survey_num + ".ppi.score"]
				 def actual_ppi_score = score_map[survey_name + survey_date]
				 assert expected_ppi_score.toInteger() == actual_ppi_score.toInteger()
			 }			 	 
		}		
    }
}
