DROP TABLE IF EXISTS students;
CREATE TABLE students (
	uid 				VARCHAR(9) 			PRIMARY KEY		NOT NULL,
    credit_hours 		INT 				NOT NULL,
    cumulative_gpa 		FLOAT 				NOT NULL,
    major 				VARCHAR(45) 		NOT NULL,
    minor 				VARCHAR(45),
    residency 			VARCHAR(13) 		NOT NULL,
    dining_plan 		VARCHAR(20)
);
