-- Добавление ограничений в таблицу interactions
ALTER TABLE interactions
ADD CONSTRAINT interactions_user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id),
ADD CONSTRAINT interactions_item_id_fk FOREIGN KEY (item_id) REFERENCES items(item_id);
