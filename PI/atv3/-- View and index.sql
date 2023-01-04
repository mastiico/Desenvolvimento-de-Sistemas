-- View --
use mydb;
CREATE VIEW Nome_e_Cartao as 
	SELECT `info_usr`.`id_info_usr`,
    `info_usr`.`nome`,
    `info_usr`.`sobrenome`,
    `info_usr`.`data_nascimento`,
    `info_usr`.`telefone`,
    `info_usr`.`email`,
    `info_usr`.`username`,
    `info_usr`.`senha`,
    `info_usr`.`endereco_id_endereco`,
    `info_usr`.`rg`,
    `info_usr`.`cpf`,
    `info_usr`.`cartao_id_cartao`,
    `cartao`.numero as 'numero cartao',
    `cartao`.nome as 'nome cartao',
    `cartao`.validade as 'validade cartao',
    `cartao`.cvv as 'cvv cartao'
FROM `mydb`.`info_usr`
inner join cartao on `info_usr`.`cartao_id_cartao` = cartao.id_cartao


--

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


--

CREATE VIEW info_pagamento as
SELECT `pagamento`.`id_carrinho`,
	produto.nome as 'nome produto',
	`pedidos`.`quantidade` as 'quantidade produto',
    cartao.numero 'numero cartao',
    cartao.nome as 'nome cartao',
    cartao.validade,
    cartao.cvv,
    `pagamento`.`data`,
    info_usr.nome as 'nome usuario',
    info_usr.sobrenome,
    info_usr.email,
    info_usr.telefone,
    info_usr.cpf,
	(`pedidos`.quantidade * `produto`.valor) as subtotal 
FROM `mydb`.`pagamento`
inner join estoque on `pagamento`.`estoque_id_estoque` = estoque.id_estoque
inner join produto on `pagamento`.`produto_id_produto` = produto.id_produto
inner join cartao on `pagamento`.`cartao_id_cartao` = cartao.id_cartao
inner join pedidos on pedidos_id_pedidos = pedidos.id_pedidos
inner join info_usr on `pagamento`.`info_usr_id_info_usr` = `info_usr`.`id_info_usr`;


-- INDEX --

CREATE INDEX idx_cartao ON cartao(nome);
CREATE INDEX idx_cargos ON cargos(nome);
CREATE INDEX idx_endereco ON endereco(cep);
create index idx_info_func on info_func(nome);
CREATE INDEX idx_info_usr ON info_usr(nome);
CREATE INDEX idx_produto ON produto(nome);