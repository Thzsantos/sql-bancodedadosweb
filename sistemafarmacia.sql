--criar um banco de dados
CREATE DATABASE farmacianova;

--criando a primeira tabela
CREATE TABLE farmacia (
  cnpj VARCHAR(14) PRIMARY KEY,
  telefone VARCHAR(11) NOT NULL,
  nomefarmacia VARCHAR(255) NOT NULL,
  rua VARCHAR(255) NOT NULL,
  numero CHAR(8) NOT NULL,
  complemento VARCHAR(200),
  bairro VARCHAR(100) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  estado CHAR(2) NOT NULL,
  CEP VARCHAR(8) NOT NULL
);

--criando a segunda tabela
CREATE TABLE farmaceutico (
  rg INT PRIMARY KEY,
  nomefarmaceutico VARCHAR(255) NOT NULL,
  cnpj_farmacia VARCHAR(14),
  FOREIGN KEY (cnpj_farmacia) REFERENCES farmacia (cnpj)
);

--criando a terceira tabela
CREATE TABLE produto (
  codproduto INT AUTO_INCREMENT PRIMARY KEY,
  quantproduto INT NOT NULL,
  valorproduto DECIMAL(10, 2) NOT NULL,
  cnpj_farmacia VARCHAR(14),
  FOREIGN KEY (cnpj_farmacia) REFERENCES farmacia (cnpj)
);

--Alterando o nome de uma coluna existente
ALTER TABLE
  farmacia CHANGE estado UF CHAR(2) NOT NULL;

--Inserindo um dado na primeira tabela
INSERT INTO
  farmacia (
    cnpj,
    telefone,
    nomefarmacia,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    UF,
    CEP
  )
VALUES
  (
    '12345678000199',
    '11987654321',
    'Farmácia Saúde Total',
    'Rua das Flores',
    '120',
    'Próximo ao hospital',
    'Centro',
    'São Paulo',
    'SP',
    '01001000'
  );

--Inserindo vários dados ao mesmo tempo na primeira tabela
INSERT INTO
  farmacia (
    cnpj,
    telefone,
    nomefarmacia,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    UF,
    CEP
  )
VALUES
  (
    '98765432000188',
    '11991234567',
    'Farmácia Bem Viver',
    'Avenida Paulista',
    '1500',
    'Loja 12',
    'Bela Vista',
    'São Paulo',
    'SP',
    '01310000'
  ),
  (
    '45678912000177',
    '1133445566',
    'Farmácia Popular',
    'Rua Independência',
    '350',
    NULL,
    'Jardim América',
    'Campinas',
    'SP',
    '13020010'
  ),
  (
    '32165498000166',
    '1140098877',
    'Farmácia Vida e Saúde',
    'Rua Rio Branco',
    '890',
    'Esquina com a praça',
    'Centro',
    'Santos',
    'SP',
    '11013001'
  );

--Deletando as tabelas
DROP TABLE farmacia;

DROP TABLE farmaceutico;

DROP TABLE produto;

--Deletar o banco de dados
DROP DATABASE farmacianova;

-- inserindo dois dados na segunda tabela com falha minha
INSERT INTO
  farmaceutico (rg, nomefarmaceutico, cnpj_farmacia)
VALUES
  (
    123456789,
    'Carlos Henrique almeida',
    '12345678000199'
  ),
  (
    987654321,
    'Fernanda Souza lima',
    '98765432000188'
  );

INSERT INTO
  produto (
    codproduto,
    quantproduto,
    valorproduto,
    cnpj_farmacia
  )
VALUES
  (1, 50, 12.90, '12345678000199'),
  (2, 30, 25.50, '98765432000188'),
  (3, 100, 8.75, '45678912000177'),
  (4, 20, 45.00, '32165498000166');

-- Alterando um dado na tevale farmacia
update
  farmacia
set
  telefone = '11999998888'
where
  cnpj = '12345678000199';

update
  produto
set
  quantproduto = 80,
  valorproduto = 14.50
where
  codproduto = 1;

-- selecionando todos os dados de todas as coulnas
SELECT
  *
FROM
  farmacia;

-- selecionando dados de uma coluna
SELECT
  nomefarmacia
FROM
  farmacia;

-- selecionando dados de duas coluna
SELECT
  nomefarmacia,
  cidade
FROM
  farmacia;

