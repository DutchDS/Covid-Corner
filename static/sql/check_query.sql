select * from covid_by_country_v 
where country_region = 'Netherlands'
order by short_date desc

select * from covid_by_state_v 
where state = 'OR'
order by short_date desc

select * from covid_by_county_v 
where state = 'MO' and us_county='St. Louis'
order by short_date desc

select * from covid_data_states
where state = 'WA'

select * from covid_and_census_by_state_v 
where state = 'MO' order by date desc

select * from covid_and_census_by_county_v 
where state = 'NY' and us_county = 'Nassau'
