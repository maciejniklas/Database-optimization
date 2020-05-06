/* DATA GENERATION PROCEDURE */
DECLARE
  l_seed VARCHAR2(100);
BEGIN
  l_seed := TO_CHAR(SYSTIMESTAMP,'YYYYDDMMHH24MISSFFFF');
  DBMS_RANDOM.seed(l_seed);
  FOR i IN 1..7500 LOOP
    INSERT INTO Beer(beerStyleID, beerPrice, alcoholPercent, beerAmountInLiters) VALUES
    (
        (TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM BeerStyle) + 1))),
        (DBMS_RANDOM.value(10, 1000)),
        (DBMS_RANDOM.value(4, 12)),
        (DBMS_RANDOM.value(0, 1500))
    );
  END LOOP;
END;
/