create database HenriqueLaureano

use HenriqueLaureano

create table pessoas(
nome varchar(255),
sobrenome varchar(255),
idade int,
genero char,
situacao bool
)

insert into pessoas values
("João", "da Silva Santos", 20, 'M', true),
("Maria", "Ferreira", 30, 'F', true),
("Pedro", "Gonçalves", 25, 'M', false),
("Ana", "Rodrigues", 22, 'F', true),
("Carlos", "Oliveira", 28, 'M', true),
("Laura", "Sousa", 35, 'F', false),
("Rafael", "Almeida", 23, 'M', true),
("Isabela", "Costa", 27, 'F', true),
("Lucas", "Pereira", 24, 'M', false),
("Juliana", "Martins", 29, 'F', true),
("Rafael", "Almeida", 23, 'M', true);

update pessoas set nome = concat("@", nome) where nome like '%a%';

delete from pessoas where genero = 'M';


