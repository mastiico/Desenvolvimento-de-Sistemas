SET FOREIGN_KEY_CHECKS=0;


-- Funcionarios --
INSERT INTO `mydb`.`info_func`(`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`telefone`,`email`,`username`,`senha`,`cargos_id_cargos`,`endereco_id_endereco`)
VALUES('Lucas','Paiva','396594069',49758013882, '2004-10-23','+551198759019','Luquinhas2024@gmail.com','lucas09','1q2w3e',2,1);

INSERT INTO `mydb`.`info_func`(`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`telefone`,`email`,`username`,`senha`,`cargos_id_cargos`,`endereco_id_endereco`)
VALUES('Marcio','Paiva','483728578',49773828388, '2004-10-11','+5511936478129','MarcioPaiva002@gmail.com','marcinho02','2w3e4r',1,2);

INSERT INTO `mydb`.`info_func`(`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`telefone`,`email`,`username`,`senha`,`cargos_id_cargos`,`endereco_id_endereco`)
VALUES('Mikaelly','Paiva','847342143','87592213992', '2004-12-08','+5511976374933','MikaPaiva002@gmail.com','paiva01','8u7y6t5r',3,3);

-- Usuarios --

INSERT INTO `mydb`.`info_usr`(`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`telefone`,`email`,`username`,`senha`,`endereco_id_endereco`,`cartao_id_cartao`)
VALUES('Thiago','Lorenzo','384737829','33614436264','2002-08-23','+5581988325188','maranguaperp@gmail.com','11maranguape','123@_!',4,1);
INSERT INTO `mydb`.`info_usr`(`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`telefone`,`email`,`username`,`senha`,`endereco_id_endereco`,`cartao_id_cartao`)
VALUES('Davi','Viana','144910512','35957438146','2000-03-01','+556192923074','jackviana@gmail.com','jack@@','1q2w3e',5,2);
INSERT INTO `mydb`.`info_usr`(`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`telefone`,`email`,`username`,`senha`,`endereco_id_endereco`,`cartao_id_cartao`)
VALUES('Joao','Pedro','320847524','18814178160','1998-08-23','+5581935433443','pedrinho002@gmail.com','jaspel','2w5t6y',6,3);


-- Cargos --

INSERT INTO `mydb`.`cargos`(`nome`,`salario`)
VALUES('Funcionario','2300');
INSERT INTO `mydb`.`cargos`(`nome`,`salario`)
VALUES('Gerente','4600');
INSERT INTO `mydb`.`cargos`(`nome`,`salario`)
VALUES('Dono','13000');

-- enderecos --

INSERT INTO `mydb`.`endereco`(`rua`,`logradouro`,`cep`,`numero`, `Cidade`, `Estado`)
VALUES('Avenida Tocantins','rua','75802095',122, 'Jataí', 'GO');
INSERT INTO `mydb`.`endereco`(`rua`,`logradouro`,`cep`,`numero`, `Cidade`, `Estado`)
VALUES('Praça da República','rua','13252025',54, 'Jataí', 'GO');
INSERT INTO `mydb`.`endereco`(`rua`,`logradouro`,`cep`,`numero`, `Cidade`, `Estado`)
VALUES('Rodovia Raposo Tavares','rua','06709015',11, 'Cotia', 'SP');
INSERT INTO `mydb`.`endereco`(`rua`,`logradouro`,`cep`,`numero`, `Cidade`, `Estado`)
VALUES('Avenida Esbertalina Barbosa Damiani','rua','29946490',122, 'São Mateus', 'ES');
INSERT INTO `mydb`.`endereco`(`rua`,`logradouro`,`cep`,`numero`, `Cidade`, `Estado`)
VALUES('Rua Barão de Vitória','rua','09961660',25, 'Diadema', 'SP');
INSERT INTO `mydb`.`endereco`(`rua`,`logradouro`,`cep`,`numero`, `Cidade`, `Estado`)
VALUES('Avenida Rio Branco','rua','20040002',55, 'Rio de Janeiro', 'RJ');

-- Produtos --

