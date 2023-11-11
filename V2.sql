CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    categoria VARCHAR(50)
);

CREATE TABLE estoque (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO produtos (nome, preco_unitario, categoria) 
VALUES
('Cheetos', 5.35, 'Comida'),
('Smartband', 30.11, 'Acessórios'),
('Pen-drive 4gb', 25.99, 'Informática'),
('Fini', 4.99, 'Comida');

INSERT INTO estoque (quantidade) 
VALUES
(100),
(54),
(800),
(120);

CREATE VIEW estoque_critico AS
SELECT
    p.nome AS nome_produto,
    e.quantidade AS quantidade_em_estoque
FROM
    produtos p
JOIN
    estoque e ON p.id_produto = e.id_produto
WHERE
    e.quantidade < 2;
