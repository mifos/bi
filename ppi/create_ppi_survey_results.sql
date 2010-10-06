CREATE TABLE `ppi_survey_results` (
  `ppi_results_id` int(11) NOT NULL AUTO_INCREMENT,
  `ppi_survey_name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `date_survey_taken` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `ppi_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`ppi_results_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8

