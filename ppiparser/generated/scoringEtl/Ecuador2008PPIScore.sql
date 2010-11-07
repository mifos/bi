select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Four or more' then 0
when answers.Q1='Three' then 10
when answers.Q1='Two' then 17
when answers.Q1='One' then 21
when answers.Q1='None' then 29
end +
case
when answers.Q2='No' then 0
when answers.Q2='No one in the age range' then 2
when answers.Q2='Yes' then 5
end +
case
when answers.Q3='Tile, palm leaves, straw, or leaves' then 0
when answers.Q3='Tin, asbestos (Eternit), or other' then 4
when answers.Q3='Reinforced concrete/flagstone/concrete' then 8
end +
case
when answers.Q4='None, latrine, flush toilet and pit, Flush toilet and septic tank not inside the residence' then 0
when answers.Q4='Flush toilet to sewer system not inside the residence' then 2
when answers.Q4='Flush toilet and septic tank inside the residence' then 4
when answers.Q4='Flush toilet to sewer system inside the residence' then 7
end +
case
when answers.Q5='No' then 0
when answers.Q5='Yes' then 5
end +
case
when answers.Q6='Firewood/charcoal or other' then 0
when answers.Q6='Gas, electricity, or no one cooks' then 4
end +
case
when answers.Q7='No' then 0
when answers.Q7='Yes' then 18
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes' then 6
end +
case
when answers.Q9='None' then 0
when answers.Q9='One' then 4
when answers.Q9='Two' then 9
when answers.Q9='Three or more' then 14
end +
case
when answers.Q10='No' then 0
when answers.Q10='Yes' then 4
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_family_members_0_to_16', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_all_family_members_5_to_16_in_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_house_roof', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_toilet_type', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_has_shower', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_cooking_fuel', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_has_car', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_has_refrigerator', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_color_televisions', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_ecuador_2008_has_blender', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Ecuador 2008" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
