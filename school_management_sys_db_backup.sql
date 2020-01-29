/************************************************************
 This script creates the database named school_managemnt_sys 
 and is the final project for INST327.
 
 Team Members: Emily Wilt, Amani Desormeaux, Nick Underwood, 
 Harrision Kang, Hayden Smedley
************************************************************/

DROP DATABASE IF EXISTS school_management_sys;
CREATE DATABASE school_management_sys;
USE school_management_sys;

-- create the tables for the database

-- user contact info table
DROP TABLE IF EXISTS user_contact_info;
CREATE TABLE user_contact_info (
	contact_id INT(10)	PRIMARY KEY	AUTO_INCREMENT,
    phone_number VARCHAR(12)	NOT NULL,
    address_line_1 VARCHAR(60)	NOT NULL,
    address_line_2 VARCHAR(60),
    city VARCHAR(40)	NOT NULL,
    state VARCHAR(2)	NOT NULL,
    zipcode VARCHAR(10)	NOT NULL
);

-- emergency contact info table
DROP TABLE IF EXISTS emergency_contact_info;
CREATE TABLE emergency_contact_info (
	emergency_contact_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    phone_number VARCHAR(12) NOT NULL,
    relation VARCHAR(45) NOT NULL
);


-- general directory table
DROP TABLE IF EXISTS general_directory;
CREATE TABLE general_directory (
    uid VARCHAR(9) NOT NULL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    directory_id VARCHAR(20) NOT NULL, 
    user_password VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
    contact_id INT(10) NOT NULL,
    emergency_contact_id INT(10) NOT NULL,
    staff VARCHAR(1) NOT NULL,
    student VARCHAR(1) NOT NULL,
    CONSTRAINT general_directory_fk_user_contact_info             # establishes foreign key - contact_id
		FOREIGN KEY (contact_id)
        REFERENCES user_contact_info(contact_id),
	CONSTRAINT general_directory_fk_emergency_contact_info        # establishes foreign key - emergency_contact_id
		FOREIGN KEY (emergency_contact_id)
        REFERENCES emergency_contact_info(emergency_contact_id)
);

-- department table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	department_name VARCHAR(90) PRIMARY KEY,
	ad_office_building VARCHAR(45),
	ad_office_phone VARCHAR(12),
	ad_office_address VARCHAR(45),
	ad_office_email VARCHAR(45)
);

-- staff table
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	uid					VARCHAR(9)			NOT NULL,
    department 			VARCHAR(90) 		NOT NULL,
    office 				VARCHAR(45) 		NOT NULL,
    office_phone_number VARCHAR(45),
    CONSTRAINT staff_fk_general_directory
		FOREIGN KEY (uid)
        REFERENCES general_directory(uid),
	CONSTRAINT staff_fk_departments
		FOREIGN KEY (department)
		REFERENCES departments(department_name)
);

-- dining table
DROP TABLE IF EXISTS dining;
CREATE TABLE dining (
	plan_name VARCHAR(20) PRIMARY KEY,
    dining_dollars INT,
    guest_passes INT,
    total_cost INT
);

-- major table
DROP TABLE IF EXISTS majors;
CREATE TABLE majors (
	major_name VARCHAR(45) PRIMARY KEY,
    department VARCHAR(90),
    lep VARCHAR(3),
    CONSTRAINT major_fk_departments              # establishes department name as foreign key
		FOREIGN KEY (department)
        REFERENCES departments(department_name)
);

-- students table
DROP TABLE IF EXISTS students;
CREATE TABLE students (
	uid 				VARCHAR(9) 			NOT NULL,
    credit_hours 		INT 				NOT NULL,
    cumulative_gpa 		FLOAT 				NOT NULL,
    major 				VARCHAR(45) 		NOT NULL,
    residency 			VARCHAR(13) 		NOT NULL,
    dining_plan 		VARCHAR(20),
    CONSTRAINT students_fk_general_directory
		FOREIGN KEY (uid)
        REFERENCES general_directory(uid),
    CONSTRAINT students_fk_dining
		FOREIGN KEY (dining_plan)
        REFERENCES dining(plan_name),
	CONSTRAINT students_fk_majors
		FOREIGN KEY (major)
        REFERENCES majors(major_name)
);

