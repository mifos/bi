select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Eight or more' then 0
when answers.Q1='Six or seven' then 6
when answers.Q1='Five' then 11
when answers.Q1='Four' then 14
when answers.Q1='Three' then 19
when answers.Q1='Two' then 30
when answers.Q1='One' then 38
end +
case
when answers.Q2='Not all' then 0
when answers.Q2='No children ages 6 to 18' then 7
when answers.Q2='All' then 9
end +
case
when answers.Q3='Earth/mud, or dirt/straw' then 0
when answers.Q3='Wood, tile, plank, concrete, or other' then 4
end +
case
when answers.Q4='Mud/mud bricks' then 0
when answers.Q4='Thatch (grass or straw)' then 3
when answers.Q4='Wood/bamboo, corrugated iron sheets, cement/concrete, roofing tiles, or other' then 6
end +
case
when answers.Q5='Unprotected well/rain water, or untreated pipe-borne' then 0
when answers.Q5='Vendor, truck, protected well, river, lake, or pond' then 4
when answers.Q5='Treated pipe-borne water, borehole/hand pump, or other' then 6
end +
case
when answers.Q6='Pail/bucket, covered or uncovered pit latrine, ventilated improved pit latrine, other, or none' then 0
when answers.Q6='Toilet on water, or flush to sewer or septic tank' then 5
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 15
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
when answers.Q10='Yes' then 5
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_all_family_members_6_to_18_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_house_floors', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_house_roof', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_water_source', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_toilet_type', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_owns_television', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_owns_stove', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_owns_bed', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_nigeria_2008_owns_radio', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Nigeria 2008" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
