CREATE TABLE `ppi_survey_results` (
  `ppi_results_id` int(11) NOT NULL AUTO_INCREMENT,
  `ppi_survey_name` varchar(45) NOT NULL,
  `points_version` int(11) NOT NULL,
  `date_survey_taken` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL,
  `ppi_score` int(11) NOT NULL,
  PRIMARY KEY (`ppi_results_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

