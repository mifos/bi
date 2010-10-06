select 
client_id,
group_concat(if (cat.ppi_measure = 'below_national_poverty_line', cat.likelihood, NULL)) as below_national_poverty_line,
group_concat(if (cat.ppi_measure = 'below_1_50_per_day_ppp_poverty_line', cat.likelihood, NULL)) as below_1_50_per_day_ppp_poverty_line,
group_concat(if (cat.ppi_measure = 'below_2_00_per_day_ppp_poverty_line', cat.likelihood, NULL)) as below_2_00_per_day_ppp_poverty_line
FROM mifos_ppi_dw.ppi_category_likelihoods cat, mifos_ppi_dw.ppi_survey_results ppi
where 
ppi.ppi_score >= cat.lower_bound and
ppi.ppi_score <= cat.upper_bound and
cat.ppi_survey = ppi.ppi_survey_name and
ppi.ppi_survey_name = 'PPI India 01'
group by client_id
