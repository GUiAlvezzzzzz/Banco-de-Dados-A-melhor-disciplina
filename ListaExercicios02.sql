CREATE PROCEDURE sp_VerificarLivrosCategoria
    @Categoria NVARCHAR(255)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Livro
        INNER JOIN CategoriaLivro ON Livro.Livro_ID = CategoriaLivro.Livro_ID
        INNER JOIN Categoria ON CategoriaLivro.Categoria_ID = Categoria.Categoria_ID
        WHERE Categoria.Nome = @Categoria
    )
    BEGIN
        PRINT 'A categoria possui livros.';
    END
    ELSE
    BEGIN
        PRINT 'A categoria não possui livros.';
    END;               
