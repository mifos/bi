CREATE TABLE `fact_ppi_survey_results` (
  `ppi_results_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL,
  `points_version` int(11) NOT NULL,
  `date_survey_taken` date NOT NULL,
  `customer_key` int(11) NOT NULL,
  `branch_key` int(11) NOT NULL,
  `ppi_score` int(11) NOT NULL,
  PRIMARY KEY (`ppi_results_id`),
  KEY `branch_key` (`branch_key`),
  KEY `customer_key` (`customer_key`)
) ENGINE=InnoDB


