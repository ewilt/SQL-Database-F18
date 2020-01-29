DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	uid					VARCHAR(9)			PRIMARY KEY		NOT NULL,
    department 			VARCHAR(45) 		NOT NULL,
    office 				VARCHAR(45) 		NOT NULL,
    office_phone_number VARCHAR(45)
);
