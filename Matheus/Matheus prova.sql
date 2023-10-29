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


CREATE DATABASE gerenciamento_aluno_curso;

USE gerenciamento_aluno_curso;

SELECT * FROM cursos;
SELECT * FROM alunos;

##Coferindo se meu cadastro foi concluido
SELECT * FROM alunos WHERE cod_curso = 108;

##Liste o nome e data de nascimento de todos os alunos
SELECT nome, data_nascimento FROM alunos; 

##Liste todas as colunas de todos os cursos
SELECT * FROM cursos;

##Lista nome, sobrenome dos alunos ordenado pelo nome
SELECT nome, sobrenome FROM alunos ORDER BY nome ASC;

##Verifique quem é o aluno mais velho
SELECT * FROM alunos ORDER BY data_nascimento ASC LIMIT 1;

##Em outra consulta veja também quem é o mais novo
SELECT * FROM alunos ORDER BY data_nascimento DESC LIMIT 1;

##Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento
SELECT * FROM alunos WHERE data_nascimento >= "1999-01-01";

##Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0”ordenado pelo nome
SELECT * FROM alunos WHERE (data_nascimento > "2006-01-01") and cod_curso = 106 ORDER BY nome ASC;

##Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso
SELECT * FROM alunos WHERE (data_nascimento > "2006-01-01") and (cod_curso = 106 or cod_curso = 104) ORDER BY cod_curso ASC;

##Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0
SELECT * FROM alunos WHERE cod_curso = 107 or cod_curso = 106;


CREATE TABLE cursos( 
	cod_curso INT,
    nome_curso VARCHAR(100),
    PRIMARY KEY (cod_curso)
);


CREATE TABLE alunos(
	cod_aluno INT,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    data_nascimento DATE,
    cod_curso INT, 
    PRIMARY KEY (cod_aluno),
    FOREIGN KEY (cod_curso) REFERENCES cursos (cod_curso)
    );
    


INSERT INTO alunos (cod_aluno, nome, sobrenome, data_nascimento, cod_curso)
VALUES	(1100, "Matheus", "Nani", "1998-06-18", 108);

INSERT INTO cursos ( cod_curso, nome_curso)
VALUES	(101, "Introdução ao Desenvolvimento de Projetos"),
		(102, "Inglês Tecnico Aplicado ao Desenvolvimento de Sistemas"),
        (103, "Higiene do Alimento: Microbiologia de Alimentos"),
        (104, "Ferramentas Digitais de Gestão"),
        (105, "Introdução a IOT para manutenção Industrial"),
        (106, "Introdução a Industria 4.0"),
        (107, "Administrador de Banco de Dados"),
        (108, "Programador Back-End");