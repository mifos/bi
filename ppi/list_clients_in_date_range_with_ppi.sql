select * from mifos_ppi_dw.dim_customer dc, mifos_ppi_dw.ppi_survey_results ppi
where dc.customer_level_id = 1 
and dc.customer_status = 'ClientStatus-ApplicationPendingApproval'
and ppi.client_id = dc.customer_id
and valid_from >= '2010-09-30'
and valid_from <= '2010-10-31'
