DROP VIEW IF EXISTS covid_by_county_v;
DROP VIEW IF EXISTS covid_by_state_v;
DROP VIEW IF EXISTS covid_by_country_v;

create view covid_by_county_v as (
select country_region, confirmed, deaths, recovered, active, short_date,  s.state_name, s.state, us_county, s.emergency_date, s.first_case_date
from covid_data_4 join states_data s on province_state = s.state_name
order by short_date
);
-- ************************************************************************************************

create view covid_by_state_v as (
select country_region, confirmed, deaths, recovered, (confirmed - deaths - recovered) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date
from covid_data_0 join states_data s on province_state = s.state_name
union
select country_region, sum(confirmed), sum(deaths), sum(recovered), (sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date 
from covid_data_1 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
group by substring(province_state, position(', ' in province_state)+2, 2) , country_region, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date
union
select country_region, sum(confirmed), sum(deaths), sum(recovered), (sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date 
from covid_data_2 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
group by substring(province_state, position(', ' in province_state)+2, 2) , country_region, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date
union
select country_region, confirmed, deaths, recovered, (confirmed - deaths - recovered) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date 
from covid_data_3 join states_data s on province_state = s.state_name
union
select country_region, sum(confirmed), sum(deaths), sum(recovered),(sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date,  s.state_name, s.state, s.emergency_date, s.first_case_date
from covid_data_4 join states_data s on province_state = s.state_name
group by province_state,country_region, short_date,  s.state_name, s.state, s.emergency_date, s.first_case_date
order by short_date);
-- *********************************************************************************************************

create view covid_by_country_v as (
select country_region, sum(confirmed) as confirmed, sum(deaths) as deaths, sum(recovered) as recovered, (sum(confirmed)-sum(deaths)-sum(recovered)) as active, short_date
from covid_data_0
group by country_region, short_date
union
select country_region, sum(confirmed) as confirmed, sum(deaths) as deaths,  sum(recovered) as recovered, (sum(confirmed)-sum(deaths)-sum(recovered)) as active, short_date 
from covid_data_1
group by country_region, short_date
union
select country_region, sum(confirmed) as confirmed, sum(deaths) as deaths, sum(recovered) as recovered, (sum(confirmed)-sum(deaths)-sum(recovered)) as active, short_date 
from covid_data_2 
group by country_region, short_date
union
select country_region, sum(confirmed) as confirmed, sum(deaths) as deaths, sum(recovered) as recovered, (sum(confirmed)-sum(deaths)-sum(recovered)) as active, short_date 
from covid_data_3
group by country_region, short_date
union
select country_region, sum(confirmed) as confirmed, sum(deaths) as deaths, sum(recovered) as recovered, (sum(confirmed)-sum(deaths)-sum(recovered)) as active,short_date
from covid_data_4
group by country_region, short_date
order by short_date
);
