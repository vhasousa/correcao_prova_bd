/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 2,5/3 *faltou cadastrar o seu proprio curso e colocar este como seu curso
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 2,5/3 *o cod_curso deveria ser o seu curso
Liste o nome e data de nascimento de todos os alunos - 0/3
Liste todas as colunas de todos os cursos - 0/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 0/6
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 3/6 *faltou ordenar
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 6/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 6/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 6/6

Total: 44
*/

drop database senai_bp;
CREATE DATABASE senai_bp;
USE senai_bp;
DROP TABLE cursos;
DROP TABLE alunos;

CREATE TABLE cursos (
	cod_curso INT,
    nome_curso VARCHAR(100),
    PRIMARY KEY (cod_curso)
);

CREATE TABLE alunos (
	cod_aluno INT,
	nome VARCHAR(45),
	sobrenome VARCHAR(45),
	data_nascimento DATE,
    cod_curso INT,
	PRIMARY KEY (cod_aluno),
    FOREIGN KEY (cod_curso) REFERENCES cursos(cod_curso)
);

INSERT INTO cursos (cod_curso, nome_curso)
VALUES
	(101, "Introdução ao Desenvolvimento de Projetos"),
    (102, "Inglês Técnico Aplicado ao Desenvolvimento de Sistemas"),
    (103, "Higiene do Alimento; Microbiologia de Alimentos"),
    (104, "Ferramentas Digitais de Gestão"),
    (105, "Introduçãoa IOT para manutenção Industrial"),
    (106, "Introdução á Indústria 4.0"),
    (107, "Administrador de Banco de Dados");
 
    
Select * from alunos;
    
INSERT INTO alunos (cod_aluno, nome, sobrenome, data_nascimento, cod_curso)
 VALUES ('1100','Iago','Silva','2006-11-04','107');
 
 
 #Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento
SELECT cod_aluno, data_nascimento FROM alunos
WHERE data_nascimento > '1998-01-01';

#Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0”ordenado pelo nome
SELECT cod_curso, nome, data_nascimento FROM alunos
WHERE cod_curso = 106 and data_nascimento > '2006-01-01';

#Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso
SELECT cod_curso, cod_aluno, data_nascimento FROM alunos
WHERE (cod_curso = "106" OR cod_curso = "104") and data_nascimento > '2006-01-01';

#Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0
SELECT nome_curso FROM cursos
WHERE nome_curso = "Administrador de Banco de Dados" OR nome_curso = "Introdução á Indústria 4.0";

#Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um

SELECT cod_aluno, nome, sobrenome data_nascimento, data_nascimento FROM alunos
WHERE data_nascimento = '1990-01-10';

SELECT cod_aluno, nome, sobrenome data_nascimento, data_nascimento FROM alunos
WHERE data_nascimento = '2006-12-27';




 

 
 

