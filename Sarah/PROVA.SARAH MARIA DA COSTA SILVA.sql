/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 3/3
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 3/3
Liste o nome e data de nascimento de todos os alunos - 3/3
Liste todas as colunas de todos os cursos - 3/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 6/6
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 0/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 0/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 0/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 6/6

Total: 42
*/

CREATE DATABASE senai_bp;

USE senai_bp;

CREATE TABLE cursos (
cod_curso INT,PRIMARY KEY (cod_curso),
nome_curso VARCHAR(100)
);

CREATE TABLE alunos (
cod_aluno INT,PRIMARY KEY(cod_aluno),
nome VARCHAR(45),
sobrenome VARCHAR(45),
data_nascimento DATE,
cod_curso INT,
FOREIGN KEY (cod_curso) REFERENCES cursos(cod_curso)
);

DROP DATABASE senai_bp;

#2)Faça o cadastro dos seguintes cursos.
INSERT INTO cursos VALUES (101,'Introdução ao Desenvolvimento de Projetos'),
(102,'Inglês Técnico Aplicado ao Desenvolvimento de Sistemas'),
(103,'Higiene do Alimento:Microbiologia de Alimentos'),
(104,'Ferramentas Digitais de Gestão'),
(105,'Introdução a IOT para Manuetenção Industrial'),
(106,'Introdução à Industria 4.0'),
(107,'Administrador de Bancos de Dados');

#3
select * from alunos;


# 4)Faça o cadastro do seu curso nesse banco de dados.
INSERT INTO cursos VALUES(108,'Programador de Back-End');
select * from cursos;

#5)Faça o cadastro do seu curso nesse banco de dados.
INSERT INTO alunos VALUES (1002,'Sarah','Maria','2006-01-26',108);
UPDATE `senai_bpalunos` SET `cod_aluno` = '1100' WHERE (`cod_aluno` = '1002');

#1-Liste o nome e data de nascimento de  todos os alunos

SELECT Nome,data_nascimento AS 'Data de Nascimento' from alunos;

#2-Liste todas as colunas de todos os cursos
select * from cursos;

#3-Lista nome, sobrenome dos alunos  ordenado pelo nome
SELECT nome,sobrenome from alunos ORDER BY nome ASC;

#4-Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo.
SELECT * FROM alunos ORDER BY data_nascimento DESC LIMIT 1;
SELECT * FROM alunos ORDER BY data_nascimento ASC LIMIT 1;

#5-Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento
SELECT * FROM alunos WHERE data_nascimento > 1998 order by data_nascimento asc;

#6-liste somente alunos que são menores de  idade e são do curso “Introdução à  Industria 4.0”ordenado pelo nome
SELECT * FROM alunos WHERE data_nascimento < 2005 AND (cod_curso =106) ORDER BY nome;

#7-Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso
SELECT * FROM alunos WHERE (data_nascimento < 18) AND cod_curso =106 OR cod_curso=104 ORDER BY cod_curso;

#8-Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0
SELECT * FROM cursos WHERE cod_curso=106 or cod_curso= 104;








