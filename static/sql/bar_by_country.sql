select
short_date as date,
country_region as country,
(confirmed-recovered-deaths) as positive,
recovered,
deaths as deceased
from covid_by_country_v 
where confirmed > 0 or recovered>0
-- where country_region = 'Netherlands'
-- order by country, short_date

union 

select

short_date as date,
'All' as country,
cast(sum(confirmed-recovered-deaths) as integer) as positive,
cast(sum(recovered) as integer) as recovered,
cast(sum(deaths) as integer) as deceased
from covid_by_country_v 
where confirmed > 0 or recovered>0
-- where country_region = 'Netherlands'
group by short_date, country
order by country, date