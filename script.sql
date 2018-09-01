CREATE SCHEMA library CHAR SET latin1 COLLATE latin1_general_cs;


USE library;

CREATE TABLE book (
	ISBN INT PRIMARY KEY,
    title_english VARCHAR(50),
    title_portuguese VARCHAR(50)
);

CREATE TABLE publisher (
	cod_publisher INT PRIMARY KEY,
    name_publisher VARCHAR(20)
);

CREATE TABLE author (
	
);