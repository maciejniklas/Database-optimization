/* CHECK TABLES */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempColor')
DROP TABLE TempColor;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempItem')
DROP TABLE TempItem;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempCompany')
DROP TABLE TempCompany;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Brewery')
DROP TABLE Brewery;

/* TABLE */
CREATE TABLE dbo.Brewery
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	address_id INT NOT NULL,
	name VARCHAR(100),
	CONSTRAINT FK_Brewery_Address FOREIGN KEY (address_id) REFERENCES Address (id)
);

/* TEMP TABLES */
CREATE TABLE TempColor
(
  tempID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  tempValue VARCHAR(100) NOT NULL,
  tempOrder INT NOT NULL
);

CREATE TABLE TempItem
(
  tempID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  tempValue VARCHAR(100) NOT NULL,
  tempOrder INT NOT NULL
);

CREATE TABLE TempCompany
(
  tempID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  tempValue VARCHAR(100) NOT NULL,
  tempOrder INT NOT NULL
);

/* TEMPORARY DATA INSERTION FOR RANDOM REAL DATA GENERATION */
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Alice Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Antique White', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Aqua', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Aquamarine', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Azure', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Beige', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Bisque', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Black', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Blanched Almond', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Blue Violet', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Brown', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Burly Wood', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Cadet Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Chartreuse', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Chocolate', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Coral', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Cornflower Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Cornsilk', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Crimson', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Cyan', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Cyan', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Golden Rod', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Khaki', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Magenta', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Olive Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Orange', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Orchid', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Red', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Salmon', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Sea Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Slate Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Slate Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Slate Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Turquoise', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dark Violet', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Deep Pink', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Deep Sky Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dim Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dim Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Dodger Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Fire Brick', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Floral White', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Forest Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Fuchsia', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Gainsboro', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Ghost White', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Gold', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Golden Rod', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Green Yellow', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Honey Dew', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Hot Pink', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Indian Red', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Indigo', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Ivory', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Khaki', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Lavender', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Lavender Blush', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Lawn Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Lemon Chiffon', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Coral', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Cyan', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Golden Rod Yellow', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Pink', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Salmon', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Sea Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Sky Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Slate Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Slate Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Steel Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Light Yellow', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Lime', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Lime Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Linen', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Magenta', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Maroon', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Aqua Marine', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Orchid', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Purple', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Sea Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Slate Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Spring Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Turquoise', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Medium Violet Red', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Midnight Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Mint Cream', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Misty Rose', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Moccasin', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Navajo White', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Navy', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Old Lace', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Olive', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Olive Drab', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Orange', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Orange Red', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Orchid', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Pale Golden Rod', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Pale Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Pale Turquoise', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Pale Violet Red', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Papaya Whip', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Peach Puff', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Peru', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Pink', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Plum', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Powder Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Purple', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Rebecca Purple', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Red', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Rosy Brown', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Royal Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Saddle Brown', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Salmon', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Sandy Brown', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Sea Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Sea Shell', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Sienna', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Silver', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Sky Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Slate Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Slate Gray', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Slate Grey', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Snow', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Spring Green', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Steel Blue', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Tan', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Teal', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Thistle', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Tomato', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Turquoise', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Violet', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Wheat', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('White', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('White Smoke', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Yellow', 1);
INSERT INTO TempColor(tempValue, tempOrder) VALUES ('Yellow Green', 1);

INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Bootle', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Can', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Cap', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Keg', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Mug', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Opener', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Box', 2);
INSERT INTO TempItem(tempValue, tempOrder) VALUES ('Kettle', 2);

INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Brewery', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Firm', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Company', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Business', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Corporation', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Agency', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Institution', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Organization', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Concern', 3);
INSERT INTO TempCompany(tempValue, tempOrder) VALUES ('Brewhouse', 3);

/* SEQUENCES */
CREATE SEQUENCE AddressSEQ START WITH 1;

/* DATA GENERATION PROCEDURE */
DECLARE @index INT
DECLARE @brewery_name VARCHAR(100)
BEGIN
	SET @index = 1;

	WHILE(@index <= 10000)
	BEGIN
		SET @brewery_name = CAST(
		(SELECT STRING_AGG(sub.tempValue, ' ') WITHIN GROUP (ORDER BY tempOrder ASC) FROM (
			SELECT tempValue, tempOrder FROM TempCompany WHERE tempID = CEILING(RAND() * (SELECT COUNT(*) FROM TempCompany))
				UNION
			SELECT tempValue, tempOrder FROM TempColor WHERE tempID = CEILING(RAND() * (SELECT COUNT(*) FROM TempColor))
				UNION
			SELECT tempValue, tempOrder FROM TempItem WHERE tempID = CEILING(RAND() * (SELECT COUNT(*) FROM TempItem))
				) AS sub) AS VARCHAR(100)
		);

		INSERT INTO dbo.Brewery (address_id, name) VALUES (
			@index,
			@brewery_name
			);
		SET @index = @index + 1;
	END
END

DROP TABLE TempColor;
DROP TABLE TempItem;
DROP TABLE TempCompany;