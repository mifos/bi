select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Eight or more' then 0
when answers.Q1='Seven' then 2
when answers.Q1='Six' then 6
when answers.Q1='Five' then 10
when answers.Q1='Four' then 14
when answers.Q1='Three' then 19
when answers.Q1='One or two' then 27
end +
case
when answers.Q2='Not all' then 0
when answers.Q2='All, or no children ages 7 to 15' then 4
end +
case
when answers.Q3='Bamboo or thatch, makeshift, salvaged, or improvised materials, other, or no data' then 0
when answers.Q3='Wood or logs, plywood, galvanized iron or aluminum, or fibrous cement' then 2
when answers.Q3='Concrete, brick, or stone' then 14
end +
case
when answers.Q4='Firewood or other' then 0
when answers.Q4='Charcoal, firewood and charcoal, liquefied petroleum gas, kerosene, publicly-provided electricity, gas and electricity, privately-generated electricity, or none/does not cook' then 6
end +
case
when answers.Q5='Open land' then 0
when answers.Q5='None' then 4
when answers.Q5='Pit latrine, septic tank, other without septic tank, public toilet, shared toilet, or other' then 6
when answers.Q5='Connected to sewerage' then 13
end +
case
when answers.Q6='No bicycles, and no motorcycles' then 0
when answers.Q6='One bicycle, and no motorcycles' then 4
when answers.Q6='Two bicycles, and no motorcycles' then 7
when answers.Q6='Three or more bicycles, and no motorcycles' then 11
when answers.Q6='One or more motorcycles (regardless of bicycles)' then 13
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 4
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 8
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 5
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
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_family_members_7_to_15_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_house_walls', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_cooking_fuel', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_toilet_type', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_bicycles_and_motorcycles', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_owns_bed_set', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_owns_wardrobe', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_owns_water_pump', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_cambodia_2009_owns_television', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Cambodia 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
