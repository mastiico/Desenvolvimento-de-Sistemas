-- MySQL Script generated by MySQL Workbench
-- Wed Dec 14 13:11:35 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cartao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cartao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cartao` (
  `idCartao` INT NOT NULL AUTO_INCREMENT,
  `Numero` INT(20) NOT NULL,
  `CVV` INT(3) NOT NULL,
  `Validade` VARCHAR(5) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Sobrenome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCartao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Item_venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Item_venda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Item_venda` (
  `idItem_venda` INT NOT NULL AUTO_INCREMENT,
  `Subtotal` INT(20) NOT NULL,
  `Valor_produto_idValor_produto` INT NOT NULL,
  PRIMARY KEY (`idItem_venda`),
  INDEX `fk_Item_venda_Valor_produto1_idx` (`Valor_produto_idValor_produto` ASC) VISIBLE,
  CONSTRAINT `fk_Item_venda_Valor_produto1`
    FOREIGN KEY (`Valor_produto_idValor_produto`)
    REFERENCES `mydb`.`Valor_produto` (`idValor_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT,
  `Tipo_pagamento` VARCHAR(10) NOT NULL,
  `Numero_parcelas` INT(2) NOT NULL,
  `Data_pagamento` DATE NOT NULL,
  `Cartao_idCartao` INT NOT NULL,
  PRIMARY KEY (`idPagamento`),
  INDEX `fk_Pagamento_Cartao1_idx` (`Cartao_idCartao` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Cartao1`
    FOREIGN KEY (`Cartao_idCartao`)
    REFERENCES `mydb`.`Cartao` (`idCartao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Valor_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Valor_produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Valor_produto` (
  `idValor_produto` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` INT(10) NOT NULL,
  `Valor_unitario` INT(10) NOT NULL,
  `produto_id` INT NOT NULL,
  PRIMARY KEY (`idValor_produto`),
  INDEX `fk_Valor_produto_produto1_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Valor_produto_produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `mydb`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Venda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NOT NULL,
  `Data_envio` DATETIME NOT NULL,
  `Valor_total` INT(15) NOT NULL,
  `funcionario_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `Item_venda_idItem_venda` INT NOT NULL,
  `Pagamento_idPagamento` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_Venda_funcionario1_idx` (`funcionario_id` ASC) VISIBLE,
  INDEX `fk_Venda_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_Venda_Item_venda1_idx` (`Item_venda_idItem_venda` ASC) VISIBLE,
  INDEX `fk_Venda_Pagamento1_idx` (`Pagamento_idPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `mydb`.`funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `mydb`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Item_venda1`
    FOREIGN KEY (`Item_venda_idItem_venda`)
    REFERENCES `mydb`.`Item_venda` (`idItem_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Pagamento1`
    FOREIGN KEY (`Pagamento_idPagamento`)
    REFERENCES `mydb`.`Pagamento` (`idPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cargo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cargo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `salario` DECIMAL(9,2) NULL,
  `comissao` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`funcionario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NULL,
  `usuario_id` INT NOT NULL,
  `cargo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_funcionario_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_funcionario_cargo1_idx` (`cargo_id` ASC) VISIBLE,
  CONSTRAINT `fk_funcionario_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_cargo1`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `mydb`.`cargo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NULL,
  `estoque` INT NULL,
  `fabricante` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  `ultimo_login` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
