DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories
(
	id serial PRIMARY KEY not null,
    category_name text,
    category_id bigint UNIQUE not null
);

DROP TABLE IF EXISTS addresses CASCADE;

CREATE TABLE addresses
(	
	id serial PRIMARY KEY not null,
    state varchar(2),
    county varchar(64),
    company_name text,
    category_id bigint,
    zip_code bigint,
    lat double precision,
    long double precision,
    company_id text,
	FOREIGN KEY (category_id) REFERENCES categories(category_id)
)