select answers.survey_id, 1 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.client_id, 
(
case
when answers.Q1='3 or more' then 0
when answers.Q1='0, 1, or 2' then 8
end +
case
when answers.Q2='Not all' then 0
when answers.Q2='All' then 8
when answers.Q2='No children aged 6 to 17' then 21
end +
case
when answers.Q3='Mud/cow dung; grass/sticks/makuti; or no data' then 0
when answers.Q3='Other' then 5
end +
case
when answers.Q4='Other' then 0
when answers.Q4='Flush to sewer; flush to septic tank; pan/bucket; covered pit latrine; or ventilation improved pit latrine' then 2
end +
case
when answers.Q5='No'then 0
when answers.Q5='Yes' then 16
end +
case
when answers.Q6='No'then 0
when answers.Q6='Yes' then 14
end +
case
when answers.Q7='No'then 0
when answers.Q7='Yes' then 12
end +
case
when answers.Q8='No'then 0
when answers.Q8='Yes' then 8
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 5
end +
case
when answers.Q10='None or unknown' then 0
when answers.Q10='1 or more' then 9
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.short_name = 'Date Survey Was Taken', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as 'client_id',
GROUP_CONCAT(if(q.short_name = 'How many household members are aged 25 or younger?', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.short_name = 'How many household members aged 6 to 17 are currently attending school?', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.short_name = 'What is the material of the walls of the house?', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.short_name = 'What kind of toilet facility does your household use?', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.short_name = 'Does the household own a TV?', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.short_name = 'Does the household own a sofa?', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.short_name = 'Does the household own a stove?', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.short_name = 'Does the household own a radio?', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.short_name = 'Does the household own a bicycle?', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.short_name = 'How many head of cattle are owned by the household currently?', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Kenya 01"
GROUP BY question_group_instance_id) as answers