-- courses table
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
	course_id VARCHAR(7),
	course_name VARCHAR(80),
	department VARCHAR(45),
    CONSTRAINT courses_fk_departments           # establishes department name as foreign key
		FOREIGN KEY (department)
        REFERENCES departments(department_name)
);

-- parking table
DROP TABLE IF EXISTS parking;
CREATE TABLE parking (
	permit_id	VARCHAR(45) PRIMARY KEY,
    uid	VARCHAR(9) NOT NULL	UNIQUE,
    license_plate VARCHAR(8)	NOT NULL,
    vehicle_make VARCHAR(12)	NOT NULL,
    vehicle_model VARCHAR(10)	NOT NULL,
    vehicle_year INT(4)	NOT NULL, 
    lot_permissions VARCHAR(6)	NOT NULL,
    CONSTRAINT parking_fk_general_directory
		FOREIGN KEY (uid)
        REFERENCES general_directory(uid)
);

-- INSERT DATA INTO TABLES --

-- dining table
INSERT INTO dining 
	(plan_name, dining_dollars, guest_passes, total_cost)
VALUES
	('Premium', 400, 8, 5384),   
	('Prefered', 300, 6, 5282),
    ('Base Plus', 200, 4, 5064),
    ('Base', 0, 2, 4704);

-- user contact table 
USE school_management_sys;

INSERT INTO user_contact_info 
	(contact_id, phone_number, address_line_1, address_line_2, city, state, zipcode) 
VALUES
	(1, '732-785-4632', '140 Gulf St.', 'Unit 5', 'Perth Amboy', 'NJ', '08861'),
	(2, '410-653-7625', '292 Border St.', '', 'Elkridge', 'MD', '21075'),
	(3, '508-846-0639', '933 Sunbeam Dr.', '', 'New Bedford', 'MA', '02740'),
	(4, '517-364-9285', '776 Tunnel Lane', '', 'East Lansing', 'MI', '48823'),
	(5, '930-614-9240', '23 East Bayberry Lane', '', 'Evansville', 'IN', '47711'),
	(6, '781-528-6390', '653 Arch St.', '', 'Malden', 'MA', '02148'),
	(7, '717-529-0044', '455 E. Edgefield Ave.', '', 'Elizabethtown', 'PA', '17022'),
	(8, '561-218-8336', '7503 Railroad St.', '', 'Palm Beach Gardens' , 'FL', '33410'),
	(9, '301-628-6639', '7076 NE. Carson Lane', '', 'Chevy Chase', 'MD', '20815'),
	(10, '959-210-7992', '55 Shirley Rd.', '', 'Newington', 'CT', '06111'),
	(11, '847-218-1622', '214 Trusel Ave.', '', 'Gurnee', 'IL', '60031'),
	(12, '810-231-0386', '91 Heritage Ave.', '', 'Fenton', 'MI', '48430'),
	(13, '574-392-0421', '7851 Orange St.', '', 'Goshen', 'IN', '46526'),
	(14, '909-402-9104', '63 Briarwood St.', '', 'Upland', 'CA', '91784'),
	(15, '762-844-9103', '9315 Lawrence Dr.', '', 'Dalton', 'GA', '30721'),
	(16, '516-229-0475', '7987 Longbranch St.', '', 'New Hyde Park', 'NY', '11040'),
	(17, '815-824-0338', '803 Schoolhouse Dr.', '', 'Romeoville', 'IL', '60446'),
	(18, '703-322-8467', '9448 Poor House St.', '', 'Falls Church', 'VA', '22041'),
	(19, '803-729-8811', '817 West Roberts St.', '', 'Rock Hill', 'SC', '29730'),
	(20, '727-838-9942', '10 West Market St.', '', 'Palm Harbor', 'FL', '34683'),
	(21, '920-884-0264', '8691 Birch Hill St.', '', 'Menasha', 'WI', '54952'),
	(22, '734-112-3821', '653 Lakeshore Dr.', '', 'Romulus', 'MI', '48174'),
	(23, '320-846-0223', '8912 W. Bayberry St.', '', 'Saint Cloud', 'MN', '56301'),
	(24, '352-990-3345', '536 Essx St.', '', 'Leesburg', 'VA', '20175'),
	(25, '315-121-4376', '9830 Manor Station Ave.', '', 'Rome', 'NY', '13440');

-- emergency contact table 
USE school_management_sys;

INSERT INTO emergency_contact_info
	(emergency_contact_id, phone_number, first_name, last_name, relation)
