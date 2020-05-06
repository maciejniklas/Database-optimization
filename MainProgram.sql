/* TABLES */
CREATE TABLE Address
(
  addressID NUMBER(9) NOT NULL PRIMARY KEY,
  country VARCHAR2(50) NOT NULL,
  town VARCHAR2(75) NOT NULL,
  street VARCHAR2(100) NOT NULL,
  zipCode CHAR(6) NOT NULL,
  CONSTRAINT ZipCodeCheck CHECK (zipCode LIKE '__-___')
);

CREATE TABLE Brewery
(
  breweryID NUMBER(9) NOT NULL PRIMARY KEY,
  addressID NUMBER(9) NOT NULL,
  breweryName VARCHAR2(100) NOT NULL,
  CONSTRAINT BreweryFK FOREIGN KEY (addressID) REFERENCES Address (addressID)
);

CREATE TABLE Employee
(    
  employeeID NUMBER(9) NOT NULL PRIMARY KEY,
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
  beerStyleID NUMBER(9) NOT NULL PRIMARY KEY,
  styleName VARCHAR2(25) NOT NULL,
  standardReferenceMethod NUMBER(2) NOT NULL,
  europeanBreweryConvention NUMBER(2) NOT NULL
);

CREATE TABLE Beer
(
  beerID NUMBER(9) NOT NULL PRIMARY KEY,
  beerStyleID NUMBER(9) NOT NULL,
  beerPrice NUMBER(5, 2) NOT NULL,
  alcoholPercent NUMBER(3, 1) NOT NULL,
  beerAmountInLiters NUMBER(6, 2) NOT NULL,
  CONSTRAINT BeerFK FOREIGN KEY (beerStyleID) REFERENCES BeerStyle (beerStyleID)
);

CREATE TABLE Keg
(
  kegID NUMBER(9) NOT NULL PRIMARY KEY,
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
CREATE SEQUENCE BrewerySEQ START WITH 1;
CREATE SEQUENCE AddressSEQ START WITH 1;
CREATE SEQUENCE EmployeeSEQ START WITH 1;
CREATE SEQUENCE BeerSEQ START WITH 1;
CREATE SEQUENCE BeerStyleSEQ START WITH 1;
CREATE SEQUENCE KegSEQ START WITH 1;

/* TRIGGERS */
CREATE OR REPLACE TRIGGER IndexerBreweryTRIG BEFORE INSERT ON Brewery 
FOR EACH ROW 
BEGIN
  SELECT BrewerySEQ.NEXTVAL INTO :new.breweryID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerAddressTRIG BEFORE INSERT ON Address 
FOR EACH ROW 
BEGIN
  SELECT AddressSEQ.NEXTVAL INTO :new.addressID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerEmployeeTRIG BEFORE INSERT ON Employee 
FOR EACH ROW 
BEGIN
  SELECT EmployeeSEQ.NEXTVAL INTO :new.employeeID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerBeerTRIG BEFORE INSERT ON Beer 
FOR EACH ROW 
BEGIN
  SELECT BeerSEQ.NEXTVAL INTO :new.beerID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerBeerStyleTRIG BEFORE INSERT ON BeerStyle 
FOR EACH ROW 
BEGIN
  SELECT BeerStyleSEQ.NEXTVAL INTO :new.beerStyleID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerKegTRIG BEFORE INSERT ON Keg 
FOR EACH ROW 
BEGIN
  SELECT KegSEQ.NEXTVAL INTO :new.kegID FROM dual;
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

COMMIT;