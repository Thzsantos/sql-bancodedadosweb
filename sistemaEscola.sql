CREATE DATABASE escola;

CREATE TABLE pessoa_instrutora (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(180),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    telefone VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE pessoa_estudante (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(180),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    telefone VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE disciplina (
    codigo_disciplina MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf_instrutor VARCHAR(11),
    cpf_estudante VARCHAR(11),
    FOREIGN KEY (cpf_instrutor) REFERENCES pessoa_instrutora (cpf),
    FOREIGN KEY (cpf_estudante) REFERENCES pessoa_estudante (cpf)
);

ALTER TABLE pessoa_instrutora CHANGE nome nome_instrutor VARCHAR(200) NOT NULL;
ALTER TABLE pessoa_estudante CHANGE nome nome_estudante VARCHAR(200) NOT NULL;
ALTER TABLE disciplina CHANGE nome nome_disciplina VARCHAR(50) NOT NULL;

INSERT INTO pessoa_instrutora (
    cpf,
    nome_instrutor,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    cep,
    telefone
)
VALUES
(
    '73529864108',
    'Clodoaldo Santos Fernandes',
    'Monteiro Lobato',
    '80',
    'Apto 45',
    'Jardim Jacira',
    'Itapecerica da Serra',
    'SP',
    '06864310',
    '11928459053'
);

INSERT INTO pessoa_estudante (
    cpf,
    nome_estudante,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    cep,
    telefone
)
VALUES
(
    '94526411735',
    'Maria Antonieta Ferreira',
    'Rua das Flores',
    '114',
    NULL,
    'Centro',
    'São Paulo',
    'SP',
    '01000000',
    '11948573278'
);

INSERT INTO disciplina (
    nome_disciplina,
    cpf_instrutor,
    cpf_estudante
)
VALUES
(
    'Cálculo II',
    '73529864108',
    '94526411735'
);

UPDATE pessoa_estudante
SET telefone = '11453674145'
WHERE cpf = '94526411735';

DELETE FROM disciplina 
WHERE codigo_disciplina = 0;

DELETE FROM pessoa_estudante 
WHERE cpf = '94526411735';

DROP TABLE disciplina;
DROP TABLE pessoa_estudante;
DROP TABLE pessoa_instrutora;

DROP DATABASE escola;
