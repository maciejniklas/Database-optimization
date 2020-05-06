/* TEMP TABLES */
CREATE TABLE TempCountry
(
  tempID NUMBER(9) NOT NULL PRIMARY KEY,
  tempValue VARCHAR2(100) NOT NULL
);

CREATE TABLE TempTown
(
  tempID NUMBER(9) NOT NULL PRIMARY KEY,
  tempValue VARCHAR2(100) NOT NULL
);

CREATE TABLE TempStreet
(
  tempID NUMBER(9) NOT NULL PRIMARY KEY,
  tempValue VARCHAR2(100) NOT NULL
);

/* SEQUENCES */
CREATE SEQUENCE TempCountrySEQ START WITH 1;
CREATE SEQUENCE TempTownSEQ START WITH 1;
CREATE SEQUENCE TempStreetSEQ START WITH 1;

/* TRIGGERS */
CREATE OR REPLACE TRIGGER IndexerTempCountryTRIG BEFORE INSERT ON TempCountry 
FOR EACH ROW 
BEGIN
  SELECT TempCountrySEQ.NEXTVAL INTO :new.tempID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerTempTownTRIG BEFORE INSERT ON TempTown 
FOR EACH ROW 
BEGIN
  SELECT TempTownSEQ.NEXTVAL INTO :new.tempID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER IndexerTempStreetTRIG BEFORE INSERT ON TempStreet 
FOR EACH ROW 
BEGIN
  SELECT TempStreetSEQ.NEXTVAL INTO :new.tempID FROM dual;
END;
/

/* TEMPORARY DATA INSERTION FOR RANDOM REAL DATA GENERATION */
INSERT INTO TempCountry(tempValue) VALUES ('Nianemark');
INSERT INTO TempCountry(tempValue) VALUES ('Tarucookmo');
INSERT INTO TempCountry(tempValue) VALUES ('Honengmal');

INSERT INTO TempTown(tempValue) VALUES ('New Franew');
INSERT INTO TempTown(tempValue) VALUES ('Kurfham');
INSERT INTO TempTown(tempValue) VALUES ('Terresnod');
INSERT INTO TempTown(tempValue) VALUES ('Saint Richall');
INSERT INTO TempTown(tempValue) VALUES ('West Twhist');
INSERT INTO TempTown(tempValue) VALUES ('Red Ranrell');
INSERT INTO TempTown(tempValue) VALUES ('Landington');
INSERT INTO TempTown(tempValue) VALUES ('Linsristown');
INSERT INTO TempTown(tempValue) VALUES ('Red Crosshithewelsh');
INSERT INTO TempTown(tempValue) VALUES ('Stonesumxan');
INSERT INTO TempTown(tempValue) VALUES ('Sauing');
INSERT INTO TempTown(tempValue) VALUES ('Red Thampnel');
INSERT INTO TempTown(tempValue) VALUES ('Alrslem Creek');
INSERT INTO TempTown(tempValue) VALUES ('Grand Gibsall');
INSERT INTO TempTown(tempValue) VALUES ('Port Sodlon');
INSERT INTO TempTown(tempValue) VALUES ('Co');
INSERT INTO TempTown(tempValue) VALUES ('Stokeweland');
INSERT INTO TempTown(tempValue) VALUES ('North Mauwich-In-Surwal');
INSERT INTO TempTown(tempValue) VALUES ('East Tombbid Du Chucolne');
INSERT INTO TempTown(tempValue) VALUES ('Hocourtney River');
INSERT INTO TempTown(tempValue) VALUES ('La Tegoolhav');
INSERT INTO TempTown(tempValue) VALUES ('Mount Landcotes Du Thamsprings');
INSERT INTO TempTown(tempValue) VALUES ('North Bilpeltod');
INSERT INTO TempTown(tempValue) VALUES ('Saint Wkerneread Upon Dealpat');
INSERT INTO TempTown(tempValue) VALUES ('Dgelia With Knareswai');
INSERT INTO TempTown(tempValue) VALUES ('North Rdermal');
INSERT INTO TempTown(tempValue) VALUES ('Dclay');
INSERT INTO TempTown(tempValue) VALUES ('La Basbo');
INSERT INTO TempTown(tempValue) VALUES ('Feagisland');
INSERT INTO TempTown(tempValue) VALUES ('Langdy Heights');
INSERT INTO TempTown(tempValue) VALUES ('Port Cokemed-In-Wilday');
INSERT INTO TempTown(tempValue) VALUES ('Port Vycold');
INSERT INTO TempTown(tempValue) VALUES ('Yustown-In-Stroudzouch');

