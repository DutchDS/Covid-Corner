-- Data fixes


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
