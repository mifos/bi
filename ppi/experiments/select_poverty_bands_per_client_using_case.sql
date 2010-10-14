select client_id, 
(case 
when ppi_score <= 4 then 77.0
when ppi_score >= 5 and ppi_score <= 9 then 58.5
when ppi_score >= 10 and ppi_score <= 14 then 51.2
when ppi_score >= 15 and ppi_score <= 19 then 35.5
when ppi_score >= 20 and ppi_score <= 24 then 28.7
when ppi_score >= 25 and ppi_score <= 29 then 21.3
when ppi_score >= 30 and ppi_score <= 34 then 18.9
when ppi_score >= 35 and ppi_score <= 39 then 14.9
when ppi_score >= 40 and ppi_score <= 44 then 10.0
when ppi_score >= 45 and ppi_score <= 49 then 4.5
when ppi_score >= 50 and ppi_score <= 54 then 5.1
when ppi_score >= 55 and ppi_score <= 59 then 5.7
when ppi_score >= 60 and ppi_score <= 64 then 18.9
when ppi_score >= 65 and ppi_score <= 69 then 21.3
when ppi_score >= 70 and ppi_score <= 74 then 18.9
when ppi_score >= 75 and ppi_score <= 79 then 21.3
when ppi_score >= 80 and ppi_score <= 84 then 18.9
when ppi_score >= 85 and ppi_score <= 89 then 21.3
when ppi_score >= 90 and ppi_score <= 94 then 18.9
when ppi_score >= 95 and ppi_score <= 100 then 4.5
end
) as 'below_national_poverty_line',
(case 
when ppi_score <= 4 then 41.7
when ppi_score >= 5 and ppi_score <= 9 then 34.3
when ppi_score >= 10 and ppi_score <= 14 then 24.7
when ppi_score >= 15 and ppi_score <= 19 then 21.0
when ppi_score >= 20 and ppi_score <= 24 then 14.0
when ppi_score >= 25 and ppi_score <= 29 then 9.2
when ppi_score >= 30 and ppi_score <= 34 then 9.2
when ppi_score >= 35 and ppi_score <= 39 then 7.6
when ppi_score >= 40 and ppi_score <= 44 then 4.5
when ppi_score >= 45 and ppi_score <= 49 then 1.3
when ppi_score >= 50 and ppi_score <= 54 then 1.3
when ppi_score >= 55 and ppi_score <= 59 then 1.3
when ppi_score >= 60 and ppi_score <= 64 then 2.2
when ppi_score >= 65 and ppi_score <= 69 then 0.7
when ppi_score >= 70 and ppi_score <= 74 then 0.2
when ppi_score >= 75 and ppi_score <= 79 then 0.4
when ppi_score >= 80 and ppi_score <= 84 then 0.2
when ppi_score >= 85 and ppi_score <= 89 then 0.5
when ppi_score >= 90 and ppi_score <= 94 then 0.0
when ppi_score >= 95 and ppi_score <= 100 then 0.0
end
) as 'below_usaid_extreme_poverty_line',
(case 
when ppi_score <= 4 then 100.0
when ppi_score >= 5 and ppi_score <= 9 then 95.5
when ppi_score >= 10 and ppi_score <= 14 then 95.3
when ppi_score >= 15 and ppi_score <= 19 then 95.3
when ppi_score >= 20 and ppi_score <= 24 then 90.2
when ppi_score >= 25 and ppi_score <= 29 then 84.4
when ppi_score >= 30 and ppi_score <= 34 then 74.3
when ppi_score >= 35 and ppi_score <= 39 then 62.8
when ppi_score >= 40 and ppi_score <= 44 then 50.5
when ppi_score >= 45 and ppi_score <= 49 then 48.0
when ppi_score >= 50 and ppi_score <= 54 then 34.5
when ppi_score >= 55 and ppi_score <= 59 then 38.7
when ppi_score >= 60 and ppi_score <= 64 then 22.7
when ppi_score >= 65 and ppi_score <= 69 then 21.8
when ppi_score >= 70 and ppi_score <= 74 then 16.3
when ppi_score >= 75 and ppi_score <= 79 then 7.9
when ppi_score >= 80 and ppi_score <= 84 then 3.6
when ppi_score >= 85 and ppi_score <= 89 then 4.0
when ppi_score >= 90 and ppi_score <= 94 then 1.7
when ppi_score >= 95 and ppi_score <= 100 then 0.7
end
) as 'below_1_50_per_day_ppp_poverty_line',
(case 
when ppi_score <= 4 then 100.0
when ppi_score >= 5 and ppi_score <= 9 then 99.1
when ppi_score >= 10 and ppi_score <= 14 then 97.5
when ppi_score >= 15 and ppi_score <= 19 then 98.9
when ppi_score >= 20 and ppi_score <= 24 then 98.0
when ppi_score >= 25 and ppi_score <= 29 then 94.9
when ppi_score >= 30 and ppi_score <= 34 then 93.7
when ppi_score >= 35 and ppi_score <= 39 then 84.7
when ppi_score >= 40 and ppi_score <= 44 then 77.8
when ppi_score >= 45 and ppi_score <= 49 then 79.0
when ppi_score >= 50 and ppi_score <= 54 then 64.0
when ppi_score >= 55 and ppi_score <= 59 then 69.9
when ppi_score >= 60 and ppi_score <= 64 then 55.2
when ppi_score >= 65 and ppi_score <= 69 then 50.0
when ppi_score >= 70 and ppi_score <= 74 then 42.9
when ppi_score >= 75 and ppi_score <= 79 then 27.3
when ppi_score >= 80 and ppi_score <= 84 then 15.5
when ppi_score >= 85 and ppi_score <= 89 then 12.9
when ppi_score >= 90 and ppi_score <= 94 then 8.3
when ppi_score >= 95 and ppi_score <= 100 then 4.4
end
) as 'below_2_00_per_day_ppp_poverty_line'
from ppi_survey_results