DROP TABLE IF EXISTS age_data;

CREATE TABLE age_data
(
	id serial not null,		
	age text COLLATE pg_catalog."default",
    pct_deaths_confirmed double precision,
    pct_deaths_all double precision,
	CONSTRAINT "pk_age_data" PRIMARY KEY (
        "id"
     )  
);
-- **********************************************************************
DROP VIEW IF EXISTS census_data_by_county_v CASCADE;
DROP VIEW IF EXISTS census_data_by_state_v CASCADE;
DROP TABLE IF EXISTS  census_data;

CREATE TABLE census_data
(
	id serial not null,	
    tract_id bigint,
    state text COLLATE pg_catalog."default",
    county text COLLATE pg_catalog."default",
    total_pop bigint,
    men bigint,
    women bigint,
    hispanic double precision,
    white double precision,
    black double precision,
    native double precision,
    asian double precision,
    pacific double precision,
    voting_age_citizen bigint,
    income double precision,
    income_err double precision,
    income_per_cap double precision,
    income_per_cap_err double precision,
    poverty double precision,
    child_poverty double precision,
    professional double precision,
    service double precision,
    office double precision,
    construction double precision,
    production double precision,
    drive double precision,
    carpool double precision,
    transit double precision,
    walk double precision,
    other_transp double precision,
    work_at_home double precision,
    mean_commute double precision,
    employed bigint,
    private_work double precision,
    public_work double precision,
    self_employed double precision,
    family_work double precision,
    unemployment double precision,
	CONSTRAINT "pk_census_data" PRIMARY KEY (
        "id"
     )
);
-- ******************************************************************************
DROP VIEW IF EXISTS covid_by_county_v CASCADE;
DROP VIEW IF EXISTS covid_by_state_v CASCADE;
DROP VIEW IF EXISTS covid_by_country_v CASCADE;

DROP TABLE IF EXISTS covid_data_states CASCADE;

CREATE TABLE covid_data_states
(
	id serial not null,	
    date date,
    state text COLLATE pg_catalog."default",
    positive bigint, 
    negative bigint,
    pending bigint,
	hospitalized_curr bigint,
	hospitalized_cum bigint,
	"in_ICU_curr" bigint,
	"in_ICU_cum" bigint,
	on_vent_curr bigint,
	on_vent_cum bigint,
	recovered bigint,
    hospitalized bigint,
    death bigint,
    dontuse_total bigint,
    check_date date,
    total_tests bigint,
	pos_neg bigint,
    fips bigint,
    death_inc bigint,
    hospital_inc bigint,
    neg_inc bigint,
    pos_inc bigint,
    tot_tests_inc bigint,
	CONSTRAINT "pk_covid_data_states" PRIMARY KEY (
        "id"
     )
);
-- **********************************************************************
DROP TABLE IF EXISTS covid_data_0;

