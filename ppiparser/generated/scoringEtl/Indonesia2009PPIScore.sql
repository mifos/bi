select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Six or more' then 0
when answers.Q1='Five' then 7
when answers.Q1='Four' then 13
when answers.Q1='Three' then 21
when answers.Q1='Two' then 26
when answers.Q1='One' then 37
end +
case
when answers.Q2='Not all, or no children aged 5 to 18' then 0
when answers.Q2='All' then 3
end +
case
when answers.Q3='None' then 0
when answers.Q3='One or two' then 6
when answers.Q3='Three' then 7
when answers.Q3='Four or more' then 10
end +
case
when answers.Q4='Public utilities retail, safe/unsafe well, safe/unsafe water spring, river, rain water, or other' then 0
when answers.Q4='Public utilities (in pipes), or drilled/pumped well' then 4
when answers.Q4='From manufacturing' then 9
end +
case
when answers.Q5='Toilet over water, hole in ground/river, no toilet, or no one uses bathroom facility' then 0
when answers.Q5='Flush/sitting toilet' then 5
end +
case
when answers.Q6='Earth/soil' then 0
when answers.Q6='Not earth/soil' then 6
end +
case
when answers.Q7='Bamboo, other, or does not have' then 0
when answers.Q7='Concrete, gypsum, wood, or asbestos' then 4
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 12
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 9
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
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_family_members_5_to_18_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_11_and_up_worked_last_week', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_water_source', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_toilet_type', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_house_floors', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_house_ceiling', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_owns_refrigerator', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_owns_motorcycle', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_indonesia_2009_owns_television', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Indonesia 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
