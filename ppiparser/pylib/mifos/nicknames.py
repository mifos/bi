from collections import namedtuple
import csv

NickRow = namedtuple('NickRow', 'country year povertyLinesVersion pointsVersion questionsVersion nicknames')

class Nicknames(object):

    def __init__(self, filename='nicknames.csv'):
        reader = csv.reader(open(filename))
        self.data = {}
        for row in reader:
            country = self._clean_country(row[0])
            year = int(row[1])
            povertyLinesVersion = row[2]
            pointsVersion = row[3]
            questionsVersion = row[4]
            nicknames = row[5:]
            self.data[country] = NickRow(country, year, povertyLinesVersion, pointsVersion, questionsVersion, nicknames)

    def _clean_country(self, country):
        return country.strip().lower().replace(' ', '').replace('_', '')

    def year(self, country):
        row = self.data[self._clean_country(country)]
        return row.year

    def povertyLinesVersion(self, country):
        row = self.data[self._clean_country(country)]
        return row.povertyLinesVersion

    def pointsVersion(self, country):
        row = self.data[self._clean_country(country)]
        return row.pointsVersion

    def questionsVersion(self, country):
        row = self.data[self._clean_country(country)]
        return row.questionsVersion

    def nickname(self, country, qnum):
        row = self.data[self._clean_country(country)]
        if row.questionsVersion == '0':
            return 'ppi_{0}_{1}_{2}'.format(row.country, row.year, row.nicknames[qnum])
        else:
            return 'ppi_{0}_{1}_{2}_{3}'.format(row.country, row.year, 'r'+row.questionsVersion, row.nicknames[qnum])

    def questionsTitle(self, country):
        row = self.data[self._clean_country(country)]
        questions_version = self.questionsVersionText(country, ' ')
        return 'PPI %s %s%s' % (country.capitalize(), row.year, questions_version)

    def nicknameForSurveyDate(self, country):
        row = self.data[self._clean_country(country)]
        questions_version = self.questionsVersionText(country, '_').lower()
        return 'ppi_%s_%s%s_survey_date' % (country.lower(),row.year, questions_version)

    def questionsVersionText(self, country, seperator):
        row = self.data[self._clean_country(country)]
        questions_version = seperator + 'R' + row.questionsVersion
        if questions_version == seperator + 'R0':
            questions_version = ''
        return questions_version