VALUES 
	(1,'503-928-1717','Max','Siller','Father'),
	(2,'980-487-1928','Noel','Higgins','Sister'),
	(3,'201-987-1098','Madison','Carlson','Mother'),
	(4,'738-982-1234','Leo','Spada','Brother'),
	(5,'867-293-7651','Trent','Anderson','Father'),
	(6,'678-203-8907','Colby','Pellow','Father'),
	(7,'873-221-9392','Sarah','Rosebrook','Mother'),
	(8,'302-980-3480','Tari','Liu','Mother'),
	(9,'898-200-2991','Kandice','Daw','Aunt'),
	(10,'345-907-0075','Tommy','Adams','Brother'),
	(11,'541-099-3328','Danny','Oyama','Uncle'),
	(12,'984-998-3456','Frank','Wood','Father'),
	(13,'237-842-0098','Robert','Smith','Father'),
	(14,'812,765,8365','Cece','Heinrich','Sister'),
	(15,'382-399-9008','Charlie','Cleland','Uncle'),
	(16,'776-348-0724','Brittney','Kern','Aunt'),
	(17,'456-980-2618','Sam','Turner','Father'),
	(18,'903-715-2937','Antione','Moore','Father'),
	(19,'678-211-9920','Ciara','Waters','Mother'),
	(20,'556-789-0086','Sandra','Campbell','Mother'),
	(21, '703-322-8467', 'Louis', 'Griffin', 'Mother'),
	(22, '221-483-0578', 'Nina', 'Gadura', 'Sister'),
	(23, '723-034-9211', 'Sabrina', 'Duckett', 'Mother'),
	(24, '410-723-8845', 'Mira', 'Thompson', 'Mother'),
	(25, '557-211-3664', 'Tom', 'Karonovich', 'Brother');

-- general directory table 
USE school_management_sys; 

INSERT INTO general_directory 
	(uid, first_name, last_name, directory_id, user_password, email, contact_id, emergency_contact_id, staff, student) 
