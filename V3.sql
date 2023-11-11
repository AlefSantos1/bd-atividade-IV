CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_funcionario INT,
    data_venda DATE,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

INSERT INTO funcionarios (id_funcionario, nome, cargo, salario) 
VALUES
(1, 'Fulano', 'Vendedor', 3040.79),
(2, 'Beatriz', 'Gerente', 7990.42),
(3, 'Matt', 'Vendedor', 3300.36),
(4, 'Damian', 'Diretor', 9200.75);

INSERT INTO vendas (id_funcionario, data_venda, valor_venda)
VALUES
(1, '2023-11-11', 1000.50),
(2, '2023-02-02', 750.20),
(3, '2023-03-03', 500.00),
(4, '2023-08-05', 1200.75),

CREATE VIEW relatorio_vendas_funcionario AS
SELECT
    f.nome AS nome_funcionario,
    COUNT(v.id_venda) AS num_vendas,
    SUM(v.valor_venda) AS valor_total_vendas
FROM
    funcionarios f
JOIN
    vendas v ON f.id_funcionario = v.id_funcionario
GROUP BY
    f.id_funcionario;
    
SELECT * FROM relatorio_vendas_funcionario;
