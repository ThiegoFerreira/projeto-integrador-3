-- ===========================================
--     CONSULTAS ÚTEIS DO SISTEMA
--        BANCO UNIVERSIDADE
-- ===========================================

USE Universidade;

-- ======================
-- LISTAGENS SIMPLES
-- ======================

-- Listar todas as pessoas
SELECT * FROM pessoa;

SELECT * FROM aluno;

SELECT * FROM professor;

SELECT * FROM fornecedor;

SELECT * FROM pessoafisica;

SELECT * FROM pessoajuridica;

-- Listar alunos com seus dados pessoais
SELECT p.nome, p.email, a.matricula, a.curso
FROM aluno a
JOIN pessoa p ON p.id_pessoa = a.id_pessoa;

-- Listar professores com seus dados pessoais
SELECT p.nome, p.email, pr.area, pr.salario
FROM professor pr
JOIN pessoa p ON p.id_pessoa = pr.id_pessoa;

-- Listar pessoas físicas com CPF
SELECT p.nome, p.email, pf.cpf
FROM pessoafisica pf
JOIN pessoa p ON p.id_pessoa = pf.id_pessoa;

-- Listar pessoas jurídicas com CNPJ
SELECT p.nome, pj.razao_social, pj.cnpj
FROM pessoajuridica pj
JOIN pessoa p ON p.id_pessoa = pj.id_pessoa;


-- ======================
-- CONSULTAS MAIS RICAS
-- ======================

-- Buscar pessoa pelo nome (qualquer tipo)
SELECT * FROM pessoa
WHERE nome LIKE '%Silva%';

-- Contar quantos alunos existem
SELECT COUNT(*) AS total_alunos FROM aluno;

-- Contar quantos professores existem
SELECT COUNT(*) AS total_professores FROM professor;

-- Contar pessoas físicas e jurídicas
SELECT
    (SELECT COUNT(*) FROM pessoafisica) AS total_pf,
    (SELECT COUNT(*) FROM pessoajuridica) AS total_pj;


-- ======================
-- EXEMPLOS DE INSERTS
-- ======================

-- Inserir pessoa física + aluno
INSERT INTO pessoa (nome, email, telefone)
VALUES ('João da Silva', 'joao@exemplo.com', '1199999999');

INSERT INTO pessoafisica (id_pessoa, cpf, data_nascimento)
VALUES (LAST_INSERT_ID(), '123.456.789-10', '1990-05-20');

INSERT INTO aluno (id_pessoa, matricula, curso)
VALUES (LAST_INSERT_ID(), 'A12345', 'Engenharia');

-- Inserir fornecedor
INSERT INTO fornecedor (nome_fantasia, cnpj, telefone, email)
VALUES ('Fornecedor XPTO', '12.345.678/0001-90', '1133334444', 'contato@xpto.com');