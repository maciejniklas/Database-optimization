/* STRUCTURE */
CREATE TABLE dbo.Address
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	country VARCHAR(50),
	town VARCHAR(75),
	street VARCHAR(100),
	zip_code CHAR(6),
	CONSTRAINT CHK_zip_code CHECK (zip_code LIKE '[0-9][0-9]-[0-9][0-9][0-9]')
);

CREATE TABLE dbo.Brewery
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	address_id INT NOT NULL,
	name VARCHAR(100),
	CONSTRAINT FK_Brewery_Address FOREIGN KEY (address_id) REFERENCES Address (id)
);

CREATE TABLE dbo.Employee
(    
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	address_id INT NOT NULL,
	brewery_id INT NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE,
	salary DECIMAL(8, 2),
	CONSTRAINT FK_Employee_Brewery FOREIGN KEY (brewery_id) REFERENCES Brewery (id),
	CONSTRAINT FK_Employee_Address FOREIGN KEY (address_id) REFERENCES Address (id)
);

CREATE TABLE dbo.BeerStyle
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(25),
	SRM INT,
	EBC INT
);

CREATE TABLE dbo.Beer
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	beer_style_id INT NOT NULL,
	price DECIMAL(6, 2),
	alcohol_percent DECIMAL(4, 2),
	amount_in_liters DECIMAL(6, 2),
	CONSTRAINT FK_Beer_Beer_Style FOREIGN KEY (beer_style_id) REFERENCES BeerStyle (id)
);

CREATE TABLE dbo.Keg
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	state VARCHAR(10),
	capacity INT
);

CREATE TABLE dbo.BeerInBreweries
(
	brewery_id INT NOT NULL,
	beer_id INT NOT NULL,
	CONSTRAINT FK_Beer_In_Breweries_Brewery FOREIGN KEY (brewery_id) REFERENCES Brewery (id) ON DELETE CASCADE,
	CONSTRAINT FK_Beer_In_Breweries_Beer FOREIGN KEY (beer_id) REFERENCES Beer (id)
);

CREATE TABLE dbo.BeerInKegs
(    
	beer_id INT NOT NULL,
	keg_id INT NOT NULL,
	CONSTRAINT FK_Beer_In_Kegs_Beer FOREIGN KEY (beer_id) REFERENCES Beer (id) ON DELETE CASCADE,
	CONSTRAINT FK_Beer_In_Kegs_Keg FOREIGN KEY (keg_id) REFERENCES Keg (id)
);