VALUES
	(113928467, 'Mandawuy', 'Apolinary', 'mapoli', 'bJEmHV2t', 'mapoli@umd.edu', 5, 4, 'N', 'Y'),
	(113928468, 'Kira', 'Iris', 'kiris3', '4g4ePzdt', 'kiris3@umd.edu', 10, 9, 'N', 'Y'),
	(113928469, 'Kelemen', 'Erastos', 'keras', 'e7b2MDMr', 'keras@umd.edu', 1, 3, 'Y', 'N'),
	(113928470, 'Christine', 'Konstantine', 'chriskons', 'zz2AcM9r', 'chriskons@umd.edu', 17, 18, 'N', 'Y'),
	(113928471, 'Dylan', 'Gervasio', 'dylvasio', '8r6wdSSJ', 'dylvasio@umd.edu', 6,  10, 'N', 'Y'),
	(113928472, 'Sophie', 'Gervasio', 'sophieger', 'Drk25sc2', 'sophieger@umd.edu', 6, 10, 'N', 'Y'),
	(114867320, 'Elisabeth', 'Soukum', 'esoukum', 'JzpU2DBY', 'esoukum@umd.edu', 16, 2, 'Y', 'N'),
	(114867321, 'Leo', 'Joel', 'leoj4', 'StrjqnnL', 'leoj4@umd.edu', 19, 1, 'Y', 'N'),
	(114867322, 'Emma', 'Suibhne', 'esuinh', 'Q8yrjbuw', 'esuinh@umd.edu', 4, 6, 'N', 'Y'),
	(114867323, 'Millaray', 'Leonie', 'mileonie', 'CBE5BUEj', 'mileonie@umd.edu', 2, 9, 'N', 'Y'),
	(114867324, 'Chloe', 'Assumpta', 'chlassum', 'EFSANdv3', 'chlassum@umd.edu', 11, 12, 'N', 'Y'),
	(114867325, 'Cherri', 'Lyuba', 'cherril7', 'MVjv3Lv6', 'cherril7@umd.edu', 15, 8, 'N', 'Y'),
	(114867326, 'Timothy', 'Database Design', 'Richards', '4LxRnRbj', 'timothyr@umd.edu', 15, 8, 'Y', 'N'),
	(114867327, 'Bernhard', 'Giland', 'berngil', 'XYdGwCeK', 'berngil@umd.edu', 9, 5, 'Y', 'Y'),
	(114867328, 'Deryn', 'Laverne', 'dlaver', 'Qxuxx9uF', 'dlaver@umd.edu', 13, 13, 'N', 'Y'),
	(114867329, 'Neha', 'Dieuwert', 'nehadie', 'yYdrZnBx', 'nehadie@umd.edu', 18, 17, 'N', 'Y'),
	(114867330, 'Lucas', 'Mayeso', 'lumayo', 'hwtgtuDn', 'lumayo@umd.edu', 20, 4, 'Y', 'Y'),
	(115920450, 'Alexander', 'Teodoro', 'alexteo', 'RTqv3mxx', 'alexteo@umd.edu', 7, 7, 'N', 'Y'),
	(115920451, 'Philip', 'Hiro', 'phiro', 'jkLesWEf', 'phiro@umd.edu', 8, 11, 'Y', 'N'),
	(115920452, 'Senta', 'Heracle', 'sentahera', 'SNqfHLp5', 'sentahera@umd.edu', 10, 16, 'Y', 'N'),
	(115920453, 'Sawney', 'Quintella', 'sawqui', 'CCQATac4', 'sawqui@umd.edu', 12, 14, 'N', 'Y'),
	(115920454, 'Peter', 'Griffin', 'pgriff', 'UGddwwHn', 'pgriff@umd.edu', 18, 20, 'Y', 'N'),
	(115920455, 'Louis', 'Griffin', 'lougriff', 'ZnJhaqTP', 'lougriff@umd.edu', 18, 20, 'Y', 'Y'),
	(115920456, 'Chris', 'Griffin', 'chrisgriffin', '9uVdudTx', 'chrisgriffin@umd.edu', 18, 21, 'N', 'Y'),
	(115920457, 'Stewie', 'Griffin', 'stgriff', 'QuazjbxH', 'stgriff@umd.edu', 18, 21, 'N', 'Y'),
	(115920458, 'Megatron', 'Griffin', 'meggriffin', '2hwcHshX', 'meggriffin@umd.edu', 18, 21, 'N', 'Y'),
	(115920459, 'Lucas', 'Crofton', 'lucrof', 'GfvpgLj9', 'lucrof@umd.edu', 25, 11, 'Y', 'N'),
	(115920460, 'Seyeon', 'Kim', 'seykim', '4fCswCQf', 'seykim@umd.edu', 16, 5, 'Y', 'N'),
	(115920461, 'Payal', 'Gadura', 'pgadura', 'BXDMXEx9', 'pgadura@umd.edu', 22, 22, 'Y', 'N'),
	(115920462, 'Lauren', 'Bernardo', 'laurbern', 'Jwv8bTxE', 'laurbern@umd.edu', 17, 10, 'Y', 'Y'),
	(115920463, 'Amanda', 'Duckett', 'aduck2', 'F5GKCYmP', 'aduck2@umd.edu', 23, 23, 'N', 'Y'),
	(115920464, 'Mackenzie', 'Thompson', 'mackthom', 'sJurMKyC', 'mackthom@umd.edu', 23,  24, 'Y', 'N'),
	(116578231, 'Rosa', 'Branim', 'rbranim', 'wyUg5N33', 'rbranim@umd.edu', 2, 15, 'N', 'Y'),
	(116578232, 'Timothy', 'Arden', 'timarden', 'GVuGgnTv', 'timarden', 5, 13, 'Y', 'N'),
	(116578233, 'Robert', 'Karonovich', 'bobbyk4', 'tTsSN6fs','bobbyk4@umd.edu', 9, 25, 'Y', 'Y'),
	(116578234, 'Debbie', 'Karonovich', 'debbkar', 'YKzZ35Lu', 'debbkar@umd.edu', 9, 19, 'Y', 'N'),
	(116578235, 'Raven', 'Jackson', 'ravjack', 'GVAPGrLh', 'ravjack@umd.edu', 24, 6, 'N', 'Y');


-- departments table
USE school_management_sys;

INSERT INTO departments
	(department_name, ad_office_building, ad_office_phone, ad_office_address, ad_office_email)
