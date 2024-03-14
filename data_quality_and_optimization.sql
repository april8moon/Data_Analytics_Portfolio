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


-- Посмотреть все записи users
SELECT *
FROM users;

-- Посмотреть максимальную длину каждого столбца
SELECT MAX(LENGTH(age)) AS max_age_length, MAX(LENGTH(sex)) AS max_sex_length
FROM users;

-- Скорректировать тип данных для оптимизации хранилища
ALTER TABLE users
ALTER COLUMN sex TYPE VARCHAR(3);
