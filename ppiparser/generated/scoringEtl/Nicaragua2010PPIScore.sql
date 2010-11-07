select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Eight or more' then 0
when answers.Q1='Seven' then 10
when answers.Q1='Six' then 12
when answers.Q1='Five' then 13
when answers.Q1='Four' then 19
when answers.Q1='Three' then 26
when answers.Q1='One or two' then 37
end +
case
when answers.Q2='Not all' then 0
when answers.Q2='All, and all are in a non-autonomous public school, community school, or other' then 1
when answers.Q2='All, and one is in autonomous or private school' then 3
when answers.Q2='No children ages 7 to 12' then 3
when answers.Q2='All, and two or more in autonomous or private school' then 13
end +
case
when answers.Q3='No' then 0
when answers.Q3='Yes, or no female head/spouse' then 3
end +
case
when answers.Q4='Earth, or other' then 0
when answers.Q4='Wooded planks, tiles or concrete, mud bricks, or cement bricks or tile (mosaic, ceramic, or glazed)' then 7
end +
case
when answers.Q5='None' then 0
when answers.Q5='Outhouse or latrine (with or without treatment), or flush toilet connected to cesspool, septic tank, river, or stream' then 3
when answers.Q5='Flush toilet connected to sewer' then 7
end +
case
when answers.Q6='Non-purchased firewood' then 0
when answers.Q6='Purchased firewood' then 2
when answers.Q6='Charcoal, butane or propane gas, kerosene, electricity, other, or does not cook' then 9
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 6
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 4
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 4
end +
case
when answers.Q10='None' then 0
when answers.Q10='Only radio' then 1
when answers.Q10='Radio/tape player, regardless of radio, and no stereo' then 5
when answers.Q10='Stereo, regardless of radio and radio/tape player' then 10
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_family_members_7_to_12_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_female_head_literate', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_house_floor', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_toilet_type', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_cooking_fuel', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_has_refrigerator', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_has_blender', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_has_iron', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_nicaragua_2010_has_stereo', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Nicaragua 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
