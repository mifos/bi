select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Seven or more' then 0
when answers.Q1='Six' then 5
when answers.Q1='Five' then 11
when answers.Q1='Four' then 18
when answers.Q1='Three' then 19
when answers.Q1='One or two' then 36
end +
case
when answers.Q2='No' then 0
when answers.Q2='Yes' then 2
when answers.Q2='No children 6 to 18' then 4
end +
case
when answers.Q3='No' then 0
when answers.Q3='No female head/spouse' then 4
when answers.Q3='Yes' then 7
end +
case
when answers.Q4='Yes' then 0
when answers.Q4='No' then 7
end +
case
when answers.Q5='Stones, mud, wood, tin, asbestos, or other' then 0
when answers.Q5='Bricks with mortar' then 4
when answers.Q5='Concrete' then 6
end +
case
when answers.Q6='One' then 0
when answers.Q6='Two' then 1
when answers.Q6='Three' then 2
when answers.Q6='Four or more' then 8
end +
case
when answers.Q7='Well, pump, public network with no connection, public network with tap outside building, or other' then 0
when answers.Q7='Public network with tap inside building' then 4
end +
case
when answers.Q8='No toilet available, or shared toilet' then 0
when answers.Q8='Private non-flush toilet' then 2
when answers.Q8='Private flush toilet' then 7
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 6
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes, only non-automatic' then 4
when answers.Q10='Yes, automatic' then 15
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_all_family_members_6_to_18_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_female_head_literate', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_has_temporary_wage_job', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_house_walls', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_rooms_in_house', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_water_source', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_toilet_type', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_owns_gas_electric_water_heater', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_egypt_2010_owns_washing_machine', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Egypt 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers