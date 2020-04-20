drop view if exists states_data_ext_v;
create view states_data_ext_v as (
Select min(short_date), sv.emergency_date, sv.state, sv.state_name 
from covid_by_state_v sv join states_data s on sv.state = s.state
group by sv.emergency_date, sv.state, sv.state_name
)