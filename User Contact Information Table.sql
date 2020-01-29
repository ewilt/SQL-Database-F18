DROP TABLE IF EXISTS user_contact_info;
CREATE TABLE user_contact_info (
	contact_id INT(10)	PRIMARY KEY	AUTO_INCREMENT,
    phone_number VARCHAR(12)	NOT NULL,
    address_line_1 VARCHAR(60)	NOT NULL,
    address_line_2 VARCHAR(60)	NOT NULL,
    city VARCHAR(40)	NOT NULL,
    state VARCHAR(2)	NOT NULL,
    zipcode VARCHAR(10)	NOT NULL
);