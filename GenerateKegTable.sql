/* TEMP TABLES */
CREATE TABLE TempState
(
  tempID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  tempValue VARCHAR2(100) NOT NULL
);

CREATE TABLE TempCapacity
(
  tempID NUMBER(9) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  tempValue NUMBER(2) NOT NULL
);

INSERT INTO TempState(tempValue) VALUES ('empty');
INSERT INTO TempState(tempValue) VALUES ('in use');
INSERT INTO TempState(tempValue) VALUES ('full');

INSERT INTO TempCapacity(tempValue) VALUES (50);
INSERT INTO TempCapacity(tempValue) VALUES (30);
INSERT INTO TempCapacity(tempValue) VALUES (25);
INSERT INTO TempCapacity(tempValue) VALUES (20);

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