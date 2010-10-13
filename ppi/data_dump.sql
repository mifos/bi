select 
cust.display_name, cust.customer_id, ppi.date_survey_taken, office.display_name, cust.gender, ppi.ppi_score, cat.below_national, cat.below_0_75_per_day_ppp, cat.below_1_00_per_day_ppp, cat.below_1_25_per_day_ppp, cat.below_1_50_per_day_ppp, cat.below_2_00_per_day_ppp
FROM ppi_category_likelihood_bands cat, ppi_survey_results ppi, dim_customer cust, dim_office office
where 
ppi.ppi_score >= cat.lower_bound and
ppi.ppi_score <= cat.upper_bound and
cat.ppi_survey = ppi.ppi_survey_name and
ppi.ppi_survey_name = 'PPI India 01' and
cust.customer_id = ppi.client_id and
cust.branch_key = office.office_key
group by client_id
