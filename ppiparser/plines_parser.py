#!/usr/bin/python

import csv
import sys
import os.path


# Maps columns names in XLSX to column names in the table ppi_category_likelihood_bands

COLUMN_MAP = {

'Bottom Half Below $1/Day/PPP': 'bottom_half_below_1_00_per_day_2005_ppp',
'Bottom Half Below National Poverty Line': 'bottom_half_below_national',
'Top Half Below National Poverty Line': 'top_half_below_national',
'Total Below $1/Day/PPP': 'below_1_00_per_day_1993_ppp',
'Total Below 150% of National Poverty Line': 'below_150_percent_of_national',
'Total Below 200% of National Poverty Line': 'below_200_percent_of_national',
'Total Below Lower National Food Poverty Line': 'below_national_food', # !!! no column "below_loer_national_food"
'Total Below National Poverty Line': 'below_national',
'Total Below Upper National Poverty Line': 'below_upper_national',
'Total Below the $0.25/Day/PPP Line': 'below_0_25_per_day_2005_ppp',
'Total Below the $0.50/Day/PPP Line': 'below_0_50_per_day_2005_ppp',
'Total Below the $0.75/Day/PPP Line': 'below_0_75_per_day_2005_ppp',
'Total Below the $1.08/Day/1993 PPP Line': 'below_1_08_per_day_1993_ppp',
'Total Below the $1.25/Day/2005 PPP Line': 'below_1_25_per_day_2005_ppp',
'Total Below the $1.25/Day/PPP Line': 'below_1_25_per_day_2005_ppp', # !!! uses 2005 like above
'Total Below the $1.50/Day/PPP Line': 'below_1_50_per_day_2005_ppp',
'Total Below the $1.75/Day/2005 PPP Line': 'below_1_75_per_day_2005_ppp',
'Total Below the $1/Day/1993 PPP Line': 'below_1_00_per_day_1993_ppp',
'Total Below the $1/Day/2005 PPP Line': 'below_1_00_per_day_2005_ppp',
'Total Below the $1/Day/PPP Line': 'below_1_00_per_day_1993_ppp',
'Total Below the $2.16/Day/1993 PPP Line': 'below_2_16_per_day_1993_ppp',
'Total Below the $2.50/Day/2005 PPP Line': 'below_2_50_per_day_2005_ppp',
'Total Below the $2.50/Day/PPP Line': 'below_2_50_per_day_2005_ppp', # !!! uses 2005 like above
'Total Below the $2/Day/1993 PPP Line': 'below_2_00_per_day_1993_ppp',
'Total Below the $2/Day/PPP Line': 'below_2_00_per_day_1993_ppp', # !!! uses 1993 like above
'Total Below the $3.00/Day/2005 PPP Line': None, # !!! no column for $3.00
'Total Below the $3.24/Day/1993 PPP Line': 'below_3_24_per_day_1993_ppp',
'Total Below the $3.75/Day/2005 PPP Line': 'below_3_75_per_day_2005_ppp',
'Total Below the $3.75/Day/PPP Line': 'below_3_75_per_day_2005_ppp', # !!! uses 2005 like above
'Total Below the $4.00/Day/2005 PPP Line': 'below_4_00_per_day_2005_ppp',
'Total Below the $4.32/Day/1993 PPP Line': 'below_4_32_per_day_1993_ppp',
'Total Below the $4/Day/2005 PPP Line': 'below_4_00_per_day_2005_ppp',
'Total Below the $5.00/Day/2005 PPP Line': 'below_5_00_per_day_2005_ppp',
'Total Below the $5/Day/2005 PPP Line': 'below_5_00_per_day_2005_ppp',
'Total Below the $5/Day/PPP Line': 'below_5_00_per_day_2005_ppp', # !!! 3 above use 2005
'Total Below the $6.25/Day/2005 PPP Line': 'below_6_25_per_day_2005_ppp',
'Total Below the 100% National Poverty Line': None,
'Total Below the 100% of National Poverty Line': None, # !!! no column below_100_percent_of_national
'Total Below the 125% National Poverty Line': 'below_125_percent_of_national',
'Total Below the 125% of National Asset Poverty Line': 'below_125_percent_of_national_asset',
'Total Below the 125% of the National Poverty Line': 'below_125_percent_of_national_asset',
'Total Below the 150% of National Asset Poverty Line': 'below_150_percent_of_national_asset',
'Total Below the 150% of the National Poverty Line': 'below_150_percent_of_national',
'Total Below the 150% of the Upper National Poverty Line': None, # !!! no column,
'Total Below the 200% National Poverty Line': 'below_200_percent_of_national',
'Total Below the 200% of the National Poverty Line': 'below_200_percent_of_national',
'Total Below the 200% of the Upper National Poverty Line': None, # !!! no column
'Total Below the 300% of the National Poverty Line': 'below_300_percent_of_national',
'Total Below the 50% National Poverty Line': 'below_50_percent_of_national',
'Total Below the 75% National Poverty Line': 'below_75_percent_of_national',
'Total Below the 75% of the National Poverty Line': 'below_75_percent_of_national',
'Total Below the Food Poverty Line': 'below_food',
'Total Below the Half Minimum Wage Line': 'below_half_minimum_wage',
'Total Below the Laeken Poverty Line': 'below_laeken',
'Total Below the Lower National Poverty Line': 'below_lower_national',
'Total Below the MOLISA Poverty  Line': 'below_molisa',
'Total Below the National Asset Poverty Line': 'below_national_asset',
'Total Below the National Capacity Poverty Line': 'below_national_capacity',
'Total Below the National Food Poverty Line': 'below_national_food',
'Total Below the National Poverty Line': 'below_national',
'Total Below the One-Minimum-Wage Line': 'below_one_minimum_wage',
'Total Below the Quarter-Minimum-Wage Line': 'below_quarter_minimum_wage',
'Total Below the Subsistence Poverty Line': 'below_subsistence',
'Total Below the Two-Minimum-Wage Line': 'below_two_minimum_wage',
'Total Below the USAID Extreme Poverty Line': 'below_usaid_extreme',
'Total Below the Upper Line': 'below_upper_',
'Total Below the Upper National Poverty Line': 'below_upper_national',

}