INSERT INTO TempStreet(tempValue) VALUES ('Stockwell Walk');
INSERT INTO TempStreet(tempValue) VALUES ('Raglan Garden');
INSERT INTO TempStreet(tempValue) VALUES ('Hill Causeway');
INSERT INTO TempStreet(tempValue) VALUES ('Nowell Avenue');
INSERT INTO TempStreet(tempValue) VALUES ('St Davids Corner');
INSERT INTO TempStreet(tempValue) VALUES ('Sydney Meadow');
INSERT INTO TempStreet(tempValue) VALUES ('Old Farm Street');
INSERT INTO TempStreet(tempValue) VALUES ('Bolingbroke Road');
INSERT INTO TempStreet(tempValue) VALUES ('Leys Promenade');
INSERT INTO TempStreet(tempValue) VALUES ('Eckersley Drive');
INSERT INTO TempStreet(tempValue) VALUES ('Mcdermott Road');
INSERT INTO TempStreet(tempValue) VALUES ('Sandfield Strand');
INSERT INTO TempStreet(tempValue) VALUES ('Argus Road');
INSERT INTO TempStreet(tempValue) VALUES ('Heywood Brae');
INSERT INTO TempStreet(tempValue) VALUES ('Mountain Croft');
INSERT INTO TempStreet(tempValue) VALUES ('Goldfinch Cloisters');
INSERT INTO TempStreet(tempValue) VALUES ('Elder Brae');
INSERT INTO TempStreet(tempValue) VALUES ('Bradford Bank');
INSERT INTO TempStreet(tempValue) VALUES ('St James Promenade');
INSERT INTO TempStreet(tempValue) VALUES ('Heol Drindod');
INSERT INTO TempStreet(tempValue) VALUES ('Victory Brook');
INSERT INTO TempStreet(tempValue) VALUES ('Holland Approach');
INSERT INTO TempStreet(tempValue) VALUES ('Walker Newydd');
INSERT INTO TempStreet(tempValue) VALUES ('Kings Parade');
INSERT INTO TempStreet(tempValue) VALUES ('Harcourt Hollow');
INSERT INTO TempStreet(tempValue) VALUES ('Copse Circus');
INSERT INTO TempStreet(tempValue) VALUES ('James Grange');
INSERT INTO TempStreet(tempValue) VALUES ('Kennet Esplanade');
INSERT INTO TempStreet(tempValue) VALUES ('Bishops Royd');
INSERT INTO TempStreet(tempValue) VALUES ('Carr Bridge');
INSERT INTO TempStreet(tempValue) VALUES ('Glen Villas');
INSERT INTO TempStreet(tempValue) VALUES ('Chelsea Piece');
INSERT INTO TempStreet(tempValue) VALUES ('Morecambe Gardens');
INSERT INTO TempStreet(tempValue) VALUES ('Brambling Top');
INSERT INTO TempStreet(tempValue) VALUES ('Clarke Gate');
INSERT INTO TempStreet(tempValue) VALUES ('Queens Promenade');
INSERT INTO TempStreet(tempValue) VALUES ('Patience Grove');
INSERT INTO TempStreet(tempValue) VALUES ('Blue Lion Close');
INSERT INTO TempStreet(tempValue) VALUES ('Clyde Hollow');
INSERT INTO TempStreet(tempValue) VALUES ('Bradley Maltings');
INSERT INTO TempStreet(tempValue) VALUES ('Balsall Heath Road');
INSERT INTO TempStreet(tempValue) VALUES ('Bryn Arthur');
INSERT INTO TempStreet(tempValue) VALUES ('Tree Road');
INSERT INTO TempStreet(tempValue) VALUES ('Town Drive');
INSERT INTO TempStreet(tempValue) VALUES ('Keats Promenade');
INSERT INTO TempStreet(tempValue) VALUES ('Moss Top');
INSERT INTO TempStreet(tempValue) VALUES ('Cavendish Links');
INSERT INTO TempStreet(tempValue) VALUES ('Cheltenham Elms');
INSERT INTO TempStreet(tempValue) VALUES ('Wheatfield Grange');
INSERT INTO TempStreet(tempValue) VALUES ('Richard Vale');
INSERT INTO TempStreet(tempValue) VALUES ('Town Furlong');
INSERT INTO TempStreet(tempValue) VALUES ('Norristhorpe Lane');
INSERT INTO TempStreet(tempValue) VALUES ('Franklin North');
INSERT INTO TempStreet(tempValue) VALUES ('Gardner Isaf');
INSERT INTO TempStreet(tempValue) VALUES ('Summer Gate');
INSERT INTO TempStreet(tempValue) VALUES ('Macrae Street');
INSERT INTO TempStreet(tempValue) VALUES ('Woodview Orchards');
INSERT INTO TempStreet(tempValue) VALUES ('Victory Cliff');
INSERT INTO TempStreet(tempValue) VALUES ('Tulip Brambles');
INSERT INTO TempStreet(tempValue) VALUES ('Malton Court');
INSERT INTO TempStreet(tempValue) VALUES ('Little Sutton Grove');
INSERT INTO TempStreet(tempValue) VALUES ('Waterloo Woods');
INSERT INTO TempStreet(tempValue) VALUES ('Coleridge Leaze');
INSERT INTO TempStreet(tempValue) VALUES ('Highbury Drive');
INSERT INTO TempStreet(tempValue) VALUES ('Hanbury Broadway');
INSERT INTO TempStreet(tempValue) VALUES ('Trewern');
INSERT INTO TempStreet(tempValue) VALUES ('Kipling Cottages');
INSERT INTO TempStreet(tempValue) VALUES ('Trafalgar Gate');
INSERT INTO TempStreet(tempValue) VALUES ('Dunster Cottages');
INSERT INTO TempStreet(tempValue) VALUES ('David Broadway');
INSERT INTO TempStreet(tempValue) VALUES ('Avon Willows');
INSERT INTO TempStreet(tempValue) VALUES ('Alexandra Mead');
INSERT INTO TempStreet(tempValue) VALUES ('Howard Walk');
INSERT INTO TempStreet(tempValue) VALUES ('Minster Yard');
INSERT INTO TempStreet(tempValue) VALUES ('Raven Meols Lane');
INSERT INTO TempStreet(tempValue) VALUES ('Bernisdale Close');
INSERT INTO TempStreet(tempValue) VALUES ('Allington Firs');
INSERT INTO TempStreet(tempValue) VALUES ('Crofters Lodge');
INSERT INTO TempStreet(tempValue) VALUES ('Foxes Walk');
INSERT INTO TempStreet(tempValue) VALUES ('Richards Paddock');
INSERT INTO TempStreet(tempValue) VALUES ('Morgan Furlong');
INSERT INTO TempStreet(tempValue) VALUES ('Todholm Terrace');
INSERT INTO TempStreet(tempValue) VALUES ('Gorse Edge');
INSERT INTO TempStreet(tempValue) VALUES ('Raleigh Parkway');
INSERT INTO TempStreet(tempValue) VALUES ('Cemetery Paddocks');
INSERT INTO TempStreet(tempValue) VALUES ('Ridley Cedars');
INSERT INTO TempStreet(tempValue) VALUES ('Helston Promenade');
INSERT INTO TempStreet(tempValue) VALUES ('Cromer Elms');
INSERT INTO TempStreet(tempValue) VALUES ('Whitley Loan');
INSERT INTO TempStreet(tempValue) VALUES ('Johnston Croft');
INSERT INTO TempStreet(tempValue) VALUES ('Newman Grove');
INSERT INTO TempStreet(tempValue) VALUES ('Hardwick Las');
INSERT INTO TempStreet(tempValue) VALUES ('Selborne Paddock');
INSERT INTO TempStreet(tempValue) VALUES ('Alice Broadway');
INSERT INTO TempStreet(tempValue) VALUES ('Moorland Hollies');
INSERT INTO TempStreet(tempValue) VALUES ('Peveril Valley');
INSERT INTO TempStreet(tempValue) VALUES ('King George Lanes');
INSERT INTO TempStreet(tempValue) VALUES ('Brock Heights');
INSERT INTO TempStreet(tempValue) VALUES ('Hammercliffe Road');

