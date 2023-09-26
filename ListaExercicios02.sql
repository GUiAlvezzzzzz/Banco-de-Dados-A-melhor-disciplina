CREATE PROCEDURE sp_TitulosPorCategoria(IN CategoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = CategoriaNome;
END;
