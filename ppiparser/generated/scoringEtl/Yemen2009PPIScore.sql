select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Ten or more' then 0
when answers.Q1='Eight or nine' then 8
when answers.Q1='Seven' then 11
when answers.Q1='Six' then 18
when answers.Q1='Four or five' then 21
when answers.Q1='Three' then 26
when answers.Q1='One or two' then 38
end +
case
when answers.Q2='Not all' then 0
when answers.Q2='All' then 2
when answers.Q2='No children aged 12 to 18' then 8
end +
case
when answers.Q3='Concrete, mud/soil, stone, or other' then 0
when answers.Q3='Floor tiles or marble' then 15
end +
case
when answers.Q4='Wood and mud, wood, hay, mud and hay, metal sheets and mud, or other' then 0
when answers.Q4='Reinforced concrete, wood and concrete, or metal sheets' then 4
end +
case
when answers.Q5='Non-flush toilet, other, or no toilet' then 0
when answers.Q5='Flush toilet' then 5
end +
case
when answers.Q6='One' then 0
when answers.Q6='Two' then 2
when answers.Q6='Three' then 3
when answers.Q6='Four' then 5
when answers.Q6='Five' then 7
when answers.Q6='Six or more' then 13
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 6
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 2
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 5
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_family_members_12_to_18_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_house_floors', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_house_ceiling', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_toilet_type', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_house_rooms', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_owns_television', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_owns_gas_cylinder', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_owns_radio', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_yemen_2009_owns_washing_machine', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Yemen 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers