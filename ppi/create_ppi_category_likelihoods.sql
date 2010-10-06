CREATE TABLE `ppi_category_likelihoods` (
  `ppi_category_likelihoods_id` int(11) NOT NULL AUTO_INCREMENT,
  `ppi_survey` varchar(45) CHARACTER SET latin1 NOT NULL,
  `ppi_measure` varchar(45) CHARACTER SET latin1 NOT NULL,
  `lower_bound` int(11) NOT NULL,
  `upper_bound` int(11) NOT NULL,
  `likelihood` decimal(4,1) NOT NULL,
  PRIMARY KEY (`ppi_category_likelihoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


