select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Five or more' then 0
when answers.Q1='Four' then 6
when answers.Q1='Three' then 11
when answers.Q1='Two' then 17
when answers.Q1='One' then 20
end +
case
when answers.Q2='No' then 0
when answers.Q2='Yes' then 5
when answers.Q2='No members ages 5 to 18' then 7
end +
case
when answers.Q3='Three or less' then 0
when answers.Q3='Four to eleven' then 2
when answers.Q3='Twelve or more' then 8
when answers.Q3='No female head/spouse' then 8
end +
case
when answers.Q4='None' then 0
when answers.Q4='One' then 4
when answers.Q4='Two or more' then 13
end +
case
when answers.Q5='None' then 0
when answers.Q5='One or more' then 8
end +
case
when answers.Q6='One to four' then 0
when answers.Q6='Five' then 2
when answers.Q6='Six' then 5
when answers.Q6='Seven' then 7
when answers.Q6='Eight or more' then 11
end +
case
when answers.Q7='Ditch, other, or no bathroom' then 0
when answers.Q7='Simple hole, or directly into river, lake, or ocean' then 2
when answers.Q7='Septic tank not connected to public sewage/rainwater system' then 3
when answers.Q7='Septic tank connected to public sewage/rainwater system' then 4
when answers.Q7='('Direct connection to public sewage/rainwater system', 5)' then 5
end +
case
when answers.Q8='No' then 0
when answers.Q8='Yes, with one door' then 5
when answers.Q8='Yes, with two doors' then 10
end +
case
when answers.Q9='No' then 0
when answers.Q9='Yes' then 7
end +
case
when answers.Q10='None' then 0
when answers.Q10='Cellular but not land-line' then 5
when answers.Q10='Land-line but not cellular' then 6
when answers.Q10='Both' then 11
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_family_members', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_family_members_5_to_18_in_private_school', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_years_of_school_for_female_head', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_empoyed_with_contract', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_employed_at_mid_level', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_rooms_in_house', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_sewage_disposal', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_has_refrigerator', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_has_washing_machine', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_brazil_2010_has_phone', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Brazil 2010" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers