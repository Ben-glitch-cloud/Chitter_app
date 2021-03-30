
ALTER TABLE message DROP COLUMN sent_time;   

ALTER TABLE message ADD COLUMN sent_time VARCHAR ( 20 ) NOT NULL; 