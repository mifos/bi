select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Four or more' then 0
when answers.Q1='Three' then 9
when answers.Q1='Two' then 12
when answers.Q1='One' then 19
when answers.Q1='None' then 31
end +
case
when answers.Q2='Yes' then 0
when answers.Q2='No' then 10
end +
case
when answers.Q3='Open field' then 0
when answers.Q3='Kacha latrine (temporary or permanent), pacca (pit or water seal), or sanitary' then 5
end +
case
when answers.Q4='One, two, or three' then 0
when answers.Q4='Four' then 7
when answers.Q4='Five or more' then 11
end +
case
when answers.Q5='Mud brick, hemp/hay/ bamboo, or other' then 0
when answers.Q5='C.I. sheet/wood' then 2
when answers.Q5='Brick/cement' then 8
end +
case
when answers.Q6='Tile/wood, hemp/hay/ bamboo, or other' then 0
when answers.Q6='C.I. sheet/wood' then 2
when answers.Q6='Cement' then 13
end +
case
when answers.Q7='None, or less than 0.5 acres' then 0
when answers.Q7='More than 0.5 acres, but less than 1 acre' then 4
when answers.Q7='More than 1 acre' then 6
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 7
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 5
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 4
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_family_members_0_to_11', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_daily_wage_earner', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_latrine_type', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_rooms_for_family', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_house_walls', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_house_roof', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_land_owned', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_owns_television', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_owns_cassette_player', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_bangladesh_2009_owns_wristwatch', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Bangladesh 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers