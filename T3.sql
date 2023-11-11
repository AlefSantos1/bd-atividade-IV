CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    data_admissao DATE
);

DELIMITER //
CREATE TRIGGER before_insert_funcionario
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A data de admissão é maior que a data atual.';   
        END IF;
END;
//
DELIMITER ;
