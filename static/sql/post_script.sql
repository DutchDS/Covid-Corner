-- *******************************************************************************************
-- Add first case date to states_date
with new_values as (
	select min(short_date) as first_date, s.state
	from covid_by_state_v c join states_data s on c.state = s.state
	group by s.state 
	)
update states_data as s
  set first_case_date = nv.first_date
from new_values nv
where nv.state = s.state;
-- *******************************************************************************************
-- Add latitude and longituden to states_date
with new_values as (
select province_state, latitude, longitude from covid_data_3 where country_region = 'US' and short_date = '2020-03-21'
	)
update states_data as s
  set latitude = nv.latitude,
  		longitude = nv.longitude
from new_values nv
where nv.province_state = s.state_name;
-- *******************************************************************************************
-- Fix South Korea different names used over time
UPDATE covid_data_0
SET country_region = 'Korea, South'
WHERE country_region = 'South Korea';
UPDATE covid_data_1
SET country_region = 'Korea, South'
WHERE country_region = 'South Korea';
UPDATE covid_data_2
SET country_region = 'Korea, South'
WHERE country_region = 'South Korea';
UPDATE covid_data_3
SET country_region = 'Korea, South'
WHERE country_region = 'Republic of Korea';

update covid_data_1
set country_region = 'China'
where country_region = 'Mainland China'
update covid_data_2
set country_region = 'China'
where country_region = 'Mainland China'
update covid_data_3
set country_region = 'China'
where country_region = 'Mainland China'



UPDATE individual_case_data_closed
SET summary = substring(summary, 0, position('not hospitalized' in lower(summary))) || 'not-in-hospital' || 
substring(summary, position('not hospitalized' in lower(summary))+16)
WHERE lower(summary) like '%not hospitalized%';

DELETE from individual_case_data_open
where age in ('16-80','18-65','19-77','21-72','22-80','23-72','38-68','40-89','8-68');

UPDATE individual_case_data_open
SET age = '00'
WHERE age in ('0-6','0.08333','0.25','0.5','0.58333');
UPDATE individual_case_data_open
SET age = '01'
WHERE age in ('1','1.75');
UPDATE individual_case_data_open
SET age = '02'
WHERE age = '2';
UPDATE individual_case_data_open
SET age = '03'
WHERE age = '3';
UPDATE individual_case_data_open
SET age = '04'
WHERE age = '4';
UPDATE individual_case_data_open
SET age = '05'
WHERE age = '5';
UPDATE individual_case_data_open
SET age = '05'
WHERE age = '0-10';
UPDATE individual_case_data_open
SET age = '07'
WHERE age = '7';
UPDATE individual_case_data_open
SET age = '08'
WHERE age = '8';
UPDATE individual_case_data_open
SET age = '09'
WHERE age in ('9','0-18');
UPDATE individual_case_data_open
SET age = '15'
WHERE age in ('10-19','13-19');
UPDATE individual_case_data_open
SET age = '25'
WHERE age = '20-29';
UPDATE individual_case_data_open
SET age = '34'
WHERE age in ('27-40','30-39');
UPDATE individual_case_data_open
SET age = '40'
WHERE age = '36-45';
UPDATE individual_case_data_open
SET age = '45'
WHERE age = '40-49';
UPDATE individual_case_data_open
SET age = '55'
WHERE age = '50-59';
UPDATE individual_case_data_open
SET age = '60'
WHERE age = '60-60';
UPDATE individual_case_data_open
SET age = '65'
WHERE age = '60-69';
UPDATE individual_case_data_open
SET age = '75'
WHERE age = '70-79';
UPDATE individual_case_data_open
SET age = '80'
WHERE age = '80-80';
UPDATE individual_case_data_open
SET age = '85'
WHERE age = '80-89';


update census_data
set county = substring(county, 0, position(' County' in county))
where county like '% County';

update census_data
set county = substring(county, 0, position(' city' in county))||' City'
where county like '% city';