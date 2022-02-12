CREATE TABLE brands(
	brand_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	brand_name VARCHAR2(50) NOT NULL,
	PRIMARY KEY(brand_id)
);

CREATE TABLE cars (
	car_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	car_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	PRIMARY KEY(car_id),
	FOREIGN KEY(brand_id) 
	REFERENCES brands(brand_id) ON DELETE CASCADE
);

INSERT INTO brands(brand_name)VALUES('Audi');
INSERT INTO brands(brand_name)VALUES('BMW');
INSERT INTO brands(brand_name)VALUES('Ford');
INSERT INTO brands(brand_name)VALUES('Honda');
INSERT INTO brands(brand_name)VALUES('Toyota');


INSERT INTO cars (car_name,brand_id) VALUES ('Audi R8 Coupe',1);
INSERT INTO cars (car_name,brand_id) VALUES ('Audi Q2',1);
INSERT INTO cars (car_name,brand_id) VALUES ('Audi S1',1);
INSERT INTO cars (car_name,brand_id) VALUES ('BMW 2-serie Cabrio',2);
INSERT INTO cars (car_name,brand_id) VALUES ('BMW i8',2);
INSERT INTO cars (car_name,brand_id) VALUES ('Ford Edge',3);
INSERT INTO cars (car_name,brand_id) VALUES ('Ford Mustang Fastback',3);
INSERT INTO cars (car_name,brand_id) VALUES ('Honda S2000',4);
INSERT INTO cars (car_name,brand_id) VALUES ('Honda Legend',4);
INSERT INTO cars (car_name,brand_id) VALUES ('Toyota GT86',5);
INSERT INTO cars (car_name,brand_id) VALUES ('Toyota C-HR',5);

--The following statement creates audi_cars view that returns only Audi cars:
CREATE
    VIEW audi_cars AS SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 1;
        
--The following query returns the data from the audi_cars view:
SELECT
    *
FROM
    audi_cars;
    
--The audi_cars is an updatable view so you can insert a new row into the cars table through it:
INSERT
    INTO
        audi_cars(
            car_name,
            brand_id
        )
    VALUES(
        'BMW Z3 coupe',
        2
    ); 
    
--the visible rows in the view invisible by updating the data in the underlying base table through the view as shown in the following example:

UPDATE
    audi_cars
SET
    car_name = 'BMW 1-serie Coupe',
    brand_id = 2
WHERE
    car_id = 3;
    
SELECT
    *
FROM
    audi_cars;
--Let’s create another updatable view named ford_cars that has the WITH CHECK OPTION clause:

CREATE
    VIEW ford_cars AS SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 3 WITH CHECK OPTION;
        
--following statement inserts an Audi car into the cars table through the ford_cars view:
--which gives error : Because the INSERT statement attempted to insert a row that causes a view WITH CHECK OPTION where-clause violation
INSERT
    INTO
        ford_cars(
            car_name,
            brand_id
        )
    VALUES(
        'Audi RS6 Avant',
        1
    );
    
--Similarly, the following UPDATE statement also fails to update because of the where-clause violation.

UPDATE
    ford_cars
SET
    brand_id = 4,
    car_name = 'Honda NSX'
WHERE
    car_id = 6;