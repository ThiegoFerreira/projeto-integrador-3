CREATE DATABASE Universidade;
USE Universidade;


CREATE TABLE pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefone VARCHAR(20)
);


CREATE TABLE pessoafisica (
    id_pessoa INT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);


CREATE TABLE pessoajuridica (
    id_pessoa INT PRIMARY KEY,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);


CREATE TABLE aluno (
    id_pessoa INT PRIMARY KEY,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    curso VARCHAR(255),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);


CREATE TABLE professor (
    id_pessoa INT PRIMARY KEY,
    area VARCHAR(255),
    salario DECIMAL(10,2),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
        ON DELETE CASCADE
);


CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(255)
);