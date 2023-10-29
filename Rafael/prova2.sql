/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 0/3 * não inseriu todos os cursos
Carregou os dados dos alunos - 0/2 * por não inserir cursos, essa parte não funciona
Cadastrou aluno corretamente - 0/3
Liste o nome e data de nascimento de todos os alunos - 1,5/3 * nome e data de nascimento, não ano somente
Liste todas as colunas de todos os cursos - 3/3
Lista nome, sobrenome dos alunos ordenado pelo nome - 6/6
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 0/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 0/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 0/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 6/6

Total: 32,5
*/

drop database senai_bp;
create database  senai_bp;

use  senai_bp;
drop table cursos;
create table cursos(
		cod_curso int,
        nome_curso varchar(100),
        primary key(cod_curso)
);
insert into cursos(cod_curso,nome_curso)
values(107,"Administrador de banco de Dados");

create table alunos(
		cod_aluno int,
        nome varchar(45),
        sobrenome varchar(45),
        data_nascimento date,
        primary key(cod_aluno),
        cod_curso int,
        foreign key (cod_curso) references cursos(cod_curso)
);
insert into alunos(cod_aluno,nome,sobrenome,data_nascimento,cod_curso)
values (1,'Shanta','Lygoe','1999-12-03',106);
select nome,year(data_nascimento) from alunos;
select*from cursos;
select nome,sobrenome from alunos order by nome asc;
select nome,data_nascimento from alunos order by data_nascimento asc limit 1;
select nome,data_nascimento from alunos order by data_nascimento desc limit 1;
select*from alunos where data_nascimento;
select*from alunos where data_nascimento = year(data_nascimento);
select*from alunos where data_nascimento =  year(data_nascimento) > 2005 and year(data_nascimento) = 2005 and cod_curso = 106 or cod_curso = 104 order by cod_curso asc;
select*from cursos where cod_curso = "107" or cod_curso = "106";