/* DATA GENERATION PROCEDURE */
DECLARE
  l_seed VARCHAR2(100);
BEGIN
  l_seed := TO_CHAR(SYSTIMESTAMP,'YYYYDDMMHH24MISSFFFF');
  DBMS_RANDOM.seed(l_seed);
  FOR i IN 1..16500 LOOP
    INSERT INTO Address(country, town, street, zipCode) VALUES (
        (SELECT tempValue FROM TempCountry WHERE tempID = TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM TempCountry) + 1))), 
        (SELECT tempValue FROM TempTown WHERE tempID = TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM TempTown) + 1))),
        (SELECT tempValue FROM TempStreet WHERE tempID = TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM TempStreet) + 1))),
        (TRUNC(DBMS_RANDOM.VALUE(10, 100)) || '-' || TRUNC(DBMS_RANDOM.VALUE(100, 1000))));
  END LOOP;
END;
/

/* DROP TEMPORARY DATA */
DROP TABLE TempCountry;
DROP TABLE TempTown;
DROP TABLE TempStreet;
DROP SEQUENCE TempCountrySEQ;
DROP SEQUENCE TempTownSEQ;
DROP SEQUENCE TempStreetSEQ;

/* PURGE RECYCLE BIN */
PURGE RECYCLEBIN;