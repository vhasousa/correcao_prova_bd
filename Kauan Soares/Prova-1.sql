/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 3/3
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 3/3
Liste o nome e data de nascimento de todos os alunos - 0/3
Liste todas as colunas de todos os cursos - 3/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 3/6 * faltou especificar as colunas
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 3/6 * faltou ordenar
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 0/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 0/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 0/6

Total: 33
*/

create database curso_senai1;

use curso_senai1;

create table cursos (
     cod_curso int,
     nome_curso varchar(100),
     primary key (cod_curso)
     );
   
create table alunos ( 
	 cod_aluno int,
     nome varchar(45),
     sobrenome varchar(45),
     nascimento date,
     cod_curso int,
     primary key(cod_aluno)
     );
	
insert into alunos (cod_curso, nome, sobrenome, nascimento, cod_aluno)
values (108, 'Kauan', 'Soares', '2006-04-09',1100);

insert into cursos (cod_curso, nome_curso)
values (101, 'Introdução ao Desenvolvimento de Projetos'),
(102, 'Inglês Técnico Aplicado ao Desenvolvimento de sistemas'),
(103, 'Higiene do Alimento: Microbiologia de Alimentos'),
(104, 'Ferramentas Digitais de Gestão'),
(105, 'Introdução a IOT para Manuntenção Industrial'),
(106, 'introdução à industria 4.0'),
(107, 'Administrador de Banco de dados');

insert into cursos (cod_curso, nome_curso)
values (108, 'Programador');

select * from alunos; 

select * from cursos;

select * from alunos where cod_curso = 108;
select * from alunos order by nome asc; 
select nome from alunos order by nascimento asc limit 1;
select nome from alunos order by nascimento desc limit 1;
select nome as 'nome', nascimento as 'nascimento'  from alunos where nascimento >= '1998-01-01';
select nome from alunos where cursos = 'Introdução à Industria 4.0' order by nome;
select cod_curso from cursos where curso = 'Introdução à Industria 4.0' or 'Ferramentas Digitais de Gestão' order by cod_curso;
select cursos from cursos where curso = 'Administrador de Banco de Dados ou Introdução à Indústria';
 


