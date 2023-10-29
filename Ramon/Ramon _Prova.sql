/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 3/3
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 3/3
Liste o nome e data de nascimento de todos os alunos - 3/3
Liste todas as colunas de todos os cursos - 3/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 6/6
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 6/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 6/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 6/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 6/6

Total: 60
*/

-- 27/10/2023 Ramon Oliveira - Programador Back-End
CREATE DATABASE senai_bp;  -- Deixei os DESCRIBE depois da criação das tabelas e os SELECT depois das inserções para facilitar a correção!
USE senai_bp;

CREATE TABLE cursos(
		cod_curso INT,
        nome_curso VARCHAR(100),
        PRIMARY KEY(cod_curso)
);
DESCRIBE cursos;

CREATE TABLE alunos(
		cod_aluno INT,
        nome VARCHAR(45),
        sobrenome VARCHAR(45),
        data_nascimento DATE,
        cod_curso INT,
        PRIMARY KEY(cod_aluno),
        FOREIGN KEY(cod_curso) REFERENCES cursos(cod_curso)
);
DESCRIBE alunos;        
INSERT INTO cursos(cod_curso, nome_curso)
		VALUES(101, "Introdução ao Desenvolvimento de  Projetos"),
			  (102, "Inglês Técnico Aplicado ao Desenvolvimento de Sistemas"),
              (103, "Higiene do Alimento: Microbiologia de Alimentos"),
              (104, "Ferramentas Digitais de Gestão"),
              (105, "Introdução ao IOT para Manutenção Industrial"),
              (106, "Introdução à Indústria 4.0"),
              (107, "Administrador de Banco de Dados")
;

INSERT INTO cursos(cod_curso, nome_curso)
		VALUES(108, "Programador Back-End")
;
SELECT * FROM cursos;

INSERT INTO alunos(cod_aluno, nome, sobrenome, data_nascimento, cod_curso)
		VALUES(1100, "Ramon", "Oliveira", "1994-10-24", 108)
;
SELECT * FROM alunos;
SELECT * FROM alunos where nome = "Ramon";

-- Liste o nome e data de nascimento de todos os alunos
SELECT nome, data_nascimento from alunos;

-- Liste todas as colunas de todos os cursos 
SELECT * FROM cursos;

-- Lista nome, sobrenome dos alunos ordenado pelo nome
SELECT nome, sobrenome FROM alunos ORDER BY nome ASC;

-- Verifique quem é o aluno mais velho. OBS.: Deverá retornar somente um
SELECT * FROM alunos ORDER BY data_nascimento ASC LIMIT 1;

-- Verifique quem é o aluno mais novo. OBS.: Deverá retornar somente um
SELECT * FROM alunos ORDER BY data_nascimento DESC LIMIT 1;

-- Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento
SELECT * FROM alunos WHERE data_nascimento > '1998-12-31' ORDER BY data_nascimento ASC;

-- Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0”ordenado pelo nome (Coloquei dia e mês referentes ao dia da prova!)
SELECT * FROM alunos WHERE data_nascimento > '2005-10-27' AND cod_curso = 106 ORDER BY nome ASC;

-- Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso
SELECT * FROM alunos WHERE data_nascimento > '2005-10-27' AND (cod_curso = 106 or cod_curso = 104) ORDER BY cod_curso ASC;

-- Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 
SELECT * FROM cursos WHERE nome_curso = "Administrador de Banco de Dados" or nome_curso = "Introdução à Indústria 4.0";