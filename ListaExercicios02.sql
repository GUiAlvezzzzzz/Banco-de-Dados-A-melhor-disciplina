DROP DATABASE IF EXISTS BibliotecaPessoal;
CREATE DATABASE IF NOT EXISTS BibliotecaPessoal;

USE BibliotecaPessoal;

CREATE TABLE Autor (
 Autor_ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(255) NOT NULL,
 Sobrenome VARCHAR(255) NOT NULL,
 Data_Nascimento DATE,
 Nacionalidade VARCHAR(100)
);

CREATE TABLE Categoria (
 Categoria_ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Editora (
 Editora_ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(255) NOT NULL,
 Endereco VARCHAR(255),
 Contato VARCHAR(100)
);

CREATE TABLE Livro (
 Livro_ID INT AUTO_INCREMENT PRIMARY KEY,
 Titulo VARCHAR(255) NOT NULL,
 Editora_ID INT,
 Ano_Publicacao INT,
 Numero_Paginas INT,
 Categoria_ID INT,
 CONSTRAINT `FK_LIVRO_REF_EDITORA` FOREIGN KEY (Editora_ID) REFERENCES Editora(Editora_ID),
 CONSTRAINT `FK_LIVRO_REF_CATEGORIA`FOREIGN KEY (Categoria_ID) REFERENCES Categoria(Categoria_ID)
);

CREATE TABLE Autor_Livro (
 Autor_Livro_ID INT AUTO_INCREMENT PRIMARY KEY,
 Autor_ID INT,
 Livro_ID INT,
 FOREIGN KEY (Autor_ID) REFERENCES Autor(Autor_ID),
 FOREIGN KEY (Livro_ID) REFERENCES Livro(Livro_ID)
);

USE BibliotecaPessoal;

DROP DATABASE IF EXISTS BibliotecaPessoal;
CREATE DATABASE IF NOT EXISTS BibliotecaPessoal;

USE BibliotecaPessoal;

CREATE TABLE Autor (
 Autor_ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(255) NOT NULL,
 Sobrenome VARCHAR(255) NOT NULL,
 Data_Nascimento DATE,
 Nacionalidade VARCHAR(100)
);

CREATE TABLE Categoria (
 Categoria_ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Editora (
 Editora_ID INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(255) NOT NULL,
 Endereco VARCHAR(255),
 Contato VARCHAR(100)
);

CREATE TABLE Livro (
 Livro_ID INT AUTO_INCREMENT PRIMARY KEY,
 Titulo VARCHAR(255) NOT NULL,
 Editora_ID INT,
 Ano_Publicacao INT,
 Numero_Paginas INT,
 Categoria_ID INT,
 CONSTRAINT `FK_LIVRO_REF_EDITORA` FOREIGN KEY (Editora_ID) REFERENCES Editora(Editora_ID),
 CONSTRAINT `FK_LIVRO_REF_CATEGORIA`FOREIGN KEY (Categoria_ID) REFERENCES Categoria(Categoria_ID)
);

CREATE TABLE Autor_Livro (
 Autor_Livro_ID INT AUTO_INCREMENT PRIMARY KEY,
 Autor_ID INT,
 Livro_ID INT,
 FOREIGN KEY (Autor_ID) REFERENCES Autor(Autor_ID),
 FOREIGN KEY (Livro_ID) REFERENCES Livro(Livro_ID)
);

USE BibliotecaPessoal;


INSERT INTO Autor (Nome, Sobrenome, Data_Nascimento, Nacionalidade)
VALUES ('Joaquim', 'Silva', '1970-05-01', 'Brasileiro'),
    ('Maria', 'Pereira', '1980-06-12', 'Portuguesa'),
    ('Paulo', 'Ribeiro', '1960-04-23', 'Brasileiro'),
    ('Ana', 'Fernandes', '1990-02-18', 'Brasileira'),
    ('Miguel', 'Costa', '1975-12-09', 'Português'),
    ('Luciana', 'Dias', '1988-11-05', 'Brasileira'),
    ('Roberto', 'Santos', '1950-08-14', 'Brasileiro'),
    ('Carolina', 'Oliveira', '1995-07-24', 'Brasileira'),
    ('José', 'Mendes', '1965-03-30', 'Português'),
    ('Teresa', 'Castro', '1985-09-15', 'Portuguesa');

INSERT INTO Editora (Nome, Endereco, Contato)
VALUES ('Editora Alpha', 'Rua ABC, 123', '+123456789'),
    ('Editora Beta', 'Avenida XYZ, 456', '+987654321');

INSERT INTO Categoria (Nome)
VALUES ('Romance'),
    ('Ciência'),
    ('Ficção Científica'),
    ('História'),
    ('Autoajuda');

INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
VALUES ('A Jornada', 1, 2000, 320, 1),
    ('Além do Cosmos', 2, 2010, 500, 3),
    ('História de Roma', 1, 1995, 400, 4),
    ('Conquistando Sonhos', 2, 2020, 250, 5),
    ('Estrelas Caídas', 1, 2015, 350, 3),
    ('A Mente Poderosa', 2, 2020, 280, 5),
    ('O Mar e o Amor', 1, 2005, 310, 1),
    ('Descobrindo Partículas', 2, 2018, 480, 2),
    ('Planetas Distantes', 2, 2019, 370, 3),
    ('O Império das Sombras', 1, 2017, 450, 1),
    ('Revolução das Ideias', 1, 2008, 320, 2),
    ('Labirinto do Tempo', 2, 2011, 300, 3),
    ('Amores Perdidos', 1, 2004, 290, 1),
    ('DNA: O Código da Vida', 2, 2013, 420, 2),
    ('Galáxias Desconhecidas', 1, 2016, 380, 3),
    ('O Legado', 2, 2002, 340, 1),
    ('Guerras Passadas', 1, 1998, 450, 4),
    ('Poder Interior', 2, 2021, 260, 5),
    ('Teoria Quântica', 1, 2007, 500, 2),
    ('As Aventuras no Espaço', 2, 2014, 360, 3);

INSERT INTO Autor_Livro (Autor_ID, Livro_ID)
VALUES (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (1, 11),
    (2, 12),
    (3, 13),
    (4, 14),
    (5, 15),
    (6, 16),
    (7, 17),
    (8, 18),
    (9, 19),
    (10, 20);

CREATE PROCEDURE sp_ListarAutores
AS
BEGIN
    SELECT Nome, Sobrenome
    FROM Autor;
END;      

CREATE PROCEDURE sp_LivrosPorCategoria
    @Categoria NVARCHAR(255)
AS
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN CategoriaLivro ON Livro.Livro_ID = CategoriaLivro.Livro_ID
    INNER JOIN Categoria ON CategoriaLivro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = @Categoria;
END;           

CREATE PROCEDURE sp_ContarLivrosPorCategoria
    @Categoria NVARCHAR(255)
AS
BEGIN
    SELECT COUNT(Livro.Livro_ID) AS TotalLivros
    FROM Livro
    INNER JOIN CategoriaLivro ON Livro.Livro_ID = CategoriaLivro.Livro_ID
    INNER JOIN Categoria ON CategoriaLivro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = @Categoria;
END;                 

-- Esta stored procedure verifica se uma categoria possui livros.
-- Ela aceita um parâmetro de entrada @Categoria que especifica a categoria a ser verificada.
CREATE PROCEDURE sp_VerificarLivrosCategoria
    @Categoria NVARCHAR(255)
AS
BEGIN
-- Verifica se existem livros associados à categoria fornecida.
    IF EXISTS (
        SELECT 1
        FROM Livro
        INNER JOIN CategoriaLivro ON Livro.Livro_ID = CategoriaLivro.Livro_ID
        INNER JOIN Categoria ON CategoriaLivro.Categoria_ID = Categoria.Categoria_ID
        WHERE Categoria.Nome = @Categoria
    )
    BEGIN
  -- Se livros forem encontrados, imprime uma mensagem informando que a categoria possui livros.
        PRINT 'A categoria possui livros.';
    END
    ELSE
    BEGIN
    -- Se nenhum livro for encontrado, imprime uma mensagem informando que a categoria não possui livros.
        PRINT 'A categoria não possui livros.';
    END;               

CREATE PROCEDURE sp_LivrosAteAno
    @AnoPublicacao INT
AS
BEGIN
    SELECT Titulo
    FROM Livro
    WHERE Ano_Publicacao <= @AnoPublicacao;
END;                    

CREATE PROCEDURE sp_TitulosPorCategoria(IN CategoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = CategoriaNome;
END;

 CREATE PROCEDURE sp_AdicionarLivro
    @Titulo NVARCHAR(255),
    @EditoraID INT,
    @AnoPublicacao INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao)
        VALUES (@Titulo, @EditoraID, @AnoPublicacao);
        PRINT 'Livro adicionado com sucesso.';
    END TRY
    BEGIN CATCH
        PRINT 'Erro ao adicionar o livro. Certifique-se de que o título seja único.';
    END CATCH;
END;                               

CREATE PROCEDURE sp_AutorMaisAntigo
AS
BEGIN
    SELECT TOP 1 Nome, Sobrenome
    FROM Autor
    ORDER BY Data_Nascimento ASC;
END;                                                                 
