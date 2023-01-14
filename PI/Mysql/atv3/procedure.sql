

-- ## PROCEDURE ## --

-- Filter funcionario por cargo -- 

DELIMITER //
create PROCEDURE filter_func(cargo varchar(20))
  BEGIN 
       SELECT f.nome, f.sobrenome, f.cpf, f.telefone, f.email, cargos.nome
       FROM `mydb`.`info_func` as f
	     inner join cargos on f.`cargos_id_cargos` = cargos.id_cargos
       where = cargo;
  END;
//
DELIMITER;

-- Chamar PROCEDURE --
call mydb.filter_func('Gerente');


-- Filtrar compra do usuario X --

DELIMITER //
create PROCEDURE filter_compra_usr(nome varchar(20), sobrenome varchar(25))
    BEGIN 
      SELECT 
          info_usr.nome,
          info_usr.sobrenome,
          info_usr.cpf,
          cartao.numero as 'numero cartao',
          cartao.cvv,
          cartao.nome as 'nome cartao',
          produto.nome,
          produto.valor,
          produto.validade,
          pedidos.quantidade as 'quantidade de produto',
          pedidos.data as 'data pedido',
          `pagamento`.`data`,
          (produto.valor * pedidos.quantidade) as subtotal
      FROM `mydb`.`pagamento`
      inner join info_usr on  `pagamento`.`info_usr_id_info_usr` = info_usr.id_info_usr
      inner join produto on `pagamento`.`produto_id_produto` = produto.id_produto
      inner join pedidos on `pagamento`.`pedidos_id_pedidos` = pedidos.id_pedidos
      inner join cartao on `pagamento`.`cartao_id_cartao` = cartao.id_cartao
      where info_usr.nome = nome and info_usr.sobrenome = sobrenome;
END;
//
DELIMITER ;
-- Chamar procedure --
call mydb.filter_compra_usr('Thiago', 'Lorenzo');


-- mostrar subtotal pedidos --

CREATE VIEW show_subtotal_pedidos AS
    SELECT 
        `pedidos`.`id_pedidos`,
        `pedidos`.`estoque_id_estoque`,
        `pedidos`.`produto_id_produto`,
        `pedidos`.`info_usr_id_info_usr`,
        `pedidos`.`quantidade`,
        `pedidos`.`data` 
        (`pedidos`.`quantidade` * `produto`.`valor`) AS `subtotal`
    FROM
        `pedidos`
        inner JOIN `produto` ON `pedidos`.`produto_id_produto` =`produto`.`id_produto`

-- chamar procedure --

SELECT * FROM mydb.show_subtotal_pedidos;



-- trigger --

