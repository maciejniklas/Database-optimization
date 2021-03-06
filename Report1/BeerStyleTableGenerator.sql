/* TABLE */
CREATE TABLE dbo.BeerStyle
(
	id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(25),
	SRM INT,
	EBC INT
);

INSERT INTO BeerStyle(SRM, name, EBC) VALUES (2, 'Pale lager', 4);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (2, 'Witbier', 4);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (2, 'Pilsener', 4);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (2, 'Berliner Weisse', 4);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (3, 'Maibock', 6);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (3, 'Blonde Ale', 6);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (4, 'Weissbier', 8);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (6, 'American Pale Ale', 12);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (6, 'India Pale Ale', 12);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (8, 'Weissbier', 16);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (8, 'Saison', 16);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (10, 'English Bitter', 20);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (10, 'ESB', 20);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (13, 'Biere de Garde', 26);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (13, 'Double IPA', 26);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (17, 'Dark lager', 33);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (17, 'Vienna lager', 33);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (17, 'Marzen', 33);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (17, 'Amber Ale', 33);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (20, 'Brown Ale', 39);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (20, 'Bock', 39);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (20, 'Dunkel', 39);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (20, 'Dunkelweizen', 39);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (24, 'Irish Dry Stout', 47);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (24, 'Doppelbock', 47);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (24, 'Porter', 47);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (29, 'Stout', 57);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (35, 'Foreign Stout', 69);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (35, 'Baltic Porter', 69);
INSERT INTO BeerStyle(SRM, name, EBC) VALUES (40, 'Imperial Stout', 79);