VALUES
	('Information Science', 'Hornbake Library', '301-405-2038', '4130 Campus Drive', 'InfoSci@umd.edu'),
    ('Department of Communication', 'Skinner Building', '301-405-6519', '4300 Chapel Drive', 'commadvising@umd.edu'),
    ('Department of Psychology', 'Biology-Psychology Building', '301-405-5862', '4094 Campus Drive', 'psycadvising@umd.edu'),
    ('English Department', 'Tawes Hall', '301-405-3809', '2119 Alumni Dr', NULL),
    ('Department of Mathematics', 'William E. Kirwan Hall', '301-405-5047','4176 Campus Dr',NULL),
    ('Department of Computer, Mathematical and Natural Sciences', 'Symons Hall', '301-405-2080','7998 Regents Drive', 'cmnsque@umd.edu'),
    ('School of Engineering', 'Mitchell Building', '301-314-8377', '7999 Regents Drive', NULL),
    ('Department of Behavioral and Social Sciences', 'Tydings Hall', '301-405-1697', '7343 Preinkert Drive', NULL),
    ('School of Business', 'Van Munching Hall', '301-405-2286', '7699 Mowatt Lane', 'undergradinfo@rhsmith.umd.edu'),
    ('School of Public Health', 'School of Public Health Building', '301-405-2545', '4200 Valley Drive', 'jloliver@umd.edu'),
    ('Department of Astronomy','Physical Sciences Complex','301-405-3001','4296 Stadium Drive', NULL),
	('Department of Sociology','Parren Mitchell Art-Sociology Building','301-405-6392', '3834 Campus Drive', NULL),
	('Department of Animal and Avian Sciences','Agricultural Engineering/Animal Science Bldg','301-405-1366','8127 Regents Drive','ansc-chair@umd.edu'),
    ('Biology Department','Biology-Psychology Building', '301-405-6884','4094 Campus Drive','biol-help@umd.edu'),
	('Department of Criminology and Criminal Justice','Samuel J. LeFrak Hall','301-405-4699','7251 Preinkert Drive','ccjs-admin@umd.edu'),
    ('Geology Department','Geology Building','301-405-4082','8000 Regents Dr.','geology@umd.edu');


-- staff table 
USE school_management_sys;

INSERT INTO staff
	(uid, department, office, office_phone_number)
VALUES
	(113928469, 'Department of Mathematics', 'MATH 0220', '301-676-8903'),
	(114867320, 'School of Public Health', 'SPH 0314', '301-288-4740'),
	(114867321, 'English Department', 'TWS 2230', '301-405-3809' ),
	(114867326, 'Information Science', 'HBK 4121', '301-305-1246'),
	(114867327, 'Department of Psychology', 'BPS 3094', '301-676-8381'),
	(114867330, 'Department of Sociology', 'ASY 4036', '301-977-4325'),
	(115920451, 'School of Business', 'VMH 2012', '301-456-3940'),
	(115920452, 'Geology Department', 'GEO 3004', '301-452-6748'),
	(115920454, 'Department of Sociology', 'SKN 0212', '301-556-6793'),
	(115920455, 'School of Engineering', 'KEB 0345', '301-253-0083'),
	(115920459, 'Department of Criminology and Criminal Justice', 'LEF 0197', '301-012-8374'),
	(115920460, 'English Department', 'TWS 2229', '301-234-0294'),
	(115920461, 'Biology Department', 'BPS 3095', '301-928-0030'),
	(115920462, 'School of Business', 'VMH 2008', '301-243-5768'),
	(115920464, 'Department of Behavioral and Social Sciences', 'TYD 2202', '301-687-3221'),
	(116578232, 'Department of Communication', 'SKN 0216', '301-124-3421'),
	(116578233, 'School of Engineering', 'KEB 0356', '301-224-1998'),
	(116578234, 'School of Public Health', 'SPH 0315', '301-476-9920');


-- majors table
USE school_management_sys;

INSERT INTO majors
	(major_name, department, lep)
VALUES
	('Information Science', 'Information Science', 'No'),
    ('Computer Science', 'Department of Computer, Mathematical and Natural Sciences', 'Yes'),
    ('Biological Sciences', 'Department of Computer, Mathematical and Natural Sciences', 'Yes'),
 	('Atmospheric and Ocean Science', 'Department of Computer, Mathematical and Natural Sciences', 'No'),   
	('Chemistry','Department of Computer, Mathematical and Natural Sciences', 'No'),
    ('Accounting', 'School of Business', 'Yes'),
    ('Business Administration and Management', 'School of Business', 'Yes'),
	('Information Systems', 'School of Business', 'Yes'),
    ('Finance', 'School of Business', 'No'),
    ('Kinesiology', 'School of Public Health', 'No'),
    ('Public Health Science', 'School of Public Health', 'No'),
    ('Mechanical Engineering', 'School of Engineering', 'Yes'),
    ('Economics', 'Department of Behavioral and Social Sciences', 'No'),
    ('Government and Politics', 'Department of Behavioral and Social Sciences', 'Yes'),
    ('Psychology', 'Department of Psychology', 'Yes');

