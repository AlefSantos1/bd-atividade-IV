CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

DELIMITER //
CREATE TRIGGER before_insert_matricula
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE idade_aluno INT;
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) INTO idade_aluno
    FROM alunos
    WHERE id_aluno = NEW.id_aluno;

    IF idade_aluno < NEW.serie + 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Aluno não atende aos requisitos de idade para a série.';
    END IF;
END;
//
DELIMITER ;
