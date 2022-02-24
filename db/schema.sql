CREATE DATABASE crypto_ape_db;

\c crypto_ape_db

CREATE TABLE coins(id SERIAL PRIMARY KEY, name TEXT, image_url TEXT);

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password_digest TEXT);

ALTER TABLE coins ADD COLUMN symbol TEXT, market_cap TEXT, price TEXT, one_day_change_percent TEXT, supply TEXT, max_supply TEXT, one_day_volume TEXT;

ALTER TABLE coins ADD COLUMN one_day_volume TEXT;