-- courses table
USE school_management_sys;

INSERT INTO courses
	(course_id, course_name, department)
VALUES
	('INST201', 'Introduction to Information Science', 'Information Science'),
    ('INST311', 'Information Organization', 'Information Science'),
    ('INST314', 'Statistics for Information Science', 'Information Science'),
    ('INST326', 'Object-Oriented Programming Information Science', 'Information Science'),
    ('INST327', 'Database Design and Modeling', 'Information Science'),
    ('INST335', 'Teams and Organizations', 'Information Science'),
    ('INST346', 'Technologies, Information, and Architecture', 'Information Science'),
    ('INST352', 'Information User Needs and Assessment', 'Information Science'),
    ('INST354', 'Decision-Making for Information Science', 'Information Science'),
    ('INST362', 'User-Centered Design', 'Information Science'),
    ('INST377', 'Dynamic Web Applications', 'Information Science'),
    ('INST414', 'Advanced Data Science', 'Information Science'),
    ('INST447', 'Data Sources and Manipulation', 'Information Science'),
    ('INST462', 'Introduction to Data Visualization', 'Information Science'),
    ('INST490', 'Integrative Capstone', 'Information Science'),
	('ENGL101', 'Academic Writing', 'English Department'),
    ('STAT100', 'Elementary Statistics and Probability', 'Department of Mathematics'),
    ('PSYC100', 'Introduction to Psychology', 'Department of Psychology'),
    ('COMM107', 'Oral Communication: Principles and Practices', 'Department of Communication');
   
-- parking table 
USE school_management_sys;

INSERT INTO parking
	(permit_id, uid, license_plate, vehicle_make, vehicle_model, vehicle_year, lot_permissions)
VALUES
	('C96384', 114867322, 'M484957', 'Subaru', 'Sedan', '2017', '6'),
    ('W479A8', 113928471, '36DW851', 'Ford', 'Sedan', '1999', '1'),
    ('6CHK13', 114867326, 'CCM2189', 'Ford', 'SUV', '2003', 'A'),
    ('2W8A6B', 113928469, 'ML3211R', 'Saturn', 'Sedan', '2013', 'W1'),
    ('G546K2', 114867329, 'Q546Z8I', 'Honda', 'Sedan', '2010', '1'),
    ('O7K643', 115920450, 'DCM1173', 'Nissan', 'Truck', '2008', '1'),
    ('12S986', 116578234, 'T3MV956', 'Chevrolet', 'Sedan', '2017', 'Y'),
    ('3W8461', 115920456, '12K4W33', 'GMC', 'Truck', '2007', '4b'),
    ('2K4WH9', 115920458, '29YAB9S', 'Mercury', 'SUV', '2014', '4b'),
    ('C6H77Q', 115920462, '66Q53I7', 'Chevrolet', 'Truck', '2016', '1'),
    ('9MQR71', 115920460, '430STAR', 'Nissan', 'Sedan', '2009', 'UU'),
    ('D389QG', 116578231, 'MZW0903', 'Chevrolet', 'SUV', '2015', '9b'),
    ('8EG37W', 116578233, 'HKC94GW', 'GMC', 'SUV', '2015', 'RR'),
    ('IG4321', 115920452, 'J96CWS7', 'Ford', 'Truck', '2004', 'EE'),
    ('W764HB', 116578235, '1567LL9', 'Ford', 'Sedan', '2006', '1');




-- students table 
USE school_management_sys; 

INSERT INTO students 
	(uid, credit_hours, cumulative_gpa, major, residency, dining_plan) 
