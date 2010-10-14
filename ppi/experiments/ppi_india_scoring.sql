insert into mifos_ppi_dw.ppi_survey_results (ppi_survey_name, date_survey_taken, client_id, ppi_score)
select answers.ppi_survey_name, answers.date_survey_taken, answers.client_id, 
(
case
when answers.Q1='Five or more' then 0
when answers.Q1='Four' then 4
when answers.Q1='Three' then 8
when answers.Q1='Two' then 13
when answers.Q1='One' then 20
when answers.Q1='None' then 27
end +
case
when answers.Q2='Labourers (agricultural, plantation, other farm), hunters, tobacco preparers and tobacco product makers, and other labourers' then 0
when answers.Q2='Others' then 8
when answers.Q2='Professionals, technicians, clerks, administrators, managers, executives, directors, supervisors, and teachers' then 14
end +
case
when answers.Q3='No'then 0
when answers.Q3='Yes' then 4
end +
case
when answers.Q4='Firewood and chips, charcoal, or none'then 0
when answers.Q4='Others' then 5
when answers.Q4='LPG' then 17
end +
case
when answers.Q5='No'then 0
when answers.Q5='Yes' then 6
end +
case
when answers.Q6='No'then 0
when answers.Q6='Yes' then 5
end +
case
when answers.Q7='No'then 0
when answers.Q7='Yes' then 3
end +
case
when answers.Q8='No'then 0
when answers.Q8='Yes' then 6
end +
case
when answers.Q9='None'then 0
when answers.Q9='One' then 6
when answers.Q9='Two or more' then 9
end +
case
when answers.Q10='None'then 0
when answers.Q10='One' then 5
when answers.Q10='Two or more' then 9
end
) 
as ppi_score
from
(SELECT
qg.title as ppi_survey_name,
GROUP_CONCAT(if(q.short_name = 'Date Survey Was Taken', date(qgr.response), NULL)) AS 'date_survey_taken',
qgi.entity_id as 'client_id',
GROUP_CONCAT(if(q.short_name = 'How many people aged 0 to 17 are in the household?', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.short_name = 'What is the household’s principal occupation?', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.short_name = 'Is the residence all pucca (burnt bricks, stone, cement, concrete, jackboard/cement-plastered reeds, timber, tiles, galvanised tin or asbestos cement sheets)?', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.short_name = 'What is the household’s primary source of energy for cooking?', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.short_name = 'Does the household own a television?', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.short_name = 'Does the household own a bicycle, scooter, or motor cycle?', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.short_name = 'Does the household own an almirah/dressing table?', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.short_name = 'Does the household own a sewing machine?', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.short_name = 'How many pressure cookers or pressure pans does the household own?', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.short_name = 'How many electric fans does the household own?', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id
GROUP BY question_group_instance_id) as answers
group by client_id