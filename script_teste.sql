USE library;

-- livro
INSERT INTO book (ISBN_10, ISBN_13, title_original, title_portuguese) VALUES
	('854330119X', '9788543301198','Nachfolge','Discipulado');
    
INSERT INTO book (ISBN_13, title_original, title_portuguese) VALUES
    ('9788526311145','Rastros de Fogo','Rastros de Fogo'),
    ('9788569215004','Você Não Precisa de Um Chamado Missionário','Você Não Precisa de Um Chamado Missionário');

-- editora
INSERT INTO publisher (name_publisher, website) VALUES
	('Mundo Cristão', 'http://www.mundocristao.com.br'),
    ('CPAD', 'https://www.cpad.com.br/'),
    ('BTBooks', 'http://bibotalk.com/');

-- pessoa
INSERT INTO person (name_person) VALUES
	('José Gonçalves'),
    ('Dietrich Bonnhoeffer'),
    ('Yago Martins'),
    ('Adriano Damasceno da Silva Júnior');

-- area do conhecimento
INSERT INTO category (description_category) VALUES
	('Apologética Cristã'),
    ('Vida Cristã'),
    ('Missiologia'),
    ('Exegese'),
    ('Evangelismo');

-- autor
INSERT INTO author (cod_person, name_author) VALUES
	(1, 'José Gonçalves'),
    (2, 'Dietrich Bonnhoeffer'),
    (3, 'Yago Martins');

-- usuario
INSERT INTO  user (cod_person, username_user, password_user) VALUES
	(4, 'Fritas', 'fritas');


-- publicações
INSERT INTO publications (cod_book, cod_publisher) VALUES 
	(1, 1),
    (2, 2),
    (3, 3);

-- autoria
INSERT INTO authorship (cod_book, cod_author) VALUES
	(1, 2),
    (2, 1),
    (3, 3);

INSERT INTO myBooks (cod_book, cod_user) VALUES
	(1, 1),
    (2, 1),
    (3, 1);


SELECT b.title_original, p1.name_publisher, a.name_author
	FROM book b
    INNER JOIN publications p ON p.cod_book = b.cod_book
    INNER JOIN publisher p1 ON p1.cod_publisher = p.cod_publisher
    INNER JOIN authorship a1 ON a1.cod_book = b.cod_book
    INNER JOIN author a ON a.cod_author = a1.cod_author;

SELECT * FROM publisher;