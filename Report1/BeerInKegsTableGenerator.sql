/* CHECK TABLES */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BeerInKegs')
DROP TABLE BeerInKegs;

/* TABLE */
CREATE TABLE dbo.BeerInKegs
(    
  beer_id INT NOT NULL,
  keg_id INT NOT NULL,
  CONSTRAINT FK_Beer_In_Kegs_Beer FOREIGN KEY (beer_id) REFERENCES Beer (id) ON DELETE CASCADE,
  CONSTRAINT FK_Beer_In_Kegs_Keg FOREIGN KEY (keg_id) REFERENCES Keg (id)
);

/* DATA GENERATION PROCEDURE */
DECLARE @index INT
BEGIN
	SET @index = 1;

	WHILE(@index <= 100000)
	BEGIN
		INSERT INTO dbo.BeerInKegs(beer_id, keg_id) VALUES (
			(@index - 1) % (SELECT COUNT(*) FROM Beer) + 1,
			@index
			);			
		SET @index = @index + 1;
	END
END