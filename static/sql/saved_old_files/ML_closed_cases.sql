DROP VIEW IF EXISTS case_study_1_v;

CREATE VIEW case_study_1_v as (
SELECT
	id,
	CASE WHEN lower(summary) like '%hospitalized%' THEN 1 ELSE 0 END as hospitalized,
	CASE WHEN (death='1') or (death is not null) THEN 1 ELSE 0 END as death,
    CASE WHEN age BETWEEN 0 AND 39 THEN 2 ELSE 0 END as age_0_39,
    CASE WHEN age BETWEEN 40 AND 49 THEN 4 ELSE 0 END as age_40_49,
    CASE WHEN age BETWEEN 50 AND 59 THEN 13 ELSE 0 END as age_50_59,
    CASE WHEN age BETWEEN 60 AND 69 THEN 36 ELSE 0 END as age_60_69,
	CASE WHEN age BETWEEN 70 AND 79 THEN 80 ELSE 0 END as age_70_79,
    CASE WHEN age >= 80 THEN 148 ELSE 0 END as age_80_up,
	CASE WHEN (gender = 'male' or gender = 'Male') THEN 46 ELSE 0 END as gender_male,
	CASE WHEN (gender = 'female' or gender = 'Female') THEN 28 ELSE 0 END as gender_female,
	CASE WHEN lower(summary) like '%pneumonia%' THEN 1 ELSE 0 END as pneumonia,
	CASE WHEN lower(summary) like '%fever%' THEN 1 ELSE 0 END as fever,
	CASE WHEN lower(summary) like '%cough%' THEN 1 ELSE 0 END as cough,
	CASE WHEN lower(summary) like '%breath%' THEN 1 ELSE 0 END as breath,
	CASE WHEN lower(symptom) like '%fatigue%' THEN 1 ELSE 0 END as fatigue,
	CASE WHEN lower(symptom) like '%diarrhea%' THEN 1 ELSE 0 END as diarrhea,
	CASE WHEN lower(symptom) like '%headache%' THEN 1 ELSE 0 END as headache,
	CASE WHEN country = 'China' THEN 1 ELSE 0 END as from_china,
	"visiting Wuhan" as visit_wuhan,
	"from Wuhan" as from_wuhan
FROM individual_case_data	
	);
