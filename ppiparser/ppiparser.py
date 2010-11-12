#!/usr/bin/python

import os.path
import string
import sys
import random

from mifos.nicknames import Nicknames

XML_TEMPLATE = '''<?xml version="1.0" encoding="UTF-8"?>
<QuestionGroup xmlns="http://www.mifos.org/QuestionGroupDefinition"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://www.mifos.org/QuestionGroupDefinition QuestionGroupDefinition.xsd ">
    <ppi>true</ppi>
    <title>{TITLE}</title>
    <editable>false</editable>
    <eventSource>
        <event>Create</event>
        <source>Client</source>
    </eventSource>
    <section order="1">
        <name>{TITLE}</name>
        <question order="1">
            <text>Date Survey Was Taken</text>
            <nickname>{DATE_NICKNAME}</nickname>
            <type>DATE</type>
            <mandatory>true</mandatory>
        </question>
{QUESTIONS}
    </section>
</QuestionGroup>
'''

CHOICE_TEMPLATE = \
'''            <choice order="{ORDER}">
                <value>{VALUE}</value>
            </choice>
'''

SINGLE_QUESTION_TEMPLATE = \
'''        <question order="{ORDER}">
            <text>{TITLE}</text>
            <nickname>{NICKNAME}</nickname>
            <type>SINGLE_SELECT</type>
{CHOICES}
            <mandatory>true</mandatory>
        </question>
'''

#####################################################################################

SQL_CASE_TEMPLATE = '''case
{WHENS}
end'''

SQL_CASE_WHEN_TEMPLATE = '''when answers.Q{NUMBER}='{ANSWER}' then {VALUE}'''

GROUP_CONCAT_TEMPLATE = "GROUP_CONCAT(if(q.nickname = '{NICKNAME}', qgr.response, NULL)) AS 'Q{NUMBER}'"

SQL_TEMPLATE = '''select answers.survey_id, {POINTS_VERSION} as points_version, date(str_to_date(answers.date_survey_taken, '%d/%m/%Y')) as date_survey_taken, answers.entity_id, answers.entity_type_id,

(
{CASES}
) 
as ppi_score
from
(SELECT
qg.id as survey_id,
GROUP_CONCAT(if(q.nickname = '{DATE_NICKNAME}', qgr.response, NULL)) AS 'date_survey_taken',
qgi.entity_id as entity_id,
es.entity_type_id as entity_type_id,
{CONCATS}
FROM question_group_response qgr, question_group_instance qgi, question_group qg, sections_questions sq, questions q, event_sources es
WHERE qgr.question_group_instance_id = qgi.id and qgr.sections_questions_id = sq.id and sq.question_id = q.question_id and qgi.question_group_id = qg.id and qg.title="{TITLE}" and qgi.event_source_id = es.id
GROUP BY question_group_instance_id) as answers
'''
##############################################################

PROPERTIES_TOP_TEMPLATE = \
'''questionGroup.name={TITLE}
questionGroup.xml.filename={FILENAME}
survey.count={SURVEY_COUNT}
'''

PROPERTIES_RESPONSE_TEMPLATE = 'survey.{SURVEY_NUMBER}.question.{QUESTION_NUMBER}.response.text={RESPONSE}\n'
PROPERTIES_SCORE_TEMPLATE = 'survey.{SURVEY_NUMBER}.ppi.score={SCORE}\n'

def oneSurvey(cases, survey_num, answer_type):
    score = 0
    response = PROPERTIES_RESPONSE_TEMPLATE.format(SURVEY_NUMBER=survey_num, QUESTION_NUMBER=1, RESPONSE='11/11/2010')
    cases.append(response)
    for (qnum, q) in enumerate(qs):
        index = 0
        if answer_type == 'first':
            index = 0
        if answer_type == 'last':
            index = len(q[1])-1
        if answer_type == 'random':
            index = random.randint(0,len(q[1])-1)

        x = q[1][index]
        response_text = x[0].replace('\'','\\\'')
        response = PROPERTIES_RESPONSE_TEMPLATE.format(SURVEY_NUMBER=survey_num, QUESTION_NUMBER=qnum+2, RESPONSE=response_text)
        score+=x[1]
        cases.append(response)
    bottom = PROPERTIES_SCORE_TEMPLATE.format(SURVEY_NUMBER=survey_num, SCORE=score)
    cases.append(bottom)
    return cases

