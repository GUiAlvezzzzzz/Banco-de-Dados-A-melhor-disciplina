CREATE PROCEDURE sp_LivrosAteAno
    @AnoPublicacao INT
AS
BEGIN
    SELECT Titulo
    FROM Livro
    WHERE Ano_Publicacao <= @AnoPublicacao;
END;                       
