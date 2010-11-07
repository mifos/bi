select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Four or more' then 0
when answers.Q1='Three' then 5
when answers.Q1='Two' then 10
when answers.Q1='One' then 19
when answers.Q1='None' then 27
end +
case
when answers.Q2='One' then 0
when answers.Q2='Two' then 3
when answers.Q2='Three' then 4
when answers.Q2='Four' then 12
when answers.Q2='Five or more' then 15
end +
case
when answers.Q3='None' then 0
when answers.Q3='One' then 7
when answers.Q3='Two or more' then 18
end +
case
when answers.Q4='No' then 0
when answers.Q4='Yes' then 8
when answers.Q4='There is no female head/spouse' then 10
end +
case
when answers.Q5='Firewood, charcoal, kerosene, or other' then 0
when answers.Q5='Propane, electricity, or does not cook' then 7
end +
case
when answers.Q6='No' then 0
when answers.Q6='Yes' then 4
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 3
end +
case
when answers.Q8='None' then 0
when answers.Q8='Only a television' then 1
when answers.Q8='Both a television and a VCR or DVD' then 6
end +
case
when answers.Q9='None' then 0
when answers.Q9='Only a radio, or only a stereo system' then 1
when answers.Q9='Both a radio and a stereo system' then 4
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 6
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_family_members_0_to_17', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_rooms_in_house', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_salaried_employees', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_female_head_worked_last_week', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_coking_fuel', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_has_refrigerator', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_has_blender', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_has_vcr_or_dvd', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_has_stereo', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_elsalvador_2010_has_fan', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Elsalvador 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
