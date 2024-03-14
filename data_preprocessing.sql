-- Добавление потерянных id в users
INSERT INTO users (user_id)
SELECT DISTINCT user_id
FROM interactions
WHERE user_id NOT IN (SELECT user_id FROM users);
