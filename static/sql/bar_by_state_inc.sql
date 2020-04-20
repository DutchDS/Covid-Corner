select
date,
s.state_name,
pos_inc as new_cases,
hospital_inc as new_hospitalizations,
death_inc as new_deaths
from covid_data_states c join states_data s on c.state = s.state
-- where c.state = 'CA'
-- where date = '2020-04-01'
order by c.state, date