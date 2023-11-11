CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

INSERT INTO categorias (id_categoria, nome_categoria, descricao)
VALUES
(1, 'Eletrônicos', 'Produtos eletrônicos em geral'),
(2, 'Acessórios', 'Acessórios diversos'),
(3, 'Móveis', 'Móveis para casa'),
(4, 'Roupas', 'Roupas e acessórios');

INSERT INTO produtos (id_produto, nome, preco_unitario, id_categoria) 
VALUES
(1, 'Computador', 5240.00, 1),
(2, 'Pulseira', 30.00, 2),
(3, 'Cama', 250.50, 3),
(4, 'Short', 41.22, 4),

CREATE VIEW relatorio_produtos_categoria AS
SELECT
    c.nome_categoria AS nome_categoria,
    COUNT(p.id_produto) AS quantidade_produtos
FROM
    categorias c
LEFT JOIN
    produtos p ON c.id_categoria = p.id_categoria
GROUP BY
    c.id_categoria;

SELECT * FROM relatorio_produtos_categoria;