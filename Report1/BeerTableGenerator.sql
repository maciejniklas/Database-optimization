/* CHECK TABLES */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Beer')
DROP TABLE Beer;

/* TABLE */
CREATE TABLE dbo.Beer
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	beer_style_id INT NOT NULL,
 	price DECIMAL(6, 2),
 	alcohol_percent DECIMAL(4, 2),
 	amount_in_liters DECIMAL(6, 2),
	CONSTRAINT FK_Beer_Beer_Style FOREIGN KEY (beer_style_id) REFERENCES BeerStyle (id)
);

/* DATA GENERATION PROCEDURE */
DECLARE @index INT
BEGIN
	SET @index = 0;

	WHILE(@index < 50000)
	BEGIN
		INSERT INTO dbo.Beer(beer_style_id, price, alcohol_percent, amount_in_liters) VALUES (
			CEILING(RAND() * (SELECT COUNT(*) FROM BeerStyle)),
			RAND() * (1000 - 10) + 10,
			RAND() * (12 - 4) + 4,
			RAND() * 1500
			);
		SET @index = @index + 1;
	END
END