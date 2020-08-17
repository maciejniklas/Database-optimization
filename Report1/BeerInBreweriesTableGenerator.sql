/* CHECK TABLES */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BeerInBreweries')
DROP TABLE BeerInBreweries;

/* TABLE */
CREATE TABLE dbo.BeerInBreweries
(
  brewery_id INT NOT NULL,
  beer_id INT NOT NULL,
  price DECIMAL(6, 2),
  alcohol_percent DECIMAL(4, 2),
  amount_in_liters DECIMAL(6, 2),
  CONSTRAINT FK_Beer_In_Breweries_Brewery FOREIGN KEY (brewery_id) REFERENCES Brewery (id) ON DELETE CASCADE,
  CONSTRAINT FK_Beer_In_Breweries_Beer FOREIGN KEY (beer_id) REFERENCES Beer (id)
);

/* DATA GENERATION PROCEDURE */
DECLARE @index INT
BEGIN
	SET @index = 1;

	WHILE(@index <= 50000)
	BEGIN
		INSERT INTO dbo.BeerInBreweries(brewery_id, beer_id, price, alcohol_percent, amount_in_liters) VALUES (
			(@index - 1) % (SELECT COUNT(*) FROM Brewery) + 1,
			@index,
			RAND() * (1000 - 10) + 10,
			RAND() * (12 - 4) + 4,
			RAND() * 1500
			);			
		SET @index = @index + 1;
	END
END