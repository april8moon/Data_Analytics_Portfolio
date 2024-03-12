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


-- Загрузка данных
COPY users (user_id, age, sex)
FROM 'D:\Datasets\mts\users.csv'
DELIMITER ','
CSV HEADER;

COPY items (item_id, title, genres, authors, year)
FROM 'D:\Datasets\mts\items.csv'
DELIMITER ','
CSV HEADER;

COPY interactions (user_id, item_id, progress, rating, start_date)
FROM 'D:\Datasets\mts\interactions.csv'
DELIMITER ','
CSV HEADER;


-- Добавление потерянных id в users
INSERT INTO users (user_id)
SELECT DISTINCT user_id
FROM interactions
WHERE user_id NOT IN (SELECT user_id FROM users);


-- Добавление ограничений в таблицу interactions
ALTER TABLE interactions
ADD CONSTRAINT interactions_user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id),
ADD CONSTRAINT interactions_item_id_fk FOREIGN KEY (item_id) REFERENCES items(item_id);

-- Посмотреть все записи items
SELECT *
FROM items;

-- Посмотреть максимальную длину каждого столбца
SELECT MAX(LENGTH(title)) AS max_title_length, MAX(LENGTH(authors)) AS max_authors_length, MAX(LENGTH(genres)) AS max_genres_length
FROM items;

-- Скорректировать тип данных для оптимизации хранилища
ALTER TABLE items
ALTER COLUMN title TYPE VARCHAR(450);

ALTER TABLE items
ALTER COLUMN authors TYPE VARCHAR(1250);

ALTER TABLE items
ALTER COLUMN genres TYPE VARCHAR(350);
