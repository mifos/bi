select now() as 'Starting Check';

select concat('Fail: Duplicate Fee: ', fee_name) as ' '
from fees
group by fee_name
having count(*) > 1;


select concat('Fail: Personnel entry: ', p.display_name, ' has ', count(*), 
            ' occurences (either on the personnel table or as a result of a name change)') as ' '
from
((select  cl.entity_id as personnel_id, cld.old_value as display_name
from change_log cl 
join change_log_detail cld on cld.change_log_id = cl.change_log_id 
and cl.entity_type = 17
and cld.field_name =  'name') 
union all
(select personnel_id, display_name
from personnel)
union
(select 0 as personnel, 'Unknown' as display_name)
) p
group by p.display_name
having count(*) > 1;
 
 
select concat('Fail: account_type: ', if(account_type_id=1, 'Loan', 'Savings') , ' - No. of accounts with no account_status_change_history: ', 
                    count(*)) as ' '
from account a
where not exists
    (select 'f' from account_status_change_history ast
    where ast.account_id = a.account_id)
and account_type_id <> 3
group by account_type_id;

select concat('Fail: account_type: ', if(account_type_id=1, 'Loan', 'Savings') , ' - created before their Clients/Customers: ', 
                    count(*)) as ' '
from account a
join customer c on c.customer_id = a.customer_id
where a.created_date < c.created_date
and account_type_id <> 3
group by account_type_id
having count(*) > 0;

select concat('Fail: Loans disbursed before their created date - ', count(*)) as ' '
from account a
join loan_account la on la.account_id = a.account_id 
where a.created_date > la.disbursement_date
having count(*) > 0;


/* Warnings - ETL should run but will link transactions, schedules and attendance entries to the best account or customer history entry it can  */

select concat('Warn: Customer Attendance entries created before the Customer - ', count(*)) as ' '
from customer c
join customer_attendance ca on ca.customer_id  = c.customer_id
where c.created_date > ca.meeting_date
having count(*) > 0;

select concat('Warn: Loan Schedules created before their Loan Accounts - ', count(*)) as ' '
from account a
join loan_schedule ls on ls.account_id = a.account_id
where a.created_date > ls.action_date
having count(*) > 0;

select concat('Warn: Customer Schedules created before their Customer Accounts - ', count(*)) as ' '
from account a
join customer_schedule cs on cs.account_id = a.account_id
where a.created_date > cs.action_date
having count(*) > 0;

select concat('Warn: ', count(*), ' - ', lv.lookup_name, ' Transactions have an action date before their Associated Account was created') as ' '
from account a
join account_trxn att on att.account_id = a.account_id
left join account_action aa on aa.account_action_id = att.account_action_id
left join lookup_value lv on lv.lookup_id = aa.lookup_id
where a.created_date > att.action_date
group by att.account_action_id;

select now() as 'Finished Check';

