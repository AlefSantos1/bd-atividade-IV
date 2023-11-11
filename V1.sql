CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(22)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (nome, email, telefone) 
VALUES
('Gustavo', 'gusta@gmail.com', '(71) 99232-3493'),
('Benaia', 'bena@gmail.com', '(71) 98625-4563'),
('Naamá', 'naa@gmail.com', '(71) 99348-4683'),
('Pedro', 'pedri@gmail.com', '(71) 99563-3373');

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) 
VALUES
(1, '2023-08-01', 1000.50),
(1, '2023-07-03', 750.20),
(2, '2023-06-11', 59.99),
(3, '2023-05-05', 121.75),
(4, '2023-04-07', 99.32),
(2, '2023-03-11', 33.54),
(3, '2023-02-10', 67.89),
(4, '2023-01-09', 45.25);


CREATE VIEW relatorio_pedidos_cliente AS
SELECT
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS num_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM
    clientes c
JOIN
    pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente;
    
SELECT * FROM relatorio_pedidos_cliente;