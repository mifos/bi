select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Eight or more' then 0
when answers.Q1='Seven' then 4
when answers.Q1='Six' then 7
when answers.Q1='Five' then 11
when answers.Q1='Four' then 14
when answers.Q1='Three' then 20
when answers.Q1='Two' then 29
when answers.Q1='One' then 41
end +
case
when answers.Q2='Tradition' then 0
when answers.Q2='Semi-permanent' then 1
when answers.Q2='Permanent' then 4
end +
case
when answers.Q3='Communal standpipe; communal open, unprotected well; communal hand pump; lake/reservoir, river/spring, or other' then 0
when answers.Q3='Piped into dwelling; piped outside dwelling (personal); personal hand pump; protected spring; or personal open, unprotected well' then 7
end +
case
when answers.Q4='Collected firewood, crop residue, or animal waste' then 0
when answers.Q4='Purchased firewood' then 4
when answers.Q4='Paraffin, electricity, gas, charcoal, saw dust, or other' then 9
end +
case
when answers.Q5='Collected firewood, grass, or other' then 0
when answers.Q5='Paraffin' then 6
when answers.Q5='Purchased firewood, electricity, gas, battery/dry cell (torch), or candles' then 12
end +
case
when answers.Q6='No' then 0
when answers.Q6='Yes' then 4
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 4
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 5
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 7
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 7
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_family_members_in_agriculture', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_water_source', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_cooking_fuel', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_lighting_fuel', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_owns_lantern', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_owns_furnature', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_owns_bicycle_scooter_car', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_owns_hifi', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2010_owns_iron', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Malawi 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
