--criar um banco de dados
CREATE DATABASE farmacianova;

--criando a primeira tabela
CREATE TABLE
  farmacia (
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
CREATE TABLE
  farmaceutico (
    rg INT PRIMARY KEY,
    nomefarmaceutico VARCHAR(255) NOT NULL,
    cnpj_farmacia VARCHAR(14),
    FOREIGN KEY (cnpj_farmacia) REFERENCES farmacia (cnpj)
  );

--criando a terceira tabela
CREATE TABLE
  produto (
    codproduto INT AUTO_INCREMENT PRIMARY KEY,
    quantproduto INT NOT NULL,
    valorproduto DECIMAL(10, 2) NOT NULL,
    cnpj_farmacia VARCHAR(14),
    FOREIGN KEY (cnpj_farmacia) REFERENCES farmacia (cnpj)
  );
  
--Alterando o nome de uma coluna existente
ALTER TABLE farmacia CHANGE estado UF CHAR(2) NOT NULL;

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
  famaceutico (rg, nomefarmaceutico, cnpj_farmacia)
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
update farmacia
set
  telefone = '11999998888'
where
  cnpj = '12345678000199';

update produto
set
  quantproduto = 80,
  valorproduto = 14.50
where
  codproduto = 1;
  
-- selecionando todos os dados de todas as coulnas
SELECT * FROM farmacia;

-- selecionando dados de uma coluna
SELECT nomefarmacia
FROM farmacia;

-- selecionando dados de duas coluna
SELECT nomefarmacia,cidade
FROM farmacia;

-- selecionando com filtro
SELECT * FROM farmacia
WHERE cidade = 'São Paulo';

SELECT * FROM farmacia
WHERE cidade = 'São paulo' AND UF = 'SP';


SELECT * FROM farmacia
WHERE cidade ='São Paulo' OR cidade = 'Campinas';

SELECT telefone
FROm farmacia
WHERE cidade = 'São Paulo' OR cidade = 'Campinas';


-- selecionado com BETWEEN (entre) e AND
SELECT * FROM produto
WHERE valorproduto BETWEEN 10.00 AND 30.00;

-- select com maior que (>)
SELECT * FROM produto
WHERE valorproduto > 20.00;

-- select com igual a (=)
SELECT * FROM produto
WHERE valorproduto = 45.40;

-- select menor ou igual a (<=)
SELECT * FROM produto
WHERE valorproduto <= 50;


-- select combinando > AND <=
SELECT * FROM produto
WHERE valorproduto > 10.00 AND valorproduto <= 30.00;

-- Select com WHERE e LIKE
SELECT * FROM farmacia
WHERE nomefarmacia LIKE 'farmacia%';

-- Select com WHERE e LIKE
SELECT * FROM farmacia
WHERE nomefarmacia LIKE '%Vida%';

SELECT * FROM farmacia
WHERE nomefarmacia LIKE '%a%';

-- selecionado com ordem ascendente/crescente
SELECT * FROM farmacia
ORDER BY nomefarmacia ASC;

-- selecionando com ordem descendente /decrescente
SELECT * FROM produto
ORDER BY valorproduto DESC;

-- selecionado com limite
SELECT * FROM produto
LIMIT 2

-- selecionado com WHERE < ORDER BY e LIMIT juntos
SELECT * FROM produto
WHERE valorproduto > 20.00
ORDER BY valorproduto DESC
LIMIT 1;

--  select JOIN ON
SELECT * FROM farmacia
JOIN produto
ON farmacia.cnpj = produto.cnpj_farmacia;

-- select INNER JOIN ON   PRECISO CORRIGIR O FAMACEUTICO
SELECT * FROM farmacia
INNER JOIN famaceutico
ON farmacia.cnpj = famaceutico.cnpj_farmacia;


-- SELECT inner join COM WHERE
SELECT nomefarmacia, nomefarmaceutico
FROM Farmacia
INNER JOIN famaceutico
ON farmacia.cnpj = famaceutico.cnpj_farmacia
WHERE farmacia.cidade = 'São Paulo';

--select INNER JOIN com ORDER BY ASC
SELECT nomefarmacia,valorproduto
FROM Farmacia
INNER JOIN produto
ON farmacia.cnpj =produto.cnpj_farmacia
ORDER BY valorproduto ASC;








  -- deletando um dado de uma tabela
  delete from produto
  where codproduto = 4
  
  INSERT INTO
  produto (
    quantproduto,
    valorproduto,
    cnpj_farmacia
  )VALUES
  (
    25,
    45.40,
    '32165498000166'
  )
  