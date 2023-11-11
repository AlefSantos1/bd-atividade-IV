CREATE TABLE contas (
    id_conta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    saldo DECIMAL(10, 2)
);

CREATE TABLE transacoes (
    id_transacao INT AUTO_INCREMENT PRIMARY KEY,
    id_conta INT,
    tipo VARCHAR(10),
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);

DELIMITER //
CREATE TRIGGER after_insert_transacao
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
    IF NEW.tipo = 'entrada' THEN
        UPDATE contas
        SET saldo = saldo + NEW.valor
        WHERE id_conta = NEW.id_conta;
    ELSEIF NEW.tipo = 'saida' THEN
        UPDATE contas
        SET saldo = saldo - NEW.valor
        WHERE id_conta = NEW.id_conta;
    END IF;
END;
//
DELIMITER ;
