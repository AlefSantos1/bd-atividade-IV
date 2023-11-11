CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

DELIMITER //
CREATE TRIGGER after_insert_emprestimo
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    UPDATE livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id_livro = NEW.id_livro;
END;
//
DELIMITER ;