# 5 the most evpensive beers
SELECT stylename, beerprice FROM (SELECT * FROM beer INNER JOIN beerstyle USING (beerstyleID) ORDER BY beerprice DESC) WHERE rownum <= 5;

# 5 the cheapest beers
SELECT stylename, beerprice FROM (SELECT * FROM beer INNER JOIN beerstyle USING (beerstyleID) ORDER BY beerprice ASC) WHERE rownum <= 5;

# Average price for each beer style
SELECT stylename, round(avg(beerprice), 2) AS "Average price" FROM beer INNER JOIN beerstyle USING (beerstyleID) GROUP BY stylename;

# Beer with the biggest alcohol percentage value
SELECT stylename, alcoholpercent FROM (SELECT * FROM beer ORDER BY alcoholpercent DESC) INNER JOIN beerStyle USING (beerstyleID) WHERE rownum <= 1;

# Beer with the lowest alcohol percentage value
SELECT stylename, alcoholpercent FROM (SELECT * FROM beer ORDER BY alcoholpercent ASC) INNER JOIN beerStyle USING (beerstyleID) WHERE rownum <= 1;

# 5 breweries with the biggest amount of beer
SELECT * FROM (SELECT breweryname, sum(beeramountinliters) AS "total beer" FROM (SELECT * FROM (SELECT * FROM beerInBreweries INNER JOIN brewery USING (breweryID)) INNER JOIN beer USING (beerID)) GROUP BY breweryname ORDER BY "total beer" DESC) WHERE rownum <= 5;

# 10 breweries with the biggest kegs capacity
SELECT * FROM (SELECT breweryname, sum(kegcapacity) AS "kegs capacity" FROM (SELECT * FROM (SELECT * FROM (SELECT * FROM beerInBreweries INNER JOIN beerinkegs USING (beerID)) INNER JOIN brewery USING (breweryID)) INNER JOIN keg USING (kegID)) GROUP BY breweryname ORDER BY "kegs capacity" DESC) WHERE rownum <= 10;

# 10 the best paid employees
SELECT * FROM (SELECT firstname, lastname, salary, breweryname FROM employee INNER JOIN brewery USING(breweryID) ORDER BY salary DESC) WHERE rownum <= 10;