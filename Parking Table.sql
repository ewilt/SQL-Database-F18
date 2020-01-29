DROP TABLE IF EXISTS parking;
CREATE TABLE parking (
	permit_id	VARCHAR(45) PRIMARY KEY	AUTO_INCREMENT,
    uid	VARCHAR(9) NOT NULL	UNIQUE,
    license_plate VARCHAR(8)	NOT NULL,
    vehicle_make VARCHAR(12)	NOT NULL,
    vehicle_model VARCHAR(10)	NOT NULL,
    vehicle_year INT(4)	NOT NULL, 
    lot_permissions VARCHAR(6)	NOT NULL
);
