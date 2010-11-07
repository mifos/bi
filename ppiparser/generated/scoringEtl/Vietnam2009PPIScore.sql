select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Three or more' then 0
when answers.Q1='Two' then 7
when answers.Q1='One' then 16
when answers.Q1='None' then 23
end +
case
when answers.Q2='Four or more' then 0
when answers.Q2='Two or three' then 6
when answers.Q2='One or none' then 9
end +
case
when answers.Q3='Makeshift or other' then 0
when answers.Q3='Semi-permanent house' then 1
when answers.Q3='Strong house with a shared kitchen or shared bathroom/toilet' then 2
when answers.Q3='Villa or strong house with a private kitchen and private' then 6
end +
case
when answers.Q4='None or other' then 0
when answers.Q4='Double-vault compost latrine, or toilet directly over water' then 2
when answers.Q4='Suilabh, or flush toilet with septic tank or sewage pipes' then 7
end +
case
when answers.Q5='Public tap, deep drilled wells, hand-dug and reinforced/non-reinforced wells, covered wells, protected/unprotected springs, rain, small water tank, water tank, river, lake, pond, or other' then 0
when answers.Q5='Private tap water inside/outside the house, or purchased water (in tank or bottle)' then 4
end +
case
when answers.Q6='None' then 0
when answers.Q6='Electric cooker, rice cooker, or pressurized cooker (no gas cooker)' then 5
when answers.Q6='Gas cooker' then 16
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 10
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 10
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 11
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_family_members_0_to_14', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_self_employed_agriculture', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_residence_type', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_toilet_type', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_water_source', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_cooker_type', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_has_motorcycle', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_has_video_player', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_has_wardrobe', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_vietnam_2009_has_refriderator', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Vietnam 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
