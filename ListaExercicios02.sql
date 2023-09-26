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
