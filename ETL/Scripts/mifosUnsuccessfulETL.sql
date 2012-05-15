use mifos_dwh;

/*just to make the check queries a bit quicker */
ALTER TABLE stg_customer_and_account_updates
ADD INDEX `updated_parent_id` (`updated_parent_id` ASC) ,
ADD INDEX `entity_id` (`entity_id` ASC) ;


/* This next check not required from BI 1.3 */
select 'Customers created before loan officers (not a problem from BI 1.3)', p.personnel_id, p.valid_from, 
s.effective_date, s.level_id, s.entity_id,  
        s.updated_status, s.updated_parent_id, s.updated_loan_officer_id, s.updated_branch_id, s.customer_formedby_id 
from stg_customer_and_account_updates s 
join dim_personnel p on p.personnel_id = s.updated_loan_officer_id
where s.level_id > 0 and s.change_type = 'a'   
and s.updated_loan_officer_id is not null
and not exists (
                select 'f' from dim_personnel p
                where p.personnel_id = s.updated_loan_officer_id
                and p.valid_from <= s.effective_date and p.valid_to > s.effective_date)
order by s.updated_loan_officer_id, s.effective_date, s.level_id desc, s.entity_id;




select 'Customers with kids created before them', s.effective_date, s.level_id, s.entity_id,  
 skid.effective_date, skid.level_id, skid.entity_id
from stg_customer_and_account_updates s
join stg_customer_and_account_updates skid on skid.updated_parent_id = s.entity_id
where s.level_id > 0 and s.change_type = 'a' 
and skid.level_id > 0 and skid.change_type =   'a'
and skid.effective_date < s.effective_date
order by s.effective_date, s.level_id desc, s.entity_id, s.change_type, s.change_order, s.updated_parent_id desc, s.updated_loan_officer_id desc;









select now() as 'Finished Check';