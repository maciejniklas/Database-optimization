/* TEMP TABLES */
CREATE TABLE TempState
(
  tempID NUMBER(9) NOT NULL PRIMARY KEY,
  tempValue VARCHAR2(100) NOT NULL
);

CREATE TABLE TempCapacity
(
  tempID NUMBER(9) NOT NULL PRIMARY KEY,
  tempValue NUMBER(2) NOT NULL
);

INSERT INTO TempState(tempID, tempValue) VALUES (1, 'empty');
INSERT INTO TempState(tempID, tempValue) VALUES (2, 'in use');
INSERT INTO TempState(tempID, tempValue) VALUES (3, 'full');

INSERT INTO TempCapacity(tempID, tempValue) VALUES (1, 50);
INSERT INTO TempCapacity(tempID, tempValue) VALUES (2, 30);
INSERT INTO TempCapacity(tempID, tempValue) VALUES (3, 25);
INSERT INTO TempCapacity(tempID, tempValue) VALUES (4, 20);

/* DATA GENERATION PROCEDURE */
DECLARE
  l_seed VARCHAR2(100);
BEGIN
  l_seed := TO_CHAR(SYSTIMESTAMP,'YYYYDDMMHH24MISSFFFF');
  DBMS_RANDOM.seed(l_seed);
  FOR i IN 1..37500 LOOP
    INSERT INTO Keg(kegState, kegCapacity) VALUES
    (
        (SELECT tempValue FROM TempState WHERE tempID = TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM TempState) + 1))),
        (SELECT tempValue FROM TempCapacity WHERE tempID = TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM TempCapacity) + 1)))
    );
  END LOOP;
END;
/

/* DROP TABLES */
DROP TABLE TempState;
DROP TABLE TempCapacity;

/* PURGE RECYCLE BIN */
PURGE TABLE TempState;
PURGE TABLE TempCapacity;