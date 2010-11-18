select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Six or more' then 0
when answers.Q1='Five' then 6
when answers.Q1='Four' then 10
when answers.Q1='Three' then 17
when answers.Q1='One or two' then 21
end +
case
when answers.Q2='None' then 0
when answers.Q2='One or more' then 8
end +
case
when answers.Q3='Year 1 or less' then 0
when answers.Q3='Years 2 to 7' then 1
when answers.Q3='Years 8 or 9' then 4
when answers.Q3='Year 10' then 5
when answers.Q3='No female head/spouse' then 5
when answers.Q3='G.C.E. (O/L) or equivalent, Year 12, or higher' then 13
end +
case
when answers.Q4='Mud, or other' then 0
when answers.Q4='Cement' then 3
when answers.Q4='Terrazzo/tile' then 9
end +
case
when answers.Q5='None' then 0
when answers.Q5='One' then 1
when answers.Q5='Two' then 5
when answers.Q5='Three or more' then 7
end +
case
when answers.Q6='No' then 0
when answers.Q6='Yes' then 9
end +
case
when answers.Q7='No television' then 0
when answers.Q7='Television, but no VCD/DVD' then 3
when answers.Q7='Television and VCD/DVD' then 7
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 7
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 6
end +
case
when answers.Q10='None' then 0
when answers.Q10='Bicycle only' then 2
when answers.Q10='Motorcycle etc., but no motor car etc. (regardless of bicycle)' then 9
when answers.Q10='Motorcycle etc. (regardless of bicycle or motor car etc.)' then 13
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_family_members_employeed_by_government', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_female_head_education_level', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_house_floors', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_house_bedrooms', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_owns_fan', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_owns_tv_and_dvd', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_owns_cooker', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_owns_refrigerator', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_srilanka_2010_owns_transportation', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Srilanka 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
