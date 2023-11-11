CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    cidade VARCHAR(255)
);

CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    data_pagamento DATE,
    valor_pagamento DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (id_cliente, nome, endereco, cidade) 
VALUES
(1, 'Barreto', 'Rua da Amarelinha', 'Salvador'),
(2, 'Costa', 'Rua Azul', 'São Paulo'),
(3, 'Ferreira', 'Rua Rosa', 'Rio de Janeiro'),
(4, 'Santos', 'Rua Verde', 'Santa Catarina');

INSERT INTO pagamentos (id_cliente, data_pagamento, valor_pagamento) 
VALUES
(1, '2023-01-07', 122.50),
(2, '2023-07-01', 75.34),
(3, '2023-01-01', 56.64),
(4, '2023-03-03', 1265.65),
(1, '2023-04-09', 954.25),
(2, '2023-06-08', 30.25),
(3, '2023-11-11', 66.25),
(4, '2023-10-02', 3463.65);

CREATE VIEW relatorio_pagamentos_cidade AS
SELECT
    c.cidade AS nome_cidade,
    SUM(p.valor_pagamento) AS valor_total_pagamentos
FROM
    clientes c
LEFT JOIN
    pagamentos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.cidade;

SELECT * FROM relatorio_pagamentos_cidade;