# For India: columns which have *2005* version instead of original *1993*
COLUMNS_2005_VERSION = ('below_1_00_per_day_1993_ppp', 'below_2_00_per_day_1993_ppp')


INSERT_TEMPLATE = 'insert into ppi_category_likelihood_bands ({COLUMNS}) values ({VALUES});'

def _country_name(filename):
    return os.path.basename(filename).split('.')[0].capitalize()

def inserts(filename):
    country = _country_name(filename)
    title = 'PPI %s 01' % country
    reader = csv.reader(open(filename))
    fst = reader.next()
    read_columns = [c.replace('"', '').strip() for c in fst[2:]]
    db_columns = ['ppi_survey', 'likelihoods_version', 'lower_bound', 'upper_bound']
    for c in read_columns:
        if c not in COLUMN_MAP:
            raise 'Column not defined in COLUMN_MAP: <%s>' % c
        if COLUMN_MAP[c] is None:
            print 'WARNING: omitting insert to column <%s> because it maps to None' % c
        to_append = COLUMN_MAP[c] if country.lower() != 'india' else COLUMN_MAP[c].replace('1993', '2005')
        db_columns.append(to_append)
    for row in reader:
        db_data = ['\'' + title + '\'', '1'] + list(row)

        # remove columns which are None
        db_data = [d for (d, c) in zip(db_data, db_columns) if c]
        db_columns = [c for c in db_columns if c]

        yield INSERT_TEMPLATE.format(COLUMNS=', '.join(db_columns), VALUES=', '.join(db_data))

def main():
    if len(sys.argv) < 2:
        print 'CSV file needed as first arg'
    filename = sys.argv[1]
    with open('%sPovertyLines.sql' % _country_name(filename).capitalize(), 'w') as f:
        f.write('\n'.join(inserts(filename)))

if __name__ == '__main__':
    main()

