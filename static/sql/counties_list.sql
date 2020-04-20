select province_state as state, us_county as county, max(short_date) from covid_data_4
where province_state <> '0' and us_county <> '0'
group by province_state, us_county
order by province_state, us_county