select
date,
s.state_name,
(positive - recovered - death - hospitalized_curr) as pos_at_home,
hospitalized_curr,
recovered,
death,
pos_inc as new_cases,
hospital_inc as new_hospitalizations,
death_inc as new_deaths
from covid_data_states c join states_data s on c.state = s.state
where positive > 0 
-- and c.state = 'MO'
-- where date = '2020-04-01'

union 

select
date,
'All' as state_name,
cast(sum((positive - recovered - death - hospitalized_curr)) as integer) as pos_at_home,
cast(sum(hospitalized_curr) as integer) as hospitalized_curr,
cast(sum(recovered) as integer) as recovered,
cast(sum(death) as integer) as death,
cast(sum(pos_inc) as integer) as new_cases,
cast(sum(hospital_inc) as integer) as new_hospitalizations,
cast(sum(death_inc) as integer) as new_deaths
from covid_data_states c join states_data s on c.state = s.state
where positive > 0 
-- and c.state = 'MO'
-- where date = '2020-04-01'
group by date

order by state_name, date
