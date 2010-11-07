select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Five or more' then 0
when answers.Q1='Four' then 2
when answers.Q1='Three' then 6
when answers.Q1='Two' then 9
when answers.Q1='One' then 13
when answers.Q1='None' then 21
end +
case
when answers.Q2='Seven or more' then 0
when answers.Q2='Four, five, or six' then 4
when answers.Q2='Three' then 8
when answers.Q2='Two' then 12
when answers.Q2='One' then 23
when answers.Q2='None' then 6
end +
case
when answers.Q3='Communal standpipe; communal open, unprotected well; communal hand pump; lake/reservoir, river/spring, or other' then 0
when answers.Q3='Piped into dwelling; piped outside dwelling (personal); personal hand pump; protected spring; or personal open, unprotected well' then 6
end +
case
when answers.Q4='Collected firewood, crop residue, or animal waste' then 0
when answers.Q4='Purchased firewood' then 5
when answers.Q4='Paraffin, electricity, gas, charcoal, saw dust, or other' then 8
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
when answers.Q7='None' then 0
when answers.Q7='Owns a chair, but not any other items' then 2
when answers.Q7='Owns a table, upholstered chair, or sofa set, but not a coffee table (may or may not own a chair)' then 5
when answers.Q7='Owns a coffee table (may or may not own other items)' then 10
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 6
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 6
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_family_members_0_to_14', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_family_members_in_agriculture', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_water_source', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_cooking_fuel', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_lighting_fuel', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_owns_lantern', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_owns_furnature', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_owns_bicycle_scooter_car', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_owns_HiFi', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_malawi_2009_owns_iron', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Malawi 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
