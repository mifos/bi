select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Ten or more' then 0
when answers.Q1='Nine' then 1
when answers.Q1='Eight' then 6
when answers.Q1='Five, six, or seven' then 9
when answers.Q1='Four' then 21
when answers.Q1='One, two, or three' then 32
end +
case
when answers.Q2='Cement cob, mud, or other' then 0
when answers.Q2='Cleaned stone, stone and cement, old stone, or concrete' then 8
end +
case
when answers.Q3='No' then 0
when answers.Q3='Yes' then 2
end +
case
when answers.Q4='No' then 0
when answers.Q4='Yes' then 10
end +
case
when answers.Q5='None' then 0
when answers.Q5='Only cellular' then 7
when answers.Q5='Land-line (regardless of cellular)' then 9
end +
case
when answers.Q6='None' then 0
when answers.Q6='Only T.V.' then 2
when answers.Q6='T.V. and VCR and/or DVD' then 6
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 5
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 10
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 7
end +
case
when answers.Q10='None' then 0
when answers.Q10='One' then 5
when answers.Q10='Two or more' then 11
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_house_walls', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_solar_water_heater', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_vacuum', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_phone', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_tv_vcr_dvd', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_satellite_dish', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_computer', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_has_bookcase', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_palestine_2010_family_members_employed', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Palestine 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