CREATE TABLE covid_data_0
(
	id serial not null,	
    province_state text COLLATE pg_catalog."default",
    country_region text COLLATE pg_catalog."default",
    confirmed integer,
    deaths integer,
    recovered integer,
    active bigint,
    short_date date,
    latitude double precision,
    longitude double precision,
    us_county text COLLATE pg_catalog."default",
	CONSTRAINT "pk_covid_data_0" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS covid_data_1;

CREATE TABLE covid_data_1
(
	id serial not null,	
    province_state text COLLATE pg_catalog."default",
    country_region text COLLATE pg_catalog."default",
    confirmed integer,
    deaths integer,
    recovered integer,
    active bigint,
    short_date date,
    latitude double precision,
    longitude double precision,
    us_county text COLLATE pg_catalog."default",
	CONSTRAINT "pk_covid_data_1" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS covid_data_2;

CREATE TABLE covid_data_2
(
	id serial not null,	
    province_state text COLLATE pg_catalog."default",
    country_region text COLLATE pg_catalog."default",
    confirmed integer,
    deaths integer,
    recovered integer,
    active bigint,
    short_date date,
    latitude double precision,
    longitude double precision,
    us_county text COLLATE pg_catalog."default",
	CONSTRAINT "pk_covid_data_2" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS covid_data_3;

CREATE TABLE covid_data_3
(
	id serial not null,	
    province_state text COLLATE pg_catalog."default",
    country_region text COLLATE pg_catalog."default",
    confirmed integer,
    deaths integer,
    recovered integer,
    active bigint,
    short_date date,
    latitude double precision,
    longitude double precision,
    us_county text COLLATE pg_catalog."default",
	CONSTRAINT "pk_covid_data_3" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS covid_data_4;

CREATE TABLE covid_data_4
(
	id serial not null,	
    province_state text COLLATE pg_catalog."default",
    country_region text COLLATE pg_catalog."default",
    confirmed integer,
    deaths integer,
    recovered integer,
    active bigint,
    short_date date,
    latitude double precision,
    longitude double precision,
    us_county text COLLATE pg_catalog."default",
	CONSTRAINT "pk_covid_data_4" PRIMARY KEY (
        "id"
     )
);
-- **********************************************************************
DROP TABLE IF EXISTS gender_data;

CREATE TABLE gender_data
(
	id serial not null,	
    gender text COLLATE pg_catalog."default",
    pct_deaths_confirmed double precision,
	CONSTRAINT "pk_gender_data" PRIMARY KEY (
        "id"
     )
);
-- **********************************************************************
DROP TABLE IF EXISTS individual_case_data_closed CASCADE;

CREATE TABLE individual_case_data_closed
(	id_pk serial not null,
	id bigint,
    open_closed text COLLATE pg_catalog."default",
    reporting_date text COLLATE pg_catalog."default",
    age text COLLATE pg_catalog."default",
    gender text COLLATE pg_catalog."default",
    location text COLLATE pg_catalog."default",
    country text COLLATE pg_catalog."default",
    from_hotspot text COLLATE pg_catalog."default",
--  double precision,
    visit_hotspot text COLLATE pg_catalog."default",
--  bigint,
    summary text COLLATE pg_catalog."default",
    death text COLLATE pg_catalog."default",
    symptom text COLLATE pg_catalog."default",
	CONSTRAINT "pk_individual_case_data_closed" PRIMARY KEY (
        "id_pk"
     )
);
DROP TABLE IF EXISTS individual_case_data_open CASCADE;

CREATE TABLE individual_case_data_open
(	id_pk serial not null,
	id bigint,
    open_closed text COLLATE pg_catalog."default",
    reporting_date text COLLATE pg_catalog."default",
    age text COLLATE pg_catalog."default",
    gender text COLLATE pg_catalog."default",
    location text COLLATE pg_catalog."default",
    country text COLLATE pg_catalog."default",
    from_hotspot text COLLATE pg_catalog."default",
--  double precision,
    visit_hotspot text COLLATE pg_catalog."default",
--  bigint,
    outcome text COLLATE pg_catalog."default",
    symptoms text COLLATE pg_catalog."default",
    date_admission_hospital text COLLATE pg_catalog."default",
 	chronic_disease text COLLATE pg_catalog."default",
	CONSTRAINT "pk_individual_case_data_open" PRIMARY KEY (
        "id_pk"
     )
);
-- **********************************************************************
DROP TABLE IF EXISTS precondition_data;

CREATE TABLE precondition_data
(	id serial not null,	
    precondition text COLLATE pg_catalog."default",
    pct_deaths_confirmed double precision,
    pct_deaths_all double precision,
 	CONSTRAINT "pk_precondition_data" PRIMARY KEY (
        "id"
     )
);
-- **********************************************************************
DROP TABLE IF EXISTS states_data;

CREATE TABLE states_data
(
	id serial not null,	
    "Unnamed: 0" bigint,
    state_name text COLLATE pg_catalog."default",
    state text COLLATE pg_catalog."default",
    emergency_date text COLLATE pg_catalog."default",
    first_case_date text COLLATE pg_catalog."default",
	latitude double precision,
    longitude double precision,
	 CONSTRAINT "pk_states_data" PRIMARY KEY (
        "id"
     )
);
-- **********************************************************************
DROP TABLE IF EXISTS tests_and_hospital_data;

CREATE TABLE tests_and_hospital_data
(
	id serial not null,	
    date date,
    state text COLLATE pg_catalog."default",
    positive double precision,
    negative double precision,
    pending double precision,
    hospitalized double precision,
    death double precision,
    total bigint,
    date_checked date,
    total_test_results double precision,
    death_inc double precision,
    hospitalized_inc double precision,
    negative_inc double precision,
    positive_inc double precision,
    total_test_results_inc double precision,
	CONSTRAINT "pk_tests_and_hospital_data" PRIMARY KEY (
        "id"
     )
);

-- **********************************************************************
DROP VIEW IF EXISTS covid_by_county_v CASCADE;
create view covid_by_county_v as (
select c.country_region, c.confirmed, c.deaths, c.recovered, c.active, c.short_date,  s.state_name, s.state, us_county, s.emergency_date, s.first_case_date, c.latitude, c.longitude
from covid_data_4 c join states_data s on province_state = s.state_name
order by short_date
);
-- ************************************************************************************************
DROP VIEW IF EXISTS covid_by_state_v;
create view covid_by_state_v as (
select country_region, confirmed, deaths, recovered, (confirmed - deaths - recovered) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude
from covid_data_0 join states_data s on province_state = s.state_name
union
select country_region, sum(confirmed), sum(deaths), sum(recovered), (sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude 
from covid_data_1 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
group by substring(province_state, position(', ' in province_state)+2, 2) , country_region, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude
union
select country_region, sum(confirmed), sum(deaths), sum(recovered), (sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude 
from covid_data_2 join states_data s on substring(province_state, position(', ' in province_state)+2, 2) = s.state
group by substring(province_state, position(', ' in province_state)+2, 2) , country_region, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude
union
select country_region, confirmed, deaths, recovered, (confirmed - deaths - recovered) as active, short_date, s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude 
from covid_data_3 join states_data s on province_state = s.state_name
union
select country_region, sum(confirmed), sum(deaths), sum(recovered),(sum(confirmed) -sum(deaths) - sum(recovered)) as active, short_date,  s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude
from covid_data_4 join states_data s on province_state = s.state_name
group by province_state,country_region, short_date,  s.state_name, s.state, s.emergency_date, s.first_case_date, s.latitude, s.longitude
order by short_date);
-- *********************************************************************************************************
DROP VIEW IF EXISTS covid_by_country_v;
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
-- *******************************************************************
DROP VIEW IF EXISTS census_data_by_state_v;
CREATE VIEW census_data_by_state_v as (
select 
	state,
	sum(total_pop) as total_pop, 
	sum(men) as men,  
	sum(women) as women,
	sum(round(white*total_pop/100)) as white, 
	sum(round(black*total_pop/100)) as black, 
	sum(round(native*total_pop/100)) as native, 
	sum(round(hispanic*total_pop/100)) as hispanic, 
	sum(round(pacific*total_pop/100)) as pacific
from census_data
group by state
	);
-- ******************************************************************************
DROP VIEW IF EXISTS census_data_by_county_v CASCADE;

create view census_data_by_county_v as (
select 
state,
county,
sum(total_pop) as total_pop, 
sum(men) as men,  
sum(women) as women,
sum(round(white*total_pop/100)) as white, 
sum(round(black*total_pop/100)) as black, 
sum(round(native*total_pop/100)) as native, 
sum(round(hispanic*total_pop/100)) as hispanic, 
sum(round(pacific*total_pop/100)) as pacific
from census_data
group by state, county
);
-- *****************************************************************************************	

DROP VIEW IF EXISTS covid_and_census_by_state_v;

create view covid_and_census_by_state_v as (
select 
	date, s.state_name, s.state, s.emergency_date, s.first_case_date, 
	max(positive) as positive, max(negative) as negative, max(pending) as pending, max(hospitalized) as hospitalize, 
	max(death) as death, max((positive + hospitalized + death)) as total_cases, max(total_tests) as total_tests,
	max(hospitalized_curr) as hospitalized_curr , max(hospitalized_cum) as hospitalized_cum, max("in_ICU_curr") as in_ICU_curr, max("in_ICU_cum") as in_ICU_cum,
	max(on_vent_curr) as on_vent_curr, max(on_vent_cum) as on_vent_cum, max(recovered) as recovered,
	max(death_inc) as death_inc, max(hospital_inc) as hospital_inc, max(neg_inc) as neg_inc, max(pos_inc) as pos_inc, 
	max(tot_tests_inc) as tot_tests_inc, 
	s.latitude, s.longitude,
	cd.total_pop, cd.men, cd.women, cd.white, cd.black, cd.hispanic, cd.native, cd.pacific
from covid_data_states c 
	join states_data s on c.state = s.state
	left join census_data_by_state_v cd on s.state_name = cd.state 

group by 	date, s.state_name, s.state, s.emergency_date, s.first_case_date, 	s.latitude, s.longitude,
	cd.total_pop, cd.men, cd.women, cd.white, cd.black, cd.hispanic, cd.native, cd.pacific

);
-- *********************************************************************************************
DROP VIEW IF EXISTS covid_and_census_by_county_v;

create view covid_and_census_by_county_v as (
select 
	c.short_date, c.state_name, c.state, c.us_county,
	c.confirmed, c.recovered, c.deaths, c.active, 
	cd.total_pop, cd.men, cd.women, cd.white, cd.black, cd.hispanic, cd.native, cd.pacific,
	c.latitude, c.longitude
from covid_by_county_v c 
	left join census_data_by_county_v cd on c.us_county = cd.county and c.state_name = cd.state
);
-- ***************************************************************************************
DROP VIEW IF EXISTS case_study_1_v CASCADE;

CREATE VIEW case_study_1_v as (
SELECT
	id,
	age,
	gender,
	CASE WHEN (death<>'0') THEN 1 
	ELSE (CASE WHEN (lower(summary) like '%hospitalized%') THEN 2  
			ELSE 3 END) END as final_outcome,
    CASE WHEN age BETWEEN '00' AND '39' THEN 1 ELSE 0 END as age_0_39,
    CASE WHEN age BETWEEN '40' AND '49' THEN 1 ELSE 0 END as age_40_49,
    CASE WHEN age BETWEEN '50' AND '59' THEN 1 ELSE 0 END as age_50_59,
    CASE WHEN age BETWEEN '60' AND '69' THEN 1 ELSE 0 END as age_60_69,
	CASE WHEN age BETWEEN '70' AND '79' THEN 1 ELSE 0 END as age_70_79,
    CASE WHEN age >= '80' THEN 1 ELSE 0 END as age_80_up,
	CASE WHEN (gender = 'male' or gender = 'Male') THEN 1 ELSE 0 END as gender_male,
	CASE WHEN (gender = 'female' or gender = 'Female') THEN 1 ELSE 0 END as gender_female,
	CASE WHEN (lower(summary) like '%pneumonia%' or lower(symptom) like '%pneumonia%') THEN 1 ELSE 0 END as pneumonia,
	CASE WHEN (lower(summary) like '%fever%' or lower(symptom) like '%fever%') THEN 1 ELSE 0 END as fever,
	CASE WHEN (lower(summary) like '%cough%' or lower(symptom) like '%cough%') THEN 1 ELSE 0 END as cough,
	CASE WHEN (lower(summary) like '%sputum%' or lower(symptom) like '%sputum%') THEN 1 ELSE 0 END as sputum,
	CASE WHEN (lower(summary) like '%chill%' or lower(symptom) like '%chill%') THEN 1 ELSE 0 END as chills,
	CASE WHEN (lower(summary) like '%malaise%' or lower(symptom) like '%malaise%') THEN 1 ELSE 0 END as malaise,
	CASE WHEN (lower(summary) like '%breath%' or lower(symptom) like '%breath%') THEN 1 ELSE 0 END as breath,
	CASE WHEN (lower(summary) like '%fatigue%' or lower(symptom) like '%fatigue%') THEN 1 ELSE 0 END as fatigue,
	CASE WHEN (lower(summary) like '%diarrhea%' or lower(symptom) like '%diarrhea%') THEN 1 ELSE 0 END as diarrhea,
	CASE WHEN (lower(summary) like '%headache%' or lower(symptom) like '%headache%') THEN 1 ELSE 0 END as headache,
	CASE WHEN (lower(summary) like '%throat%' or lower(symptom) like '%throat%') THEN 1 ELSE 0 END as throat_ache,
	CASE WHEN (lower(summary) like '%sorenes%' or lower(symptom) like '%joint%' or lower(symptom) like '%muscle%' or lower(symptom) like '%sorenes%') THEN 1 ELSE 0 END as soreness,
	CASE WHEN (lower(summary) like '%pre%condition%' or lower(symptom) like '%pre%condition%') THEN 1 ELSE 0 END as precondition,
	CASE WHEN lower(visit_hotspot) = '1' THEN 1 ELSE 0 END as visit_hotspot,
	CASE WHEN lower(from_hotspot) = '1.0' THEN 1 ELSE 0 END as from_hotspot
FROM individual_case_data_closed	
);
	
DROP VIEW IF EXISTS case_study_2_v CASCADE;

CREATE VIEW case_study_2_v as (
SELECT
	id,
	age,
	gender,
	CASE WHEN lower(outcome) in ('died','death') THEN 1 
	ELSE (CASE WHEN date_admission_hospital is not null THEN 2  
			ELSE 3 END) END as final_outcome,
    CASE WHEN age BETWEEN '00' AND '39' THEN 1 ELSE 0 END as age_0_39,
    CASE WHEN age BETWEEN '40' AND '49' THEN 1 ELSE 0 END as age_40_49,
    CASE WHEN age BETWEEN '50' AND '59' THEN 1 ELSE 0 END as age_50_59,
    CASE WHEN age BETWEEN '60' AND '69' THEN 1 ELSE 0 END as age_60_69,
	CASE WHEN age BETWEEN '70' AND '79' THEN 1 ELSE 0 END as age_70_79,
    CASE WHEN age >= '80' THEN 1 ELSE 0 END as age_80_up,
	CASE WHEN (gender = 'male' or gender = 'Male') THEN 1 ELSE 0 END as gender_male,
	CASE WHEN (gender = 'female' or gender = 'Female') THEN 1 ELSE 0 END as gender_female,
	CASE WHEN lower(symptoms) like '%pneumonia%' THEN 1 ELSE 0 END as pneumonia,
	CASE WHEN lower(symptoms) like '%fever%' THEN 1 ELSE 0 END as fever,
	CASE WHEN lower(symptoms) like '%cough%' THEN 1 ELSE 0 END as cough,
	CASE WHEN lower(symptoms) like '%sputum%' THEN 1 ELSE 0 END as sputum,
	CASE WHEN lower(symptoms) like '%chill%' THEN 1 ELSE 0 END as chills,
	CASE WHEN (lower(symptoms) like '%malaise%' or lower(symptoms) like '%discomfort%' or lower(symptoms) like '%weakness%') THEN 1 ELSE 0 END as malaise,
	CASE WHEN (lower(symptoms) like '%breath%' or lower(symptoms) like '%respiratory%' or lower(symptoms) like '%dyspnea%') THEN 1 ELSE 0 END as breath,
	CASE WHEN lower(symptoms) like '%fatigue%' THEN 1 ELSE 0 END as fatigue,
	CASE WHEN lower(symptoms) like '%diarrhea%' THEN 1 ELSE 0 END as diarrhea,
	CASE WHEN lower(symptoms) like '%headache%' THEN 1 ELSE 0 END as headache,
	CASE WHEN lower(symptoms) like '%throat%' THEN 1 ELSE 0 END as throat_ache,
	CASE WHEN (lower(symptoms) like '%sorenes%' or lower(symptoms) like '%muscle%') THEN 1 ELSE 0 END as soreness,
	CASE WHEN lower(chronic_disease) is not null THEN 1 ELSE 0 END as precondition,
	CASE WHEN lower(visit_hotspot) = '1.0' THEN 1 ELSE 0 END as visit_hotspot,
	CASE WHEN lower(from_hotspot) = 'yes' THEN 1 ELSE 0 END as from_hotspot
FROM individual_case_data_open	
	);

DROP VIEW IF EXISTS case_study_2_all;
CREATE VIEW case_study_all_v as (
SELECT 'closed' as status, * FROM case_study_1_v 
UNION
SELECT 'open', * FROM case_study_2_v 
);
DROP VIEW IF EXISTS covid_new_cases_death_by_state;

create view covid_new_cases_death_by_state as (
select date,s.state_name,pos_inc as new_cases,hospital_inc as new_hospitalizations,death_inc as new_deaths 
    from covid_data_states c 
    join states_data s 
    on c.state = s.state 
    order by c.state, date
);

-- Don't rerun this part unles you are rebuilding this table with the collect_performance_per_model.ipynb
-- DROP TABLE IF EXISTS model_eval;

-- CREATE TABLE model_eval
-- (	
-- 	id serial,
--     gender text COLLATE pg_catalog."default",
--     age text COLLATE pg_catalog."default",
--     model text COLLATE pg_catalog."default",
--     features double precision,
--     train_score double precision,
--     test_score double precision,
-- 	CONSTRAINT "pk_model_eval" PRIMARY KEY (
-- 	"id"
--  )  
-- );
