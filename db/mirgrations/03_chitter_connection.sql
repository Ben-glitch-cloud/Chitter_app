

ALTER TABLE message ADD CONSTRAINT message_user_id_fkey FOREIGN KEY (user_id) REFERENCES message(user_id); 

ALTER TABLE message ADD COLUMN account_id INTEGER 

