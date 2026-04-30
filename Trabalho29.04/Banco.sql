CREATE DATABASE Formulario_db;
USE Formulario_db;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    senha VARCHAR(100)
);
