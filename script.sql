CREATE SCHEMA IF NOT EXISTS library CHAR SET latin1 COLLATE latin1_general_cs;

USE library;

-- livro
CREATE TABLE IF NOT EXISTS book (
	cod_book INT PRIMARY KEY AUTO_INCREMENT,
    ISBN_10 CHAR(10) UNIQUE,
    ISBN_13 CHAR(13) UNIQUE,
    title_original VARCHAR(50),
    title_portuguese VARCHAR(50),
	synopsis VARCHAR(200)
);

-- editora
CREATE TABLE IF NOT EXISTS publisher (
	cod_publisher INT PRIMARY KEY AUTO_INCREMENT,
    name_publisher VARCHAR(20),
    website VARCHAR(30)
);

-- pessoa
CREATE TABLE IF NOT EXISTS person (
	cod_person INT PRIMARY KEY AUTO_INCREMENT,
    name_person VARCHAR(30),
    date_of_day DATE
);

-- area do conhecimento
CREATE TABLE IF NOT EXISTS category (
	cod_category INT PRIMARY KEY AUTO_INCREMENT,
    description_category VARCHAR(20) 
);

-- COM FK ---------------------

-- autor
CREATE TABLE IF NOT EXISTS author (
	cod_author INT PRIMARY KEY AUTO_INCREMENT,
    cod_person INT NOT NULL,
    name_author VARCHAR(20),
    FOREIGN KEY (cod_person) REFERENCES person(cod_person)
);

-- usuario
CREATE TABLE IF NOT EXISTS user (
	cod_user INT PRIMARY KEY AUTO_INCREMENT,
    cod_person INT NOT NULL,
    username_user VARCHAR(15) NOT NULL,
    password_user VARCHAR(15) NOT NULL,
    FOREIGN KEY (cod_person) REFERENCES person(cod_person)
);

-- publicações
CREATE TABLE IF NOT EXISTS publications (
	cod_book INT,
    cod_publisher INT,
    PRIMARY KEY (cod_book, cod_publisher)
);

-- autoria
CREATE TABLE IF NOT EXISTS authorship (
	cod_book INT, 
    cod_author INT,
    PRIMARY KEY (cod_book, cod_author)
);
-- categorias associadas
CREATE TABLE IF NOT EXISTS associatedCategory (
	cod_book INT,
    cod_category INT,
	PRIMARY KEY(cod_book, cod_category)
);

-- meus livros
CREATE TABLE IF NOT EXISTS myBooks (
	cod_book INT,
    cod_user INT,
	PRIMARY KEY(cod_book, cod_user)
);
