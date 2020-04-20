DROP VIEW IF EXISTS covid_by_state_v;
create view covid_by_state_v as (
select country_region, confirmed, deaths, recovered, (confirmed - deaths - recovered) as active, short_date, s.state_name, s.state, s.emergency_date
from covid_data_0 join states_data s on province_state = s.state_name
-- where province_state = 'California'

union

select country_region, sum(confirmed), sum(deaths), sum(recovered), (sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date, s.state_name, s.state, s.emergency_date 
from covid_data_1 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
-- where substring(province_state, position(', ' in province_state)+2, 2) = 'CA' 
group by substring(province_state, position(', ' in province_state)+2, 2) , country_region, short_date, s.state_name, s.state, s.emergency_date

union

select country_region, sum(confirmed), sum(deaths), sum(recovered), (sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date, s.state_name, s.state, s.emergency_date 
from covid_data_2 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
-- where substring(province_state, position(', ' in province_state)+2, 2) = 'CA' 
group by substring(province_state, position(', ' in province_state)+2, 2) , country_region, short_date, s.state_name, s.state, s.emergency_date

union

select country_region, confirmed, deaths, recovered, (confirmed - deaths - recovered) as active, short_date, s.state_name, s.state, s.emergency_date 
from covid_data_3 join states_data s on province_state = s.state_name
-- where province_state = 'California'

union

select country_region, sum(confirmed), sum(deaths), sum(recovered),(sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date,  s.state_name, s.state, s.emergency_date
from covid_data_4 join states_data s on province_state = s.state_name
-- where province_state = 'California'
group by province_state,country_region, short_date,  s.state_name, s.state, s.emergency_date

order by short_date)