-- selecionando com filtro
SELECT
  *
FROM
  farmacia
WHERE
  cidade = 'São Paulo';

SELECT
  *
FROM
  farmacia
WHERE
  cidade = 'São paulo'
  AND UF = 'SP';

SELECT
  *
FROM
  farmacia
WHERE
  cidade = 'São Paulo'
  OR cidade = 'Campinas';

SELECT
  telefone
FROm
  farmacia
WHERE
  cidade = 'São Paulo'
  OR cidade = 'Campinas';

-- selecionado com BETWEEN (entre) e AND
SELECT
  *
FROM
  produto
WHERE
  valorproduto BETWEEN 10.00
  AND 30.00;

-- select com maior que (>)
SELECT
  *
FROM
  produto
WHERE
  valorproduto > 20.00;

-- select com igual a (=)
SELECT
  *
FROM
  produto
WHERE
  valorproduto = 45.40;

-- select menor ou igual a (<=)
SELECT
  *
FROM
  produto
WHERE
  valorproduto <= 50;

-- select combinando > AND <=
SELECT
  *
FROM
  produto
WHERE
  valorproduto > 10.00
  AND valorproduto <= 30.00;

-- Select com WHERE e LIKE
SELECT
  *
FROM
  farmacia
WHERE
  nomefarmacia LIKE 'farmacia%';

-- Select com WHERE e LIKE
SELECT
  *
FROM
  farmacia
WHERE
  nomefarmacia LIKE '%Vida%';

SELECT
  *
FROM
  farmacia
WHERE
  nomefarmacia LIKE '%a%';

-- selecionado com ordem ascendente/crescente
SELECT
  *
FROM
  farmacia
ORDER BY
  nomefarmacia ASC;

-- selecionando com ordem descendente /decrescente
SELECT
  *
FROM
  produto
ORDER BY
  valorproduto DESC;

-- selecionado com limite
SELECT
  *
FROM
  produto
LIMIT
  2 -- selecionado com WHERE < ORDER BY e LIMIT juntos
SELECT
  *
FROM
  produto
WHERE
  valorproduto > 20.00
ORDER BY
  valorproduto DESC
LIMIT
  1;

--  select JOIN ON
SELECT
  *
FROM
  farmacia
  JOIN produto ON farmacia.cnpj = produto.cnpj_farmacia;

-- select INNER JOIN ON   PRECISO CORRIGIR O FAMACEUTICO
SELECT
  *
FROM
  farmacia
  INNER JOIN farmaceutico ON farmacia.cnpj = farmaceutico.cnpj_farmacia;

-- SELECT inner join COM WHERE
SELECT
  nomefarmacia,
  nomefarmaceutico
FROM
  Farmacia
  INNER JOIN farmaceutico ON farmacia.cnpj = farmaceutico.cnpj_farmacia
WHERE
  farmacia.cidade = 'São Paulo';

--select INNER JOIN com ORDER BY ASC
SELECT
  nomefarmacia,
  valorproduto
FROM
  Farmacia
  INNER JOIN produto ON farmacia.cnpj = produto.cnpj_farmacia
ORDER BY
  valorproduto ASC;

-- deletando um dado de uma tabela
delete from
  produto
where
  codproduto = 4
INSERT INTO
  produto (
    quantproduto,
    valorproduto,
    cnpj_farmacia
  )
VALUES
  (25, 45.40, '32165498000166') -- criando novo usuario de banco de dados
  CREATE USER 'usuario_farmacia' @'localhost';

IDENTIFIED BY 'senha123';

-- concedendo permissoes - Total
GRANT ALL PRIVILEGES ON farmacianova.* TO 'usuario_farmacia' @'localhost';

GRANT
SELECT
  ON farmacianova.* F TO 'usuario_farmacia' @'localhost';

-- revogando permissoes de um usuario
GRANT
SELECT
,
INSERT
  ON farmacianova.* TO 'usuario_farmacia' @'localhost';

-- revogando todas as permissoes do usuario
REVOKE ALL PRIVILEGES ON farmacianova.*
FROM
  'usuario_farmacia' @'localhost';

-- Excluíndo usuário
DROP USER 'usuario_farmacia' @'localhost';

-- procedure: listar produtos de uma farmácia
DELIMITER $ $ CREATE PROCEDURE lista_produtos_farmacia (IN cnpjFarm VARCHAR (14)) BEGIN
SELECT
  codproduto,
  quantproduto,
  valorproduto
