CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade_estoque INT
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME
);

CREATE TABLE itens_venda (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

DELIMITER //
CREATE TRIGGER before_insert_item_venda
BEFORE INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    SELECT quantidade_estoque INTO estoque_atual
    FROM produtos
    WHERE id_produto = NEW.id_produto;

    IF estoque_atual < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Produto não tem estoque.';
    END IF;
END;
//
DELIMITER ;
