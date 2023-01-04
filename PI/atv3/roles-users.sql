-- Active: 1671772017802@@127.0.0.1@3306@mydb

-- Criar usuarios do banco de dados --

CREATE USER 'lucas'@'localhost' IDENTIFIED BY 'senha';
CREATE USER 'mikaelly'@'localhost' IDENTIFIED BY 'senha';
CREATE USER 'marcio'@'localhost' IDENTIFIED BY 'senha';

-- Criar Roles --
CREATE ROLE 'leitura_dba'@'localhost','gerencia_estoque'@'localhost','dono'@'localhost'

-- Permissoes as Roles --
use mydb;
grant select, alter, update, delete, insert, SHOW DATABASES on estoque to gerencia_estoque

grant select, SHOW DATABASES on * to leitura_dba

grant ALL on * to dono

-- Vinculando usuario e role --

use mydb;
grant 'dono'@'localhost' to 'marcio'@localhost;
grant 'leitura_dba'@'localhost' to 'lucas'@localhost;
grant 'gerencia_estoque'@'localhost' to 'mikaelly'@localhost;

