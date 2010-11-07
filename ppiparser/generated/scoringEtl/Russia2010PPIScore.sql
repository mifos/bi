select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Five or more' then 0
when answers.Q1='Four' then 5
when answers.Q1='Three' then 11
when answers.Q1='Two' then 22
when answers.Q1='One' then 35
end +
case
when answers.Q2='No' then 0
when answers.Q2='Yes' then 5
end +
case
when answers.Q3='24 or less' then 0
when answers.Q3='25 to 39' then 3
when answers.Q3='40 to 59' then 4
when answers.Q3='60 to 99' then 6
when answers.Q3='100 or more' then 8
end +
case
when answers.Q4='None' then 0
when answers.Q4='Individual water heater' then 4
when answers.Q4='Centralized' then 6
end +
case
when answers.Q5='None' then 0
when answers.Q5='One' then 3
when answers.Q5='Two or more' then 7
end +
case
when answers.Q6='None' then 0
when answers.Q6='One' then 3
when answers.Q6='Two or more' then 7
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 2
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='None' then 0
when answers.Q9='One or more land-lines, and no cellular' then 6
when answers.Q9='No land-lines, and one cellular' then 10
when answers.Q9='One or more land-lines, and one cellular' then 13
when answers.Q9='No land-lines, and two or more cellular' then 15
when answers.Q9='One or more land-lines, and two cellular' then 16
when answers.Q9='One or more land-lines, and three or more cellular' then 21
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
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_employed_in_highly_skilled_work', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_house_area', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_hot_water_source', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_color_televisions', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_VCRs_and_DVDs', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_owns_microwave', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_owns_computer', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_phones', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_russia_2010_owns_car', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Russia 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