FROM
  produto
WHERE
  cnpj_farmacia = cnpjFarm;

END $ $ DELIMITER;

-- Executando o procedure
CALL lista_produtos_farmacia ('12345678000199') DELIMITER $ $ CREATE PROCEDURE atualizar_valor_produto(
  IN p_cod INT,
  IN p_valor DECIMAL(10, 2)
) BEGIN
UPDATE
  produto
SET
  valorproduto = p_valor
WHERE
  codproduto = p_cod;

END $ $ DELIMITER;

-- Executando o procedure acima
CALL atualizar_valor_produto(1, 19.90);

-- Funcition: calcular o valor total
DELIMITER $ $ CREATE FUNCTION valor_total_produto(p_cod INT) RETURNS DECIMAL (10, 2) DETERMINISTIC BEGIN DECLARE total DECIMAL (10, 2);

SELECT
  quantproduto * valorproduto INTO total
FROM
  produto
WHERE
  codproduto = p_cod;

RETURN total;

END $ $ DELIMITER;

--  usando a função acima
SELECT
  valor_total_produto(1) AS total_em_estoque;

-- Function: quantidade de produtos por farmácia
DELIMITER $ $ CREATE FUNCTION qtd_produtos_farmacia(p_cnpj VARCHAR(14)) RETURNS INT DETERMINISTIC BEGIN DECLARE total INT;

SELECT
  COUNT(*) INTO total
FROM
  produto
WHERE
  cnpj_farmacia = p_cnpj;

RETURN total;

END $ $ DELIMITER;

-- Executando a função acima
SELECT
  qtd_produtos_farmacia('12345678000199') -- Função de soma
  DELIMITER $ $ DROP FUNCTION IF EXISTS qtd_produtos_farmacia $ $ CREATE FUNCTION qtd_produtos_farmacia(p_cnpj VARCHAR(14)) RETURNS INT DETERMINISTIC BEGIN DECLARE total INT;

SELECT
  SUM(quantproduto) INTO total
FROM
  produto
WHERE
  cnpj_farmacia = p_cnpj;

RETURN total;

END $ $ DELIMITER;

-- testando a funçao acima
select
  qtd_produtos_farmacia(12345678000199) as total_em_estoque;

-- trigger: impedir quantidade negativa (BEFORE INSERT)
DELIMITER $ $ CREATE TRIGGER trg_before_insert_produto BEFORE
INSERT
  ON produto FOR EACH ROW BEGIN IF NEW.quantproduto < 0 THEN
SET
  NEW.quantproduto = 0;

END IF;

END $ $ DELIMITER;

-- tentando inserir um valor negativo 
INSERT INTO
  produto (quantproduto, valorproduto, cnpj_farmacia)
VALUES
  (-10, -20.00, '12345678000199') -- trigger: impedir valor negativo (BEFORE UPDATE)
  DELIMITER $ $ CREATE TRIGGER trg_before_update_produto BEFORE
UPDATE
  ON produto FOR EACH ROW BEGIN IF NEW.valorproduto < 0 THEN
SET
  NEW.valorproduto = OLD.valorproduto;

END IF;

END $ $ DELIMITER;

-- testando o código acima
UPDATE
  produto
SET
  valorproduto = -25.00
WHERE
  codproduto = 1;

-- view: farmacia + produto
CREATE VIEW vm_farmcia_produto AS
SELECT
  f.nomefarmacia,
  f.cidade,
  p.codproduto,
  p.quantproduto,
  p.valorproduto
FROM
  farmacia f
  INNER JOIN produto p ON f.cnpj = p.cnpj_farmacia;

-- testando o código acima
SELECT
  *
FROM
  vm_farmcia_produto;

-- View: farmácia + farmacêutico
CREATE
OR REPLACE VIEW vw_farmaceutico_farmacia AS
SELECT
  fa.nomefarmacia,
  fa.cidade,
  fm.nomefarmaceutico
FROM
  farmacia fa
  INNER JOIN farmaceutico fm ON fa.cnpj = fm.cnpj_farmacia;

-- View: produtos caros
CREATE
OR REPLACE VIEW vw_produtos_caros AS
SELECT
  *
FROM
  produto
WHERE
  valorproduto > 30;