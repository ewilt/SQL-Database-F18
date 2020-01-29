DROP TABLE IF EXISTS general_directory;
CREATE TABLE general_directory (
    uid VARCHAR(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    directory_id VARCHAR(20) NOT NULL, 
    user_password VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
    contact_id INT(10) NOT NULL,
    emergency_contact_id INT(10) NOT NULL,
    staff VARCHAR(1) NOT NULL,
    student VARCHAR(1) NOT NULL
);
    
    
    