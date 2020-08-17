/* CHECK TABLES */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempFirstName')
DROP TABLE TempFirstName;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempLastName')
DROP TABLE TempLastName;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Employee')
DROP TABLE Employee;

/* TABLE */
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

/* TEMP TABLES */
CREATE TABLE TempFirstName
(
  tempID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  tempValue VARCHAR(100) NOT NULL
);

CREATE TABLE TempLastName
(
  tempID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  tempValue VARCHAR(100) NOT NULL
);

/* TEMPORARY DATA INSERTION FOR RANDOM REAL DATA GENERATION */
INSERT INTO TempFirstName(tempValue) VALUES ('Jacques');
INSERT INTO TempFirstName(tempValue) VALUES ('Bean');
INSERT INTO TempFirstName(tempValue) VALUES ('Nusaybah');
INSERT INTO TempFirstName(tempValue) VALUES ('Conroy');
INSERT INTO TempFirstName(tempValue) VALUES ('Tamara');
INSERT INTO TempFirstName(tempValue) VALUES ('Prince');
INSERT INTO TempFirstName(tempValue) VALUES ('Laurie');
INSERT INTO TempFirstName(tempValue) VALUES ('Lloyd');
INSERT INTO TempFirstName(tempValue) VALUES ('Skylar');
INSERT INTO TempFirstName(tempValue) VALUES ('Nunez');
INSERT INTO TempFirstName(tempValue) VALUES ('Mariam');
INSERT INTO TempFirstName(tempValue) VALUES ('Pruitt');
INSERT INTO TempFirstName(tempValue) VALUES ('Brady');
INSERT INTO TempFirstName(tempValue) VALUES ('Esparza');
INSERT INTO TempFirstName(tempValue) VALUES ('Cairo');
INSERT INTO TempFirstName(tempValue) VALUES ('Williams');
INSERT INTO TempFirstName(tempValue) VALUES ('Emily');
INSERT INTO TempFirstName(tempValue) VALUES ('Morrow');
INSERT INTO TempFirstName(tempValue) VALUES ('Sam');
INSERT INTO TempFirstName(tempValue) VALUES ('Bannister');
INSERT INTO TempFirstName(tempValue) VALUES ('Maverick');
INSERT INTO TempFirstName(tempValue) VALUES ('Odom');
INSERT INTO TempFirstName(tempValue) VALUES ('Shayna');
INSERT INTO TempFirstName(tempValue) VALUES ('Gutierrez');
INSERT INTO TempFirstName(tempValue) VALUES ('Hasnain');
INSERT INTO TempFirstName(tempValue) VALUES ('Adkins');
INSERT INTO TempFirstName(tempValue) VALUES ('Daryl');
INSERT INTO TempFirstName(tempValue) VALUES ('Malone');
INSERT INTO TempFirstName(tempValue) VALUES ('Veronica');
INSERT INTO TempFirstName(tempValue) VALUES ('Sloan');
INSERT INTO TempFirstName(tempValue) VALUES ('Haydn');
INSERT INTO TempFirstName(tempValue) VALUES ('Macleod');
INSERT INTO TempFirstName(tempValue) VALUES ('Ted');
INSERT INTO TempFirstName(tempValue) VALUES ('Oconnor');
INSERT INTO TempFirstName(tempValue) VALUES ('Benn');
INSERT INTO TempFirstName(tempValue) VALUES ('Bentley');
INSERT INTO TempFirstName(tempValue) VALUES ('Della');
INSERT INTO TempFirstName(tempValue) VALUES ('Mcintosh');
INSERT INTO TempFirstName(tempValue) VALUES ('Ranveer');
INSERT INTO TempFirstName(tempValue) VALUES ('Mcguire');
INSERT INTO TempFirstName(tempValue) VALUES ('Noel');
INSERT INTO TempFirstName(tempValue) VALUES ('Stevenson');
INSERT INTO TempFirstName(tempValue) VALUES ('Mackenzie');
INSERT INTO TempFirstName(tempValue) VALUES ('Doherty');
INSERT INTO TempFirstName(tempValue) VALUES ('Filip');
INSERT INTO TempFirstName(tempValue) VALUES ('Underwood');
INSERT INTO TempFirstName(tempValue) VALUES ('Kaitlan');
INSERT INTO TempFirstName(tempValue) VALUES ('Miles');
INSERT INTO TempFirstName(tempValue) VALUES ('Finbar');
INSERT INTO TempFirstName(tempValue) VALUES ('Drummond');
INSERT INTO TempFirstName(tempValue) VALUES ('Peter');
INSERT INTO TempFirstName(tempValue) VALUES ('Burrows');
INSERT INTO TempFirstName(tempValue) VALUES ('Brook');
INSERT INTO TempFirstName(tempValue) VALUES ('Weir');
INSERT INTO TempFirstName(tempValue) VALUES ('Layla');
INSERT INTO TempFirstName(tempValue) VALUES ('Barnes');
INSERT INTO TempFirstName(tempValue) VALUES ('Julie');
INSERT INTO TempFirstName(tempValue) VALUES ('Parsons');
INSERT INTO TempFirstName(tempValue) VALUES ('Rianna');
INSERT INTO TempFirstName(tempValue) VALUES ('Pittman');
INSERT INTO TempFirstName(tempValue) VALUES ('Fay');
INSERT INTO TempFirstName(tempValue) VALUES ('Kramer');
INSERT INTO TempFirstName(tempValue) VALUES ('Dhruv');
INSERT INTO TempFirstName(tempValue) VALUES ('Broadhurst');
INSERT INTO TempFirstName(tempValue) VALUES ('Renee');
INSERT INTO TempFirstName(tempValue) VALUES ('Gilmour');
INSERT INTO TempFirstName(tempValue) VALUES ('Jaden');
INSERT INTO TempFirstName(tempValue) VALUES ('Walsh');
INSERT INTO TempFirstName(tempValue) VALUES ('Katie');
INSERT INTO TempFirstName(tempValue) VALUES ('Whittaker');
INSERT INTO TempFirstName(tempValue) VALUES ('Farzana');
INSERT INTO TempFirstName(tempValue) VALUES ('Banks');
INSERT INTO TempFirstName(tempValue) VALUES ('Hanifa');
INSERT INTO TempFirstName(tempValue) VALUES ('Stott');
INSERT INTO TempFirstName(tempValue) VALUES ('Carmen');
INSERT INTO TempFirstName(tempValue) VALUES ('Davie');
INSERT INTO TempFirstName(tempValue) VALUES ('Pollyanna');
INSERT INTO TempFirstName(tempValue) VALUES ('Ferguson');
INSERT INTO TempFirstName(tempValue) VALUES ('Dexter');
INSERT INTO TempFirstName(tempValue) VALUES ('Britton');
INSERT INTO TempFirstName(tempValue) VALUES ('Ryder');
INSERT INTO TempFirstName(tempValue) VALUES ('Harris');
INSERT INTO TempFirstName(tempValue) VALUES ('Nour');
INSERT INTO TempFirstName(tempValue) VALUES ('White');
INSERT INTO TempFirstName(tempValue) VALUES ('Ivy');
INSERT INTO TempFirstName(tempValue) VALUES ('Haworth');
INSERT INTO TempFirstName(tempValue) VALUES ('Bronwyn');
INSERT INTO TempFirstName(tempValue) VALUES ('Sheppard');
INSERT INTO TempFirstName(tempValue) VALUES ('Dania');
INSERT INTO TempFirstName(tempValue) VALUES ('Levy');
INSERT INTO TempFirstName(tempValue) VALUES ('Jayden-James');
INSERT INTO TempFirstName(tempValue) VALUES ('Cochran');
INSERT INTO TempFirstName(tempValue) VALUES ('Clive');
INSERT INTO TempFirstName(tempValue) VALUES ('Deleon');
INSERT INTO TempFirstName(tempValue) VALUES ('Lucie');
INSERT INTO TempFirstName(tempValue) VALUES ('Rocha');
INSERT INTO TempFirstName(tempValue) VALUES ('Roger');
INSERT INTO TempFirstName(tempValue) VALUES ('Bailey');
INSERT INTO TempFirstName(tempValue) VALUES ('Kierran');
INSERT INTO TempFirstName(tempValue) VALUES ('Kendall');
INSERT INTO TempFirstName(tempValue) VALUES ('Anja');
INSERT INTO TempFirstName(tempValue) VALUES ('Harding');
INSERT INTO TempFirstName(tempValue) VALUES ('Jadon');
INSERT INTO TempFirstName(tempValue) VALUES ('Webster');
INSERT INTO TempFirstName(tempValue) VALUES ('Dillan');
INSERT INTO TempFirstName(tempValue) VALUES ('Andersen');
INSERT INTO TempFirstName(tempValue) VALUES ('Ziva');
INSERT INTO TempFirstName(tempValue) VALUES ('Daniels');
INSERT INTO TempFirstName(tempValue) VALUES ('Amani');
INSERT INTO TempFirstName(tempValue) VALUES ('Davison');
INSERT INTO TempFirstName(tempValue) VALUES ('Kean');
INSERT INTO TempFirstName(tempValue) VALUES ('Francis');
INSERT INTO TempFirstName(tempValue) VALUES ('Otto');
INSERT INTO TempFirstName(tempValue) VALUES ('Lowe');
INSERT INTO TempFirstName(tempValue) VALUES ('Rikesh');
INSERT INTO TempFirstName(tempValue) VALUES ('Frazier');
INSERT INTO TempFirstName(tempValue) VALUES ('Opal');
INSERT INTO TempFirstName(tempValue) VALUES ('Mcdonald');
INSERT INTO TempFirstName(tempValue) VALUES ('Morris');
INSERT INTO TempFirstName(tempValue) VALUES ('Mcintyre');
INSERT INTO TempFirstName(tempValue) VALUES ('Harrison');
INSERT INTO TempFirstName(tempValue) VALUES ('Kearney');
INSERT INTO TempFirstName(tempValue) VALUES ('Phyllis');
INSERT INTO TempFirstName(tempValue) VALUES ('Dillard');
INSERT INTO TempFirstName(tempValue) VALUES ('Javier');
INSERT INTO TempFirstName(tempValue) VALUES ('Klein');
INSERT INTO TempFirstName(tempValue) VALUES ('Samera');
INSERT INTO TempFirstName(tempValue) VALUES ('Travis');
INSERT INTO TempFirstName(tempValue) VALUES ('Kyran');
INSERT INTO TempFirstName(tempValue) VALUES ('Lynn');
INSERT INTO TempFirstName(tempValue) VALUES ('Alanah');
INSERT INTO TempFirstName(tempValue) VALUES ('Legge');
INSERT INTO TempFirstName(tempValue) VALUES ('Osian');
INSERT INTO TempFirstName(tempValue) VALUES ('Cantrell');
INSERT INTO TempFirstName(tempValue) VALUES ('Evie-Rose');
INSERT INTO TempFirstName(tempValue) VALUES ('Boone');
INSERT INTO TempFirstName(tempValue) VALUES ('Seren');
INSERT INTO TempFirstName(tempValue) VALUES ('Ware');
INSERT INTO TempFirstName(tempValue) VALUES ('Edgar');
INSERT INTO TempFirstName(tempValue) VALUES ('Cervantes');
INSERT INTO TempFirstName(tempValue) VALUES ('Liam');
INSERT INTO TempFirstName(tempValue) VALUES ('Walls');
INSERT INTO TempFirstName(tempValue) VALUES ('Roberta');
INSERT INTO TempFirstName(tempValue) VALUES ('Wallis');
INSERT INTO TempFirstName(tempValue) VALUES ('Jeanette');
INSERT INTO TempFirstName(tempValue) VALUES ('Osborne');
INSERT INTO TempFirstName(tempValue) VALUES ('Dafydd');
INSERT INTO TempFirstName(tempValue) VALUES ('Reeves');
INSERT INTO TempFirstName(tempValue) VALUES ('Juniper');
INSERT INTO TempFirstName(tempValue) VALUES ('Paul');
INSERT INTO TempFirstName(tempValue) VALUES ('Suhail');
INSERT INTO TempFirstName(tempValue) VALUES ('Mcdonnell');
INSERT INTO TempFirstName(tempValue) VALUES ('Tyrique');
INSERT INTO TempFirstName(tempValue) VALUES ('Williamson');
INSERT INTO TempFirstName(tempValue) VALUES ('Aisha');
INSERT INTO TempFirstName(tempValue) VALUES ('Perkins');
INSERT INTO TempFirstName(tempValue) VALUES ('Sammy-Jo');
INSERT INTO TempFirstName(tempValue) VALUES ('Hayes');
INSERT INTO TempFirstName(tempValue) VALUES ('Tyler');
INSERT INTO TempFirstName(tempValue) VALUES ('Lucero');
INSERT INTO TempFirstName(tempValue) VALUES ('Mariella');
INSERT INTO TempFirstName(tempValue) VALUES ('Kerr');
INSERT INTO TempFirstName(tempValue) VALUES ('Arbaaz');
INSERT INTO TempFirstName(tempValue) VALUES ('Weston');
INSERT INTO TempFirstName(tempValue) VALUES ('Brayden');
INSERT INTO TempFirstName(tempValue) VALUES ('Reed');
INSERT INTO TempFirstName(tempValue) VALUES ('Arla');
INSERT INTO TempFirstName(tempValue) VALUES ('Bowen');
INSERT INTO TempFirstName(tempValue) VALUES ('Cataleya');
INSERT INTO TempFirstName(tempValue) VALUES ('Buck');
INSERT INTO TempFirstName(tempValue) VALUES ('Maison');
INSERT INTO TempFirstName(tempValue) VALUES ('Hassan');
INSERT INTO TempFirstName(tempValue) VALUES ('Dotty');
INSERT INTO TempFirstName(tempValue) VALUES ('Mcgregor');
INSERT INTO TempFirstName(tempValue) VALUES ('Lacey-Mae');
INSERT INTO TempFirstName(tempValue) VALUES ('Goulding');
INSERT INTO TempFirstName(tempValue) VALUES ('Sonya');
INSERT INTO TempFirstName(tempValue) VALUES ('Dupont');
INSERT INTO TempFirstName(tempValue) VALUES ('Konrad');
INSERT INTO TempFirstName(tempValue) VALUES ('Farrington');
INSERT INTO TempFirstName(tempValue) VALUES ('Adelaide');
INSERT INTO TempFirstName(tempValue) VALUES ('Amos');
INSERT INTO TempFirstName(tempValue) VALUES ('Kitty');
INSERT INTO TempFirstName(tempValue) VALUES ('Bender');
INSERT INTO TempFirstName(tempValue) VALUES ('Cindy');
INSERT INTO TempFirstName(tempValue) VALUES ('Sykes');
INSERT INTO TempFirstName(tempValue) VALUES ('Lana');
INSERT INTO TempFirstName(tempValue) VALUES ('Lindsey');
INSERT INTO TempFirstName(tempValue) VALUES ('Omar');
INSERT INTO TempFirstName(tempValue) VALUES ('Schneider');
INSERT INTO TempFirstName(tempValue) VALUES ('Drew');
INSERT INTO TempFirstName(tempValue) VALUES ('Rahman');
INSERT INTO TempFirstName(tempValue) VALUES ('Avneet');
INSERT INTO TempFirstName(tempValue) VALUES ('Peralta');
INSERT INTO TempFirstName(tempValue) VALUES ('Tabatha');
INSERT INTO TempFirstName(tempValue) VALUES ('Duke');
INSERT INTO TempFirstName(tempValue) VALUES ('Lucien');
INSERT INTO TempFirstName(tempValue) VALUES ('Lennon');
INSERT INTO TempFirstName(tempValue) VALUES ('Huzaifa');
INSERT INTO TempFirstName(tempValue) VALUES ('Davis');

