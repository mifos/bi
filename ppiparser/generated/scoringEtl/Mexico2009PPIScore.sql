select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Four or more' then 0
when answers.Q1='Three' then 7
when answers.Q1='Two' then 11
when answers.Q1='One' then 20
when answers.Q1='None' then 28
end +
case
when answers.Q2='None' then 0
when answers.Q2='Up to third grade' then 5
when answers.Q2='Fourth grade through high school' then 7
when answers.Q2='College preparatory 1 - 3' then 10
when answers.Q2='Normal/technical/commercial' then 14
when answers.Q2='Professional, master\'s or doctorate' then 20
when answers.Q2='No female head/spouse' then 14
end +
case
when answers.Q3='None' then 0
when answers.Q3='One' then 6
when answers.Q3='Two or more' then 16
end +
case
when answers.Q4='Dirt' then 0
when answers.Q4='Cement/concrete' then 2
when answers.Q4='Other' then 7
end +
case
when answers.Q5='No toilet, or no water supply' then 0
when answers.Q5='Carried by bucket' then 1
when answers.Q5='Piped' then 3
end +
case
when answers.Q6='No' then 0
when answers.Q6='Yes' then 4
end +
case
when answers.Q7='Firewood' then 0
when answers.Q7='Other' then 2
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 4
end +
case
when answers.Q10='None' then 0
when answers.Q10='One' then 0
when answers.Q10='Two' then 5
when answers.Q10='Three or more' then 12
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_family_members_0_to_17', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_female_head_education_level', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_empoyed_with_contract', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_house_floor', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_toilet_water_supply', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_has_sink_for_dishes', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_cooking_fuel', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_has_blender', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_has_iron', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_mexico_2009_televisions', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Mexico 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