VALUES
	(113928467, 15, 3.4, 'Biological Sciences', 'Out-of-State', 'Prefered'),
	(113928468, 16, 2.8, 'Finance', 'Out-of-State', 'Base Plus'),
	(113928470, 12, 3.1, 'Computer Science', 'Out-of-State', 'Prefered'),
	(113928471, 12, 3.7, 'Kinesiology', 'Out-of-State', 'Prefered'),
	(113928472, 13, 3.2, 'Biological Sciences', 'Out-of-State', 'Prefered'),
	(114867322, 15, 3.1, 'Information Science', 'Out-of-State', 'Base'),
	(114867323, 16, 2.7, 'Government and Politics', 'In-State', 'Premium'),
	(114867324, 15, 3.6, 'Psychology', 'Out-of-State', 'Base'),
	(114867325, 16, 2.2, 'Public Health Science', 'Out-of-State', 'Premium'),
	(114867327, 6, 3.8, 'Economics', 'In-State', NULL),
	(114867328, 14, 3.1, 'Information Systems', 'Out-of-State', 'Base Plus'),
	(114867329, 15, 2.6, 'Atmospheric and Ocean Science', 'Out-of-State', NULL),
	(114867330, 17, 3.9, 'Chemistry', 'Out-of-State', NULL),
	(115920450, 12, 1.8, 'Business Administration and Management', 'Out-of-State', 'Prefered'),
	(115920451, 15, 3.3, 'Chemistry', 'Out-of-State', 'Base Plus'),
	(115920453, 14, 3.7, 'Computer Science', 'Out-of-State', 'Base'),
	(115920455, 4, 4.0, 'Accounting', 'Out-of-State', NULL),
	(115920456, 13, 2.7, 'Economics', 'Out-of-State', 'Premium'),
	(115920457, 15, 3.7, 'Mechanical Engineering', 'Out-of-State', 'Premium'),
	(115920458, 16, 3.0, 'Information Systems', 'Out-of-State', 'Premium'),
	(115920462, 6, 3.5, 'Computer Science', 'Out-of-State', NULL),
	(115920463, 16, 3.6, 'Economics', 'Out-of-State', 'Prefered'),
	(116578231, 14, 3.3, 'Information Science', 'Out-of-State', 'Prefered'),
	(116578233, 4, 3.7, 'Business Administration and Management', 'In-State', NULL),
	(116578235, 16, 3.9, 'Information Science', 'Out-of-State', 'Premium');


-- CREATING VIEWS --
/*View 1*/
/*Counts the number of enrolled students by department and calculates the average gpa for that department*/
DROP VIEW IF EXISTS department_students;
CREATE VIEW department_students AS
SELECT department, COUNT(uid) AS enrolled_students, ROUND(AVG(cumulative_gpa), 2) AS average_gpa
FROM students JOIN majors
	ON students.major = majors.major_name
GROUP BY department;

/*View 2*/
/*Creates a student contact table*/
DROP VIEW IF EXISTS student_contact;
CREATE VIEW student_contact AS
SELECT CONCAT(last_name, ', ', first_name) AS name, uid, phone_number, CONCAT(address_line_1, address_line_2, ', ', city, ', ', state, ' ', zipcode) AS address
FROM general_directory JOIN user_contact_info
	ON general_directory.contact_id = user_contact_info.contact_id
WHERE general_directory.student = 'Y';

/*View 3*/
/*Counts the number of students and staff from each state at the university*/
DROP VIEW IF EXISTS number_by_state;
CREATE VIEW number_by_state AS
SELECT state, COUNT(uid) AS total_number
FROM user_contact_info JOIN general_directory
	ON user_contact_info.contact_id = general_directory.contact_id
GROUP BY state;

/*View 4*/
/*Returns students with a gpa higher than the average gpa*/
DROP VIEW IF EXISTS gpa_above_average;
CREATE VIEW gpa_above_average AS
SELECT students.uid AS uid, CONCAT(last_name, ', ', first_name) AS full_name, cumulative_gpa AS cumulative_gpa
    FROM students JOIN general_directory ON students.uid = general_directory.uid
    WHERE cumulative_gpa > (SELECT 
                AVG(cumulative_gpa)
            FROM students)
    ORDER BY full_name;

/*View 5*/
/*Returns who is allowed to park in lot 1*/
DROP VIEW IF EXISTS lot_1_permission;
CREATE VIEW lot_1_permission AS
SELECT general_directory.uid, CONCAT(last_name, ', ', first_name) AS full_name, permit_id, license_plate
FROM general_directory JOIN parking
	ON parking.uid = general_directory.uid
WHERE parking.lot_permissions = '1'
ORDER BY last_name;