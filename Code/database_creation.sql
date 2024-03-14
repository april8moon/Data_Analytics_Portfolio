-- Создание базы данных MTS
CREATE DATABASE MTS; 


-- Создание таблицы users
CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	age VARCHAR(10),
	sex VARCHAR(10)
);


-- Создание таблицы items
CREATE TABLE items (
	item_id SERIAL PRIMARY KEY,
	title VARCHAR(500),
	genres TEXT,
	authors TEXT,
	year TEXT
);


-- Создание таблицы interactions
CREATE TABLE interactions (
	user_id SERIAL,
	item_id SERIAL,
	progress SMALLINT,
	rating DECIMAL(3,2),
	start_date DATE
);
