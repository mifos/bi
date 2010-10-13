CREATE TABLE `ppi_category_likelihood_bands` (
  `ppi_category_likelihoods_id` int(11) NOT NULL AUTO_INCREMENT,
  `ppi_survey` varchar(45) NOT NULL,
  `likelihoods_version` int(11) NOT NULL,
  `lower_bound` int(11) NOT NULL,
  `upper_bound` int(11) NOT NULL,
  `below_national` decimal(4,1) NOT NULL,
  `below_usaid_extreme` decimal(4,1) NOT NULL,
  `below_0_75_per_day_ppp` decimal(4,1) NOT NULL,
  `below_1_00_per_day_ppp` decimal(4,1) NOT NULL,
  `below_1_25_per_day_ppp` decimal(4,1) NOT NULL,
  `below_1_50_per_day_ppp` decimal(4,1) NOT NULL,
  `below_2_00_per_day_ppp` decimal(4,1) NOT NULL,
  PRIMARY KEY (`ppi_category_likelihoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


