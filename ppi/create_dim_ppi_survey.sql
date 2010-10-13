CREATE TABLE `dim_ppi_survey` (
  `ppi_survey_key` int(11) NOT NULL AUTO_INCREMENT,
  `question_group_id` int(11) NOT NULL,
  `survey_name` varchar(200) NOT NULL,
  PRIMARY KEY (`ppi_survey_key`)
) ENGINE=InnoDB

