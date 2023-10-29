/*
Construiu o banco de dados conforme o modelo - 10/10
Efetuou as inserções de dados solicitadas - 3/3
Carregou os dados dos alunos - 2/2
Cadastrou aluno corretamente - 3/3
Liste o nome e data de nascimento de todos os alunos - 3/3
Liste todas as colunas de todos os cursos - 3/3
Lista nome, sobrenome dos alunos ordenado pelo nome - /66
Verifique quem é o aluno mais velho. Em outra consulta veja também quem é o mais novo. OBS.: Deverá retornar somente um - 6/6
Consulte os alunos que nasceram depois de 1998 ordenado pela data de nascimento - 3/6 * faltou ordenar
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ordenado pelo nome - 6/6
Liste somente alunos que são menores de idade e são do curso “Introdução à Industria 4.0” ou “Ferramentas Digitais de Gestão” ordenado pelo código do curso - 0/6
Liste os cursos que são Administrador de Banco de Dados ou Introdução à Indústria 4.0 - 0/6

Total: 45
*/

create database senai_bp;

use senai_bp;

create table cursos (
	cod_curso int,
    nome_curso varchar(100),
    primary key(cod_curso)
);

create table alunos (
	cod_aluno int,
    nome varchar(45),
    sobrenome varchar(45),
    data_nascimento date,
    cod_curso int,
    primary key(cod_aluno),
    foreign key(cod_curso) references cursos (cod_curso)
);

insert into cursos( cod_curso, nome_curso)
values (101,'introdução ao desenvolvimento de projetos'),
(102,'inglês técnico aplicado ao desenvolvimento de sistemas'),
(103, 'higiene do alimento: microbiologia de alimentos'),
(104, 'ferramentas digitais de gestão'),
(105, ' introdução a IOT para manutenção industrial'),
(106, 'introdução á industria 4.0'),
(107, 'administrador de banco de dados');

insert into cursos(cod_curso, nome_curso)
values(108, 'progamador back-end');

insert into alunos(cod_aluno, nome, sobrenome, data_nascimento, cod_curso)
values(1100, 'Ronaldo', 'silva', '2006-10-30', 108);


-- listando o nome e data de nascimento dos alunos
select nome, data_nascimento from alunos;


-- listando todas as colunas de todos os cursos
select * from cursos;


-- listando nome e sobrenome por alfabetica
select nome, sobrenome, data_nascimento from alunos order by nome asc;


-- vendo o aluno mais velho
select nome, sobrenome, data_nascimento from alunos order by data_nascimento asc limit 1;


-- vendo o aluno mais novo
select nome, sobrenome, data_nascimento from alunos order by data_nascimento desc limit 1;


-- alunos depois de 1998
select nome, data_nascimento from alunos where data_nascimento >='1998-01-01';


-- alunos menores de idade que fazem parte do curso Introdução à Industria 4.0
select nome, data_nascimento from alunos where data_nascimento > '2006-01-01' and cod_curso = 106;


-- alunos menores de idade que fazem parte do curso Introdução à Industria 4.0 e “Ferramentas Digitais de Gestão” 
select nome, data_nascimento from alunos where data_nascimento > '2006-01-01' and cod_curso = 106 and 104;


-- listando os cursos 107 e 106
select nome_curso from cursos where cod_curso = 107 and 106;
