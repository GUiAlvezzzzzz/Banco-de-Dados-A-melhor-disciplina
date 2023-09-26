CREATE PROCEDURE sp_AutorMaisAntigo
AS
BEGIN
    SELECT TOP 1 Nome, Sobrenome
    FROM Autor
    ORDER BY Data_Nascimento ASC;
END;                                                                 
