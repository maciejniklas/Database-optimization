/* 1 BAD */
SELECT Employee.first_name, Employee.last_name FROM Employee WHERE Employee.salary = (SELECT TOP(1) Employee.salary FROM Employee WHERE YEAR(Employee.birth_date) = 2020 AND MONTH(Employee.birth_date) = 9 ORDER BY Employee.salary DESC)
/* 1 BETTER */
SELECT Employee.first_name, Employee.last_name FROM Employee WHERE Employee.salary = (SELECT MAX(Employee.salary) FROM Employee WHERE Employee.birth_date BETWEEN '9/1/2020' AND '9/30/2020')

/* 2 BAD */
SELECT BeerStyle.name, AVG(Beer.price) FROM BeerStyle, Beer WHERE BeerStyle.id = Beer.beer_style_id AND Beer.price IN (SELECT Beer.price FROM Beer WHERE BEER.price > 500) AND Beer.amount_in_liters IN (SELECT Beer.amount_in_liters FROM Beer WHERE amount_in_liters > 1000) GROUP BY BeerStyle.name
/* 2 BETTER */
SELECT BeerStyle.name, AVG(Beer.price) FROM BeerStyle INNER JOIN Beer ON (BeerStyle.id = Beer.beer_style_id), (SELECT Beer.price, Beer.amount_in_liters FROM Beer WHERE BEER.price > 500 AND amount_in_liters > 1000) AS Selection WHERE Beer.price IN (Selection.price) AND Beer.amount_in_liters IN (Selection.amount_in_liters) GROUP BY BeerStyle.name

/* 3 BAD */
SELECT BeerStyle.name, COUNT(*) FROM BeerStyle INNER JOIN Beer ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.price < 500 GROUP BY BeerStyle.name UNION SELECT BeerStyle.name, COUNT(*) FROM BeerStyle INNER JOIN Beer ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.price > 1000 GROUP BY BeerStyle.name
/* 3 BETTER */
SELECT BeerStyle.name, COUNT(*) FROM BeerStyle INNER JOIN Beer ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.price < 500 OR Beer.price > 1000 GROUP BY BeerStyle.name

/* 4 BAD */
SELECT DISTINCT * FROM Employee, Address WHERE (Employee.address_id = Address.id)
/* 4 BETTER */
SELECT * FROM Employee WHERE EXISTS (SELECT 'Y' FROM Address WHERE Employee.address_id = Address.id)

/* 5 BAD */
SELECT BeerStyle.name, (SELECT MAX(Beer.price) FROM Beer WHERE Beer.beer_style_id = BeerStyle.id) FROM BeerStyle
/* 5 BETTER */
SELECT BeerStyle.name, MAX(Beer.price) FROM BeerStyle INNER JOIN Beer ON (BeerStyle.id = Beer.beer_style_id) GROUP BY BeerStyle.name