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

create database curso_do_hugo;

use curso_do_hugo;

#criando as tabelas
create table cursos (
	cod_curso int,
    nome_curso varchar (100),
    primary key (cod_curso)
);

create table alunos (
	cod_aluno int,
    nome varchar(45),
    sobrenome varchar(45),
    data_nascimento date,
    cod_curso int,
    primary key (cod_aluno),
    foreign key (cod_curso) references cursos (cod_curso)
);

drop table cursos;
drop table alunos;

insert into cursos (cod_curso, nome_curso)
values ('101', 'Introdução ao Desenvolvimento de Projetos'),
('102', 'Inglês Técnico Aplicado ao Desenvolvimento de Sistemas'),
('103', 'Higiene do Alimento: Microbiologia de Alimentos'),
('104', 'Ferramentas Digitais de Gestão'),
('105', 'Introdução a IOT para manutenção Industrial'),
('106', 'Introdução à Indústria 4.0'),
('107', 'Administrador de Banco de Dados');

insert into cursos (cod_curso, nome_curso)
values ('108', 'Programdor Back-End');

insert into alunos (cod_aluno, nome, sobrenome, data_nascimento, cod_curso)
values ('1100', 'Hugo', 'Silva', '2006-06-04', '108');

select nome, data_nascimento from alunos;

select cod_curso, nome_curso from cursos;

select nome, sobrenome from alunos order by nome asc;

select nome, sobrenome, data_nascimento from alunos order by data_nascimento asc limit 1;

select nome, sobrenome, data_nascimento from alunos order by data_nascimento desc limit 1;

select nome, sobrenome, data_nascimento from alunos where data_nascimento >= '1998-01-01' order by data_nascimento asc;

select nome, sobrenome, data_nascimento, cod_curso from alunos
where cod_curso = '106'
and data_nascimento >= '2006-01-01'
order by nome asc;

select nome, sobrenome, data_nascimento, cod_curso from alunos
where (cod_curso = '104' or cod_curso = '106')
and data_nascimento >= '2006-01-01'
order by cod_curso asc;

select cod_curso, nome_curso from cursos
where (cod_curso = '106' or cod_curso = '107');