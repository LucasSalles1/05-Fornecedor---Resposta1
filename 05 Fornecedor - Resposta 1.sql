
-- ==========================================
-- 1. CRIAR O BANCO DE DADOS E A TABELA
-- ==========================================

CREATE DATABASE IF NOT EXISTS EmpresaAviacao;
USE EmpresaAviacao;

DROP TABLE IF EXISTS Voo;

CREATE TABLE Voo (
    id INT,
    partida VARCHAR(256),
    destino VARCHAR(256),
    data_partida VARCHAR(20),
    data_volta VARCHAR(20),
    valor DECIMAL(10, 2)
);

-- ==========================================
-- 2. INSERIR OS DADOS
-- ==========================================

INSERT INTO Voo (id, partida, destino, data_partida, data_volta, valor) VALUES
(1, 'Belo Horizonte, MG', 'Fortaleza', '2027-03-10', '2028-01-15', 750.00),
(2, 'Cuiabá', 'Curitiba', '2027-05-20', '2027-06-01', 900.00),
(3, 'Palmas - Tocantins', 'Salvador', '2026-11-05', NULL, 450.00),
(4, 'Belém - Pará', 'Aracajú', '2027-01-10', '2028-02-20', 1300.00),
(5, 'São Paulo', 'Porto Alegre - Rio Grande do Sul', '2026-12-01', NULL, 1100.00),
(6, 'Uberlândia - Minas Gerais', 'Vitoria', '2027-08-15', '2028-09-10', 600.00);

-- ==========================================
-- 3. CONSULTAS (SELECT)
-- ==========================================

-- Partida de Belo Horizonte
SELECT *
FROM Voo
WHERE partida LIKE '%Belo Horizonte%';

-- Destino Fortaleza
SELECT *
FROM Voo
WHERE destino LIKE '%Fortaleza%';

-- Viagem de volta agendada
SELECT *
FROM Voo
WHERE data_volta IS NOT NULL;

-- Valor abaixo de R$ 950,00
SELECT *
FROM Voo
WHERE valor < 950.00;

-- Valor acima de R$ 1.200,00
SELECT *
FROM Voo
WHERE valor > 1200.00;

-- Valor entre R$ 500,00 e R$ 800,00
SELECT *
FROM Voo
WHERE valor >= 500.00 AND valor <= 800.00;

-- Partida agendada para 2027
SELECT *
FROM Voo
WHERE data_partida LIKE '2027%';

-- Volta agendada para 2028
SELECT *
FROM Voo
WHERE data_volta LIKE '2028%';

-- Partida de Cuiabá e destino Curitiba
SELECT *
FROM Voo
WHERE partida LIKE '%Cuiabá%'
  AND destino LIKE '%Curitiba%';

-- Partida de Minas Gerais
SELECT *
FROM Voo
WHERE partida LIKE '%Minas Gerais%'
   OR partida LIKE '%MG%';

-- Destino Rio Grande do Sul
SELECT *
FROM Voo
WHERE destino LIKE '%Rio Grande do Sul%'
   OR destino LIKE '%RS%';

-- Partida de Tocantins ou do Pará
SELECT *
FROM Voo
WHERE partida LIKE '%Tocantins%'
   OR partida LIKE '%Pará%';

-- Destino Salvador ou Aracajú
SELECT *
FROM Voo
WHERE destino LIKE '%Salvador%'
   OR destino LIKE '%Aracajú%';

-- Viagem de volta não agendada
SELECT *
FROM Voo
WHERE data_volta IS NULL;

-- Substring "es" na cidade/estado de partida
SELECT *
FROM Voo
WHERE partida LIKE '%es%';

-- Substring "ta" na cidade/estado de destino
SELECT *
FROM Voo
WHERE destino LIKE '%ta%';

-- Substring "or" na cidade/estado de partida ou destino
SELECT *
FROM Voo
WHERE partida LIKE '%or%'
   OR destino LIKE '%or%';
