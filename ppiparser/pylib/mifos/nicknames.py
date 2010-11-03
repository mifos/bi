from collections import namedtuple
import csv

NickRow = namedtuple('NickRow', 'country year povertyLinesVersion pointsVersion nicknames')

class Nicknames(object):

    def __init__(self, filename='nicknames.csv'):
        reader = csv.reader(open(filename))
        self.data = {}
        for row in reader:
            country = self._clean_country(row[0])
            year = int(row[1])
            povertyLinesVersion = row[2]
            pointsVersion = row[3]
            nicknames = row[4:]
            self.data[country] = NickRow(country, year, povertyLinesVersion, pointsVersion, nicknames)

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

    def nickname(self, country, qnum):
        row = self.data[self._clean_country(country)]
        return 'ppi_{0}_{1}_{2}'.format(row.country, row.year, row.nicknames[qnum])
