/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 3/3
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 3/3
Liste o nome e data de nascimento de todos os alunos - 3/3
Liste todas as colunas de todos os cursos - 3/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 6/6
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 0/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 0/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 3/6 *deveria colocar a data completa e não somente o valor 18
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 3/6 * faltou filtrar a idade
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 0/6

Total: 36
*/
drop database cursos_bp;
CREATE DATABASE cursos_bp;

USE cursos_bp;

CREATE TABLE cursos (
   primary key(cod_curso),
   cod_curso INT,
   nome_curso VARCHAR(100)

);

drop database cursos_bp;

CREATE TABLE alunos  (
 cod_aluno INT,primary key(cod_aluno),
 nome VARCHAR(45),
 sobrenome VARCHAR(45),
 data_nascimento DATE,
 cod_curso int,
 foreign key (cod_curso) references cursos (cod_curso)
 
 );
 
 INSERT INTO cursos VALUES ('101', 'Introdução ao Desenvolvimento de Projetos');
 INSERT INTO cursos VALUES('102', 'Inglês Técnico Aplicado ao Desenvolvimento de Sistemas');
 INSERT INTO cursos VALUES ('103', 'Higiene do Alimento:Microbiologia de Alimentos');
 INSERT INTO cursos VALUES('104', 'Ferramentas Digitais de Gestão');
 INSERT INTO cursos VALUES('105', 'Introdução a IOT para manutenção Industrial');
 INSERT INTO cursos VALUES('106', 'Introdução à Indústria 4.0');
 INSERT INTO cursos VALUES('107', 'Admistrador de Banco de Dados');
 
 INSERT INTO cursos VALUES('108', 'Programador de back-and');
 
 INSERT INTO alunos VALUES('1100','Clara','Aparecida', '2006-01-26','108');
 
select nome,data_nascimento  from alunos;

select * from cursos;
select * from alunos;
 
select  nome,sobrenome from alunos order by nome asc;

select * from alunos where data_nascimento > 1990 limit 1;

select * from alunos where data_nascimento < 18 and cod_curso =106 ORDER BY nome;

select * from  alunos where cod_curso=106 or cod_curso= 104;

select * from alunos WHERE data_nascimento > 1998 order by data_nascimento asc;


 
 
 