def properties(qs, country_name, nicks, title='Unknown', filename='Unknown'):
    cases = []
    top = PROPERTIES_TOP_TEMPLATE.format(TITLE=title, FILENAME=filename, SURVEY_COUNT=3)
    cases.append(top)

    cases = oneSurvey(cases, 1, 'first')
    cases = oneSurvey(cases, 2, 'last')
    cases = oneSurvey(cases, 3, 'random')

    return string.join(cases, '')

def sql(qs, country_name, nicks, title='Unknown'):
    cases = []
    for (qnum, q) in enumerate(qs):
        whens = [SQL_CASE_WHEN_TEMPLATE.format(NUMBER=qnum+1, ANSWER=str(x[0]).replace('\'','\\\''), VALUE=x[1]) for x in q[1]]
        case = SQL_CASE_TEMPLATE.format(WHENS='\n'.join(whens))
        cases.append(case)
    group_concats = [GROUP_CONCAT_TEMPLATE.format(NICKNAME=nicks.nickname(country_name, qnum), NUMBER=qnum+1) for (qnum, q) in enumerate(qs)]
    return SQL_TEMPLATE.format(CASES=' +\n'.join(cases), CONCATS=',\n'.join(group_concats), TITLE=title,
            POINTS_VERSION= nicks.pointsVersion(country_name), 
            DATE_NICKNAME=nicks.nicknameForSurveyDate(country_name))

def xml(qs, country_name, nicks, title='Unknown'):
    questions = []
    for (qnum, q) in enumerate(qs):
        choices = [CHOICE_TEMPLATE.format(ORDER=i+1, VALUE=val) for (i, val) in enumerate(map(lambda x:x[0], q[1]))]
        question = SINGLE_QUESTION_TEMPLATE.format(ORDER=qnum+2, TITLE=q[0],
                NICKNAME=nicks.nickname(country_name, qnum), CHOICES=''.join(choices))
        questions.append(question)
    return XML_TEMPLATE.format(TITLE=title, QUESTIONS=''.join(questions),
            DATE_NICKNAME=nicks.nicknameForSurveyDate(country_name))

def parse_questions(f):
    #import ipdb; ipdb.set_trace()
    no = 1
    letter = 'Z'
    question = None
    answers = None
    for line in open(f):
        if not line.strip():
            continue
        if line.strip().startswith('%d.' % no):
            if no > 1:
                yield (question, answers)
            no += 1
            question = line[line.find('.')+1:].strip()
            letter_it = iter(string.ascii_uppercase)
            letter = letter_it.next()
            answers = []
        if line.strip().startswith('%s.' % letter):
            answers.append(line[line.find('.')+1:].strip())
            letter = letter_it.next()
        if '.' not in line.strip() and line.strip().isdigit():
            answers[-1] = (answers[-1], int(line.strip()))
        if 'Total score' in line:
            yield (question, answers)
            return

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print 'Usage: %s TXT NICKNAMES' % os.path.basename(sys.argv[0])
        sys.exit(1)
    filename = sys.argv[1]
    country_name = os.path.basename(filename.split()[0])
    if '.' in country_name:
        country_name = country_name.split('.')[0]
    nicks = Nicknames(sys.argv[2])
    year = nicks.year(country_name)
    title = nicks.questionsTitle(country_name)
    qs = list(parse_questions(filename))

    xml_country_version = country_name.upper() + str(year) + nicks.questionsVersionText(country_name,'')

    properties_out = properties(qs, country_name, nicks, title, xml_country_version)
    sql_out = sql(qs, country_name, nicks, title)
    xml_out = xml(qs, country_name, nicks, title)

    tmp_sql_filename = 'generated/scoringEtl/%s%s%sPPIScore.sql' % (country_name.capitalize(), year, nicks.questionsVersionText(country_name,''))
    with open(tmp_sql_filename, 'w') as sql_f:
        sql_f.write(sql_out)
    print 'SQL written to ' + tmp_sql_filename

    tmp_properties_filename = 'generated/testData/%s%s%sTesting.properties' % (country_name.capitalize(), year, nicks.questionsVersionText(country_name,''))
    with open(tmp_properties_filename, 'w') as properties_f:
        properties_f.write(properties_out)
    print 'properties written to ' + tmp_properties_filename

    tmp_xml_filename = 'generated/questionGroups/PPISurvey%s%s%s.xml' % (country_name.upper(), year, nicks.questionsVersionText(country_name,''))
    with open(tmp_xml_filename, 'w') as xml_f:
        xml_f.write(xml_out)
    print 'XML written to ' + tmp_xml_filename

