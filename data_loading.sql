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
