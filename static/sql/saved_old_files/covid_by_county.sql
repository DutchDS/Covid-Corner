DROP VIEW IF EXISTS covid_by_county_v;
create view covid_by_county_v as (

-- -- DATA ONLY AT STATE LEVEL in covid_data_0
-- select country_region, province_state, confirmed, deaths, recovered, active, short_date, s.state_name, s.state, s.emergency_date
-- from covid_data_0 left join states_data s on province_state = s.state_name
-- where province_state = 'California'

-- union

-- -- DATA ONLY AT CITY LEVEL
-- select country_region, province_state, confirmed, deaths, recovered,  active, short_date, s.state_name, s.state, substring(province_state, 0, position(', ' in province_state)) as county, s.emergency_date 
-- from covid_data_1 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
-- where substring(province_state, 0, position(', ' in province_state)) = 'Seattle'

-- union

-- -- DATA ONLY AT CITY LEVEL
-- select country_region, province_state, confirmed, deaths, recovered,  active, short_date, s.state_name, s.state, substring(province_state, 0, position(', ' in province_state)) as county, s.emergency_date 
-- from covid_data_2 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
-- where substring(province_state, 0, position(', ' in province_state)) = 'Seattle'

-- union

-- -- DATA ONLY AT STATE LEVEL in covid_data_3
-- select country_region, confirmed, deaths, recovered, active, short_date, s.state_name, s.state, s.emergency_date 
-- from covid_data_3 join states_data s on province_state = s.state_name
-- -- where province_state = 'California'

-- union

select country_region, confirmed, deaths, recovered, active, short_date,  s.state_name, s.state, us_county, s.emergency_date
from covid_data_4 join states_data s on province_state = s.state_name
-- where us_county = 'St. Louis' and state = 'MO'
order by short_date
)
