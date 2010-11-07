select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Five or more' then 0
when answers.Q1='Four' then 4
when answers.Q1='Three' then 9
when answers.Q1='Two' then 15
when answers.Q1='One' then 20
when answers.Q1='None' then 26
end +
case
when answers.Q2='No' then 0
when answers.Q2='Yes' then 2
when answers.Q2='No children ages 6 to 14' then 4
end +
case
when answers.Q3='Graduate primary or less' then 0
when answers.Q3='First- to fourth-year secondary' then 3
when answers.Q3='Graduate secondary' then 6
when answers.Q3='First-year college or higher, or no female head/spouse' then 11
end +
case
when answers.Q4='No' then 0
when answers.Q4='Yes' then 5
end +
case
when answers.Q5='Light materials (cogon, nipa, or sawali, bamboo, anahaw)' then 0
when answers.Q5='Strong materials (iron, aluminum, tile, concrete, brick, stone, wood, asbestos)' then 4
end +
case
when answers.Q6='Light materials (Salvaged, makeshift, cogon, nipa, or anahaw)' then 0
when answers.Q6='Strong materials (Galvanized iron, aluminum tile, concrete, brick, stone, or asbestos)' then 2
end +
case
when answers.Q7='None, open pit, closed pit, or other' then 0
when answers.Q7='Water sealed' then 7
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 10
end +
case
when answers.Q9='None' then 0
when answers.Q9='One' then 6
when answers.Q9='Two or more' then 21
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 10
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_family_members_0_to_14', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_all_family_members_6_to_14_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_female_head_education_level', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_salaried_employment', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_house_walls', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_house_roof', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_toilet_type', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_owns_refrigerator', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_televisions', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_philippines_2009_owns_washing_machine', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Philippines 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