INSERT INTO TempLastName(tempValue) VALUES ('Diaz');
INSERT INTO TempLastName(tempValue) VALUES ('Jones');
INSERT INTO TempLastName(tempValue) VALUES ('Jenkins');
INSERT INTO TempLastName(tempValue) VALUES ('Evans');
INSERT INTO TempLastName(tempValue) VALUES ('Walker');
INSERT INTO TempLastName(tempValue) VALUES ('Cunningham');
INSERT INTO TempLastName(tempValue) VALUES ('May');
INSERT INTO TempLastName(tempValue) VALUES ('Collins');
INSERT INTO TempLastName(tempValue) VALUES ('Burke');
INSERT INTO TempLastName(tempValue) VALUES ('Anderson');
INSERT INTO TempLastName(tempValue) VALUES ('Martinez');
INSERT INTO TempLastName(tempValue) VALUES ('Mccormick');
INSERT INTO TempLastName(tempValue) VALUES ('Murray');
INSERT INTO TempLastName(tempValue) VALUES ('Love');
INSERT INTO TempLastName(tempValue) VALUES ('Aguilar');
INSERT INTO TempLastName(tempValue) VALUES ('Klein');
INSERT INTO TempLastName(tempValue) VALUES ('Swanson');
INSERT INTO TempLastName(tempValue) VALUES ('Payne');
INSERT INTO TempLastName(tempValue) VALUES ('Rivas');
INSERT INTO TempLastName(tempValue) VALUES ('Wade');
INSERT INTO TempLastName(tempValue) VALUES ('Whittaker');
INSERT INTO TempLastName(tempValue) VALUES ('Parks');
INSERT INTO TempLastName(tempValue) VALUES ('Daniels');
INSERT INTO TempLastName(tempValue) VALUES ('Ayala');
INSERT INTO TempLastName(tempValue) VALUES ('Lewis');
INSERT INTO TempLastName(tempValue) VALUES ('Gibson');
INSERT INTO TempLastName(tempValue) VALUES ('Graves');
INSERT INTO TempLastName(tempValue) VALUES ('Allison');
INSERT INTO TempLastName(tempValue) VALUES ('Mccarthy');
INSERT INTO TempLastName(tempValue) VALUES ('Abbott');
INSERT INTO TempLastName(tempValue) VALUES ('Powers');
INSERT INTO TempLastName(tempValue) VALUES ('Coleman');
INSERT INTO TempLastName(tempValue) VALUES ('Banks');
INSERT INTO TempLastName(tempValue) VALUES ('Fox');
INSERT INTO TempLastName(tempValue) VALUES ('Gallagher');
INSERT INTO TempLastName(tempValue) VALUES ('Bourne');
INSERT INTO TempLastName(tempValue) VALUES ('Maxwell');
INSERT INTO TempLastName(tempValue) VALUES ('Rodgers');
INSERT INTO TempLastName(tempValue) VALUES ('Robles');
INSERT INTO TempLastName(tempValue) VALUES ('Goodwin');
INSERT INTO TempLastName(tempValue) VALUES ('Allen');
INSERT INTO TempLastName(tempValue) VALUES ('Vasquez');
INSERT INTO TempLastName(tempValue) VALUES ('Johnson');
INSERT INTO TempLastName(tempValue) VALUES ('Davis');
INSERT INTO TempLastName(tempValue) VALUES ('Delgado');
INSERT INTO TempLastName(tempValue) VALUES ('Zimmerman');
INSERT INTO TempLastName(tempValue) VALUES ('Middleton');
INSERT INTO TempLastName(tempValue) VALUES ('Santiago');
INSERT INTO TempLastName(tempValue) VALUES ('Thomson');
INSERT INTO TempLastName(tempValue) VALUES ('Haynes');
INSERT INTO TempLastName(tempValue) VALUES ('Stanton');
INSERT INTO TempLastName(tempValue) VALUES ('Stevens');
INSERT INTO TempLastName(tempValue) VALUES ('Gutierrez');
INSERT INTO TempLastName(tempValue) VALUES ('Turner');
INSERT INTO TempLastName(tempValue) VALUES ('Brennan');
INSERT INTO TempLastName(tempValue) VALUES ('Morrison');
INSERT INTO TempLastName(tempValue) VALUES ('Howell');
INSERT INTO TempLastName(tempValue) VALUES ('Wallace');
INSERT INTO TempLastName(tempValue) VALUES ('Fletcher');
INSERT INTO TempLastName(tempValue) VALUES ('Bailey');
INSERT INTO TempLastName(tempValue) VALUES ('Mack');
INSERT INTO TempLastName(tempValue) VALUES ('Russell');
INSERT INTO TempLastName(tempValue) VALUES ('Phillips');
INSERT INTO TempLastName(tempValue) VALUES ('Fleming');
INSERT INTO TempLastName(tempValue) VALUES ('Mendoza');
INSERT INTO TempLastName(tempValue) VALUES ('Henry');
INSERT INTO TempLastName(tempValue) VALUES ('Douglas');
INSERT INTO TempLastName(tempValue) VALUES ('Figueroa');
INSERT INTO TempLastName(tempValue) VALUES ('Carpenter');
INSERT INTO TempLastName(tempValue) VALUES ('Brady');
INSERT INTO TempLastName(tempValue) VALUES ('Mcdaniel');
INSERT INTO TempLastName(tempValue) VALUES ('Gonzales');
INSERT INTO TempLastName(tempValue) VALUES ('Fisher');
INSERT INTO TempLastName(tempValue) VALUES ('Tait');
INSERT INTO TempLastName(tempValue) VALUES ('Hall');
INSERT INTO TempLastName(tempValue) VALUES ('Woods');
INSERT INTO TempLastName(tempValue) VALUES ('Watkins');
INSERT INTO TempLastName(tempValue) VALUES ('Perez');
INSERT INTO TempLastName(tempValue) VALUES ('Dunn');
INSERT INTO TempLastName(tempValue) VALUES ('Price');
INSERT INTO TempLastName(tempValue) VALUES ('Griffith');
INSERT INTO TempLastName(tempValue) VALUES ('Castro');
INSERT INTO TempLastName(tempValue) VALUES ('Baldwin');
INSERT INTO TempLastName(tempValue) VALUES ('Byrd');
INSERT INTO TempLastName(tempValue) VALUES ('Barnett');
INSERT INTO TempLastName(tempValue) VALUES ('Perry');
INSERT INTO TempLastName(tempValue) VALUES ('Hawkins');
INSERT INTO TempLastName(tempValue) VALUES ('Richards');
INSERT INTO TempLastName(tempValue) VALUES ('Houghton');
INSERT INTO TempLastName(tempValue) VALUES ('Mcgee');
INSERT INTO TempLastName(tempValue) VALUES ('Wagner');

