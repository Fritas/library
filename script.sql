CREATE SCHEMA library CHAR SET latin1 COLLATE latin1_general_cs;

USE library;

-- livro
CREATE TABLE book (
	cod_book INT PRIMARY KEY AUTO_INCREMENT,
    ISBN_10 CHAR(10) UNIQUE,
    ISBN_13 CHAR(14) UNIQUE,
    title_english VARCHAR(50),
    title_portuguese VARCHAR(50)	
);

-- editora
CREATE TABLE publisher (
	cod_publisher INT PRIMARY KEY AUTO_INCREMENT,
    name_publisher VARCHAR(20)
);

-- pessoa
CREATE TABLE person (
	cod_person INT PRIMARY KEY AUTO_INCREMENT,
    name_person VARCHAR(30),
    date_of_day DATE
);

-- area do conhecimento
CREATE TABLE knowledgeArea (
	cod_knowledgeArea INT PRIMARY KEY AUTO_INCREMENT,
    description_knowledgeArea INT 
);

-- COM FK ---------------------

-- autor
CREATE TABLE author (
	cod_author INT PRIMARY KEY AUTO_INCREMENT,
    cod_person INT NOT NULL,
    FOREIGN KEY (cod_person) REFERENCES person(cod_person)
);

-- publicações
CREATE TABLE publications (
	cod_book INT,
    cod_publisher INT,
    PRIMARY KEY (cod_book, cod_publisher)
);

-- autoria
CREATE TABLE authorship (
	cod_book INT, 
    cod_author INT,
    PRIMARY KEY (cod_book, cod_author)
);
