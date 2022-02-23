CREATE DATABASE crypto_ape_db;

\c crypto_ape_db

CREATE TABLE coins(id SERIAL PRIMARY KEY, name TEXT, image_url TEXT);

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password_digest TEXT);

