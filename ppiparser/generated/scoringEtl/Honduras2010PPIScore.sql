select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Five or more' then 0
when answers.Q1='Four' then 11
when answers.Q1='Three' then 14
when answers.Q1='Two' then 16
when answers.Q1='One' then 23
when answers.Q1='None' then 32
end +
case
when answers.Q2='None, pre-school, or literacy program' then 0
when answers.Q2='Primary school' then 6
when answers.Q2='No female head/spouse, common cycle, or no data' then 10
when answers.Q2='Diversified or higher' then 14
end +
case
when answers.Q3='No data or no main occupation' then 0
when answers.Q3='Farmer, rancher, agricultural worker, or no male head/spouse' then 9
when answers.Q3='Shop owner, salesperson, service worker, transport and storage operator, or worker in textiles, construction, mechanics, graphics, chemicals, food processing, etc.' then 11
when answers.Q3='Office worker, transportation operator, professional, technician, director, manager, administrator, or related job' then 16
end +
case
when answers.Q4='None' then 0
when answers.Q4='One' then 3
when answers.Q4='Two or more' then 10
end +
case
when answers.Q5='One' then 0
when answers.Q5='Two' then 1
when answers.Q5='Three' then 4
when answers.Q5='Four or more' then 5
end +
case
when answers.Q6='Dirt, other, or no data' then 0
when answers.Q6='Mud bricks, poured concrete, or wood' then 3
when answers.Q6='Cement bricks' then 4
when answers.Q6='Ceramic tile or granite' then 7
end +
case
when answers.Q7='Not public network' then 0
when answers.Q7='Public network' then 3
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 5
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes, without cable' then 2
when answers.Q10='Yes, with cable' then 4
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_family_members_0_to_14', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_female_head_education_level', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_male_head_occupation', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_family_members_salaried', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_house_bedrooms', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_house_floors', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_water_source', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_has_refrigerator', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_has_stove', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_honduras_2010_has_television', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Honduras 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