INSERT INTO `mydb`.`produto`(`nome`,`peso`,`validade`,`sabor`,`valor`)
VALUES('Bolo de Natal','5kg','2023-01-01','Chocolate',150);
INSERT INTO `mydb`.`produto`(`nome`,`peso`,`validade`,`sabor`,`valor`)
VALUES('Bolo de Pascoa','3kg','2023-01-01','Coco',190);
INSERT INTO `mydb`.`produto`(`nome`,`peso`,`validade`,`sabor`,`valor`)
VALUES('Bolo de Fubá','1kg','2023-01-01','fubá',180);
INSERT INTO `mydb`.`produto`(`nome`,`peso`,`validade`,`sabor`,`valor`)
VALUES('Refrigerante','1L','2023-01-01','Coca-Cola',7);
INSERT INTO `mydb`.`produto`(`nome`,`peso`,`validade`,`sabor`,`valor`)
VALUES('Refrigerante', '2L','2023-01-01','Coca-Cola',12);
INSERT INTO `mydb`.`produto`(`nome`,`peso`,`validade`,`sabor`,`valor`)
VALUES('Refrigerante','2L','2023-01-01','Guaraná',12);

-- Estoque --

INSERT INTO `mydb`.`estoque`(`quantidade`,`produto_id_produto`)
VALUES(2,1);
INSERT INTO `mydb`.`estoque`(`quantidade`,`produto_id_produto`)
VALUES(2,2);
INSERT INTO `mydb`.`estoque`(`quantidade`,`produto_id_produto`)
VALUES(4,3);
INSERT INTO `mydb`.`estoque`(`quantidade`,`produto_id_produto`)
VALUES(5,4);
INSERT INTO `mydb`.`estoque`(`quantidade`,`produto_id_produto`)
VALUES(1,5);
INSERT INTO `mydb`.`estoque`(`quantidade`,`produto_id_produto`)
VALUES(6,6);

-- Pedidos --
INSERT INTO `mydb`.`pedidos`(`estoque_id_estoque`,`produto_id_produto`,`info_usr_id_info_usr`,`quantidade`,`data`) 
VALUES(1,1,1,2,'2023-01-01');
INSERT INTO `mydb`.`pedidos`(`estoque_id_estoque`,`produto_id_produto`,`info_usr_id_info_usr`,`quantidade`,`data`) 
VALUES(2,2,2,3,'2023-01-04');
INSERT INTO `mydb`.`pedidos`(`estoque_id_estoque`,`produto_id_produto`,`info_usr_id_info_usr`,`quantidade`,`data`) 
VALUES(3,3,3,4,'2023-01-02');

-- Cartao -- 
INSERT INTO `mydb`.`cartao`(`numero`,`cvv`,`validade`,`nome`)
VALUES('5562558717082289','992','2026-03-01','Thiago Lourenzo');
INSERT INTO `mydb`.`cartao`(`numero`,`cvv`,`validade`,`nome`)
VALUES('4916167894644329','497','2023-06-01','Davi Viana');
INSERT INTO `mydb`.`cartao`(`numero`,`cvv`,`validade`,`nome`)
VALUES('4539637954247814','216','2025-12-01','Joao Pedro');

-- Pagamento --

INSERT INTO `mydb`.`pagamento`(`estoque_id_estoque`,`produto_id_produto`,`cartao_id_cartao`,`data`,`info_usr_id_info_usr`,pedidos_id_pedidos)
VALUES(1,1,1,'2023-01-04',1,1);
INSERT INTO `mydb`.`pagamento`(`estoque_id_estoque`,`produto_id_produto`,`cartao_id_cartao`,`data`,`info_usr_id_info_usr`,pedidos_id_pedidos)
VALUES(2,2,2,'2023-01-04',2,2);
INSERT INTO `mydb`.`pagamento`(`estoque_id_estoque`,`produto_id_produto`,`cartao_id_cartao`,`data`,`info_usr_id_info_usr`,pedidos_id_pedidos)
VALUES(3,3,3,'2023-01-04',3,3);
