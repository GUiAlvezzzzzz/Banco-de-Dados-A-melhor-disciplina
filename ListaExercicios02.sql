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
