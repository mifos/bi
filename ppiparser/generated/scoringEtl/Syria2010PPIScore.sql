select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Eight or more' then 0
when answers.Q1='Seven' then 4
when answers.Q1='Six' then 8
when answers.Q1='Five' then 13
when answers.Q1='Four' then 19
when answers.Q1='Three' then 24
when answers.Q1='One or two' then 31
end +
case
when answers.Q2='Arabic house, or other' then 0
when answers.Q2='Villa, or apartment' then 3
end +
case
when answers.Q3='One' then 0
when answers.Q3='Two or three' then 9
when answers.Q3='Four' then 12
when answers.Q3='Five or more' then 15
end +
case
when answers.Q4='No' then 0
when answers.Q4='Yes' then 9
end +
case
when answers.Q5='No' then 0
when answers.Q5='Yes' then 4
end +
case
when answers.Q6='None' then 0
when answers.Q6='One' then 3
when answers.Q6='Two' then 5
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 5
end +
case
when answers.Q8='None' then 0
when answers.Q8='One' then 3
when answers.Q8='Two' then 8
when answers.Q8='Three or more' then 9
end +
case
when answers.Q9='None' then 0
when answers.Q9='Motorcycle only' then 6
when answers.Q9='Car (regardless of motorcycle)' then 12
end +
case
when answers.Q10='Farm, or does not work' then 0
when answers.Q10='No male head/spouse' then 2
when answers.Q10='Enterprise, or at home' then 5
when answers.Q10='Other' then 7
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_residence_type', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_house_rooms', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_has_refrigerator_freezer', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_has_washing_machine', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_bedroom_sets', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_has_chandelier', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_fans', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_owns_motorcycle_car', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_syria_2010_place_of_work', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Syria 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
