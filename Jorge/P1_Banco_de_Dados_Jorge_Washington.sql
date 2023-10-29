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

create database escola_senai_bp_rj;
use escola_senai_bp_rj;

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
foreign key (cod_curso) references cursos(cod_curso)
);

#inserindo os cursos na tabela cursos

insert into cursos (cod_curso, nome_curso)
value (101, 'Introsução ao Desenvolvimento de Projetos'),
(102, 'Inglês Técnico Aplicado ao Desenvolvimento de Sistemas'),
(103, 'Higiene do Alimento: Microbiologia de Alimentos'),
(104, 'Ferramentas Digitais de Gestão'),
(105, 'Introdução a IOT para manutenção Industrial'),
(106, 'Introdução à Indústria 4.0'),
(107, 'Administrador de Banco de Dados');

#cadastrando meu curso na tabela

insert into cursos (cod_curso, nome_curso)
value(108, 'Programador Back-End');

# sendo cadastrado na tabela alunos

insert into alunos (cod_aluno, nome, sobrenome, data_nascimento, cod_curso)
value(1100, 'Jorge', 'Washington', '2001-04-23', 108);

#listando nome e data de nascimento de todos os alunos

select nome, data_nascimento from alunos;

#listando todas as colunas de cursos

select*from cursos;

#listando nome, sobrenome dos alunos ordenado pelo nome 

select nome, sobrenome from alunos
order by nome asc;

#verificando quem é o aluno mais velho

select nome, sobrenome from alunos 
order by data_nascimento asc
limit 1;

#verificando o aluno mais novo

select nome, sobrenome from alunos 
order by data_nascimento desc
limit 1;

#consultando alunos que nasceram depois de 1998 ordenadamente 

select * from alunos
where data_nascimento > '1998-12-31' 
order by data_nascimento asc;

#listando alunos menores de idade que pertencem ao curso introdução industrial 4.0

select*from alunos
where (data_nascimento > '2005-10-27')
and cod_curso = 106 order by nome asc;

#listando alunos que são menores de idade nos cursos introduçao a industria 4.0 ou ferramentas digitas de gestão ordenada pelo codigo do curso

select*from alunos
where (data_nascimento > '2005-10-27')
and (cod_curso = 106 or cod_curso = 104 )
order by cod_curso asc;

#listando os cursos que são Adiministrador de Banco de Dados ou Introdução à Indústria 4.0

select*from cursos
where cod_curso = 106 or cod_curso = 107;
