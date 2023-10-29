/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 3/3
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 0/3
Liste o nome e data de nascimento de todos os alunos - 3/3
Liste todas as colunas de todos os cursos - 0/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 5/6 *faltou sobrenome
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 3/6 faltou ordenar
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 6/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 6/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 6/6

Total: 50
*/
drop database senai;
create database senai;
use senai;

create table cursos(
cod_curso INT,
nome_curso VARCHAR(100),
PRIMARY KEY (cod_curso)
);
INSERT INTO cursos (cod_curso,nome_curso)
VALUES (101,"Introdução ao Desenvolmento de Projetos"),
(102,"Inglês Técnico Aplicado ao Desenvolmento de Sistemas"),
(103,"Hegiene de Alimento:Microbiologia de Alimentos"),
(104,"Ferramentas Digitais de Gestão"),
(105,"Introdução a IOT para manutenção industrial"),
(106,"Introdução à Industria 4.0"),
(107,"Administração de Banco de dados "),
(108, "Programador Back-End");

create table alunos(
cod_alunos INT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
data_nascimento DATE,
cod_curso INT,
PRIMARY KEY (cod_alunos),
foreign key(cod_curso) references cursos(cod_curso) 
);

SELECT nome,data_nascimento FROM alunos;
SELECT nome FROM alunos ORDER BY nome ASC;
SELECT * FROM alunos ORDER BY data_nascimento ASC limit 1;
SELECT * FROM alunos ORDER BY data_nascimento DESC limit 1;
SELECT * FROM alunos WHERE data_nascimento > '1998-01-01';
SELECT * FROM alunos WHERE data_nascimento >'2005-01-01'
AND(cod_curso =106) ORDER BY nome ASC ;
SELECT * FROM alunos WHERE data_nascimento > '2005-01-01'
AND cod_curso =106 or cod_curso =104 ORDER BY cod_curso ASC;
SELECT * FROM cursos WHERE cod_curso=107 or cod_curso=106;



DROP DATABASE senai;





