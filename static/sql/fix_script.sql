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

DROP VIEW IF EXISTS covid_and_census_by_state_v;

create view covid_and_census_by_state_v as (
select 
	date, s.state_name, s.state, s.emergency_date, s.first_case_date, 
	positive, negative, pending, hospitalized, death, (positive + hospitalized + death) as total_cases, total_tests,
	hospitalized_curr, hospitalized_cum, "in_ICU_curr" as in_ICU_curr, "in_ICU_cum" as in_ICU_cum,
	on_vent_curr, on_vent_cum, recovered,
	death_inc, hospital_inc, neg_inc, pos_inc, tot_tests_inc, 
	s.latitude, s.longitude,
	cd.total_pop, cd.men, cd.women, cd.white, cd.black, cd.hispanic, cd.native, cd.pacific
from covid_data_states c 
	join states_data s on c.state = s.state
	left join census_data_by_state_v cd on s.state_name = cd.state 
);