/* DATA GENERATION PROCEDURE */
DECLARE @index INT
DECLARE @breweries_amount INT
DECLARE @min_age INT
DECLARE @max_age INT
DECLARE @min_salary FLOAT
DECLARE @max_salary FLOAT
BEGIN
	SET @index = 1;
	SET @breweries_amount = (SELECT COUNT(*) FROM Brewery)
	SET @min_age = 366 * 20;
	SET @max_age = 366 * 60;
	SET @min_salary = 2000;
	SET @max_salary = 15000;

	WHILE(@index <= 100000)
	BEGIN
		INSERT INTO dbo.Employee(address_id, brewery_id, first_name, last_name, birth_date, salary) VALUES (
			@index + @breweries_amount,
			(@index - 1) / 10 + 1,
			(SELECT tempValue FROM TempFirstName WHERE tempID = CEILING(RAND() * (SELECT COUNT(*) FROM TempFirstName))),
			(SELECT tempValue FROM TempLastName WHERE tempID = CEILING(RAND() * (SELECT COUNT(*) FROM TempLastName))),
			GETDATE() - FLOOR(RAND() * (@max_age - @min_age)) + @min_age,
			RAND() * (@max_salary - @min_salary) + @min_salary
			);
		SET @index = @index + 1;
	END
END

DROP TABLE TempFirstName;
DROP TABLE TempLastName;