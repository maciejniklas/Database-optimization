/* SEQUENCES */
CREATE SEQUENCE BeerSEQ START WITH 1;
CREATE SEQUENCE BrewerySEQ START WITH 1;

/* DATA GENERATION PROCEDURE */
BEGIN
  FOR i IN 1..7500 LOOP    
    IF MOD(BeerSEQ.nextval, 5) = 1 THEN
        INSERT INTO BeerInBreweries(breweryID, beerID) VALUES (BrewerySEQ.nextval, BeerSEQ.currval);
    ElSE
        INSERT INTO BeerInBreweries(breweryID, beerID) VALUES (BrewerySEQ.currval, BeerSEQ.currval); 
    END IF;
  END LOOP;
END;
/

/* DROP DATA NECESSARY ONLY FOR DATABASE FILL */
DROP SEQUENCE BrewerySEQ;
DROP SEQUENCE BeerSEQ;