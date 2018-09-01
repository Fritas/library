USE library;

-- livro
INSERT INTO book (ISBN_10, ISBN_13, title_portuguese)
	VALUES ();

-- editora
INSERT INTO publisher (name_publisher)
	VALUES ();

-- pessoa
INSERT INTO person (name_person)
	VALUES ();

-- area do conhecimento
INSERT INTO knowledgeArea (description_knowledgeArea)
	VALUES ();

-- autor
INSERT INTO author (cod_person)
	VALUES ();

-- publicações
INSERT INTO publications (cod_book, cod_publisher)
	VALUES ();

-- autoria
INSERT INTO authorship (cod_book, cod_author)
	VALUES ();
