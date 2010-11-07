select answers.survey_id, 0 as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
case
when answers.Q1='Autre' then 0
when answers.Q1='Briques en banco ou en ciment' then 11
end +
case
when answers.Q2='Lampe tempête ou lampe a pétrole artisanale' then 0
when answers.Q2='Bougie, bois ou autre' then 3
when answers.Q2='Groupe électrogene, solaire, lampe à gaz ou électricité (SENELEC)' then 8
end +
case
when answers.Q3='Autre' then 0
when answers.Q3='Gaz' then 7
end +
case
when answers.Q4='Autre' then 0
when answers.Q4='Robinet interieur' then 7
end +
case
when answers.Q5='Latrines non couvertes, cuvette/seau, aucun ou autre' then 0
when answers.Q5='Latrines couvertes, latrines ventilées améliorées ou chasse d'eau avec fosse septique' then 8
when answers.Q5='Chasse d'eau avec égout' then 19
end +
case
when answers.Q6='Non' then 0
when answers.Q6='Oui' then 19
end +
case
when answers.Q7='Non' then 0
when answers.Q7='Oui' then 2
end +
case
when answers.Q8='Non' then 0
when answers.Q8='Oui' then 15
end +
case
when answers.Q9='Non' then 0
when answers.Q9='Oui' then 5
end +
case
when answers.Q10='Il n'y a pas chef de famille féminin' then 0
when answers.Q10='Non' then 2
when answers.Q10='Oui' then 7
end
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_survey_date', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_house_walls', qgr.response, NULL)) AS 'Q1',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_energy_for_lighting', qgr.response, NULL)) AS 'Q2',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_cooking_fuel', qgr.response, NULL)) AS 'Q3',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_water_source', qgr.response, NULL)) AS 'Q4',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_toilet_type', qgr.response, NULL)) AS 'Q5',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_owns_refrigerator', qgr.response, NULL)) AS 'Q6',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_owns_television', qgr.response, NULL)) AS 'Q7',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_owns_fan', qgr.response, NULL)) AS 'Q8',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_owns_iron', qgr.response, NULL)) AS 'Q9',
GROUP_CONCAT(if(q.nickname = 'ppi_senegal_2009_female_head_literate', qgr.response, NULL)) AS 'Q10'
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="PPI Senegal 2009" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
