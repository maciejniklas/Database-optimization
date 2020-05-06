/* SEQUENCES */
CREATE SEQUENCE LocalBeerSEQ START WITH 1;
CREATE SEQUENCE LocalBrewerySEQ START WITH 1;

/* DATA GENERATION PROCEDURE */
BEGIN
  FOR i IN 1..7500 LOOP    
    IF MOD(LocalBeerSEQ.nextval, 5) = 1 THEN
        INSERT INTO BeerInBreweries(breweryID, beerID) VALUES (LocalBrewerySEQ.nextval, LocalBeerSEQ.currval);
    ElSE
        INSERT INTO BeerInBreweries(breweryID, beerID) VALUES (LocalBrewerySEQ.currval, LocalBeerSEQ.currval); 
    END IF;
  END LOOP;
END;
/

/* DROP DATA NECESSARY ONLY FOR DATABASE FILL */
DROP SEQUENCE LocalBrewerySEQ;
DROP SEQUENCE LocalBeerSEQ;