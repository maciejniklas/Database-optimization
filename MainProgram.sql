/* TABLES */
CREATE TABLE Address
(
  addressID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  country VARCHAR2(50) NOT NULL,
  town VARCHAR2(75) NOT NULL,
  street VARCHAR2(100) NOT NULL,
  zipCode CHAR(6) NOT NULL,
  CONSTRAINT ZipCodeCheck CHECK (zipCode LIKE '__-___')
);

CREATE TABLE Brewery
(
  breweryID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  addressID NUMBER(9) NOT NULL,
  breweryName VARCHAR2(100) NOT NULL,
  CONSTRAINT BreweryFK FOREIGN KEY (addressID) REFERENCES Address (addressID)
);

CREATE TABLE Employee
(    
  employeeID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  addressID NUMBER(9) NOT NULL,
  breweryID NUMBER(9) NOT NULL,
  firstName VARCHAR2(50) NOT NULL,
  lastName VARCHAR2(50) NOT NULL,
  birthDate DATE NOT NULL,
  salary NUMBER(7, 2) NOT NULL,
  CONSTRAINT EmployeeFK1 FOREIGN KEY (breweryID) REFERENCES Brewery (breweryID),
  CONSTRAINT EmployeeFK2 FOREIGN KEY (addressID) REFERENCES Address (addressID)
);

CREATE TABLE BeerStyle
(
  beerStyleID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  styleName VARCHAR2(25) NOT NULL,
  standardReferenceMethod NUMBER(2) NOT NULL,
  europeanBreweryConvention NUMBER(2) NOT NULL
);

CREATE TABLE Beer
(
  beerID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  beerStyleID NUMBER(9) NOT NULL,
  beerPrice NUMBER(5, 2) NOT NULL,
  alcoholPercent NUMBER(3, 1) NOT NULL,
  beerAmountInLiters NUMBER(6, 2) NOT NULL,
  CONSTRAINT BeerFK FOREIGN KEY (beerStyleID) REFERENCES BeerStyle (beerStyleID)
);

CREATE TABLE Keg
(
  kegID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  kegState VARCHAR2(10) NOT NULL,
  kegCapacity NUMBER(2) NOT NULL
);

CREATE TABLE BeerInBreweries
(
  breweryID NUMBER(9) NOT NULL,
  beerID NUMBER(9) NOT NULL,
  CONSTRAINT BeerInBreweriesFK1 FOREIGN KEY (breweryID) REFERENCES Brewery (breweryID) ON DELETE CASCADE,
  CONSTRAINT BeerInBreweriesFK2 FOREIGN KEY (beerID) REFERENCES Beer (beerID) ON DELETE CASCADE
);

CREATE TABLE BeerInKegs
(    
  beerID NUMBER(9) NOT NULL,
  kegID NUMBER(9) NOT NULL,
  CONSTRAINT BeerInKegsFK1 FOREIGN KEY (beerID) REFERENCES Beer (beerID),
  CONSTRAINT BeerInKegsFK2 FOREIGN KEY (kegID) REFERENCES Keg (kegID) ON DELETE CASCADE
);

/* SEQUENCES */
CREATE SEQUENCE AddressSEQ START WITH 1;
CREATE SEQUENCE BrewerySEQ START WITH 1;

/* TRIGGERS */
CREATE OR REPLACE TRIGGER BreweryTRIG BEFORE INSERT ON Brewery 
FOR EACH ROW 
BEGIN
  SELECT AddressSEQ.nextval INTO :new.addressID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER EmployeeTRIG BEFORE INSERT ON Employee 
FOR EACH ROW 
BEGIN
  SELECT AddressSEQ.nextval INTO :new.addressID FROM dual;  
  
  IF MOD(AddressSEQ.currval, 10) = 1 THEN
    SELECT BrewerySEQ.nextval INTO :new.breweryID FROM dual;
  ElSE
    SELECT BrewerySEQ.currval INTO :new.breweryID FROM dual;    
  END IF;
END;
/

/* FILL DATABASE */
@D:\Repositories\DatabaseOptimization\GenerateAddressTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateBreweryTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateEmployeeTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateBeerStyleTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateBeerTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateKegTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateBeerInBreweriesTable.sql;
@D:\Repositories\DatabaseOptimization\GenerateBeerInKegsTable.sql;

/* DROP DATA NECESSARY ONLY FOR DATABASE FILL */
DROP SEQUENCE AddressSEQ;
DROP SEQUENCE BrewerySEQ;
DROP TRIGGER BreweryTRIG;
DROP TRIGGER EmployeeTRIG;