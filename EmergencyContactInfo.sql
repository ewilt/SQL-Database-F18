DROP TABLE IF EXISTS emergency_contact_info;
CREATE TABLE emergency_contact_info (
	emergency_contact_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    relation VARCHAR(45) NOT NULL
);