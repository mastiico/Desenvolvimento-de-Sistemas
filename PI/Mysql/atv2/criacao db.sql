-- MySQL Script generated by MySQL Workbench
-- Mon Jan  2 02:12:24 2023
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
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `cep` INT(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cartao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cartao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cartao` (
  `id_cartao` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `cvv` INT(3) NOT NULL,
  `validade` DATE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cartao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`info_usr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`info_usr` ;

CREATE TABLE IF NOT EXISTS `mydb`.`info_usr` (
  `id_info_usr` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `rg` INT(12) NOT NULL,
  `cpf` VARCHAR(17) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NOT NULL,
  `endereco_id_endereco` INT NOT NULL,
  `cartao_id_cartao` INT NOT NULL,
  PRIMARY KEY (`id_info_usr`),
  INDEX `fk_info_usr_endereco1_idx` (`endereco_id_endereco` ASC) VISIBLE,
  INDEX `fk_info_usr_cartao1_idx` (`cartao_id_cartao` ASC) VISIBLE,
  CONSTRAINT `fk_info_usr_endereco1`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `mydb`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_usr_cartao1`
    FOREIGN KEY (`cartao_id_cartao`)
    REFERENCES `mydb`.`cartao` (`id_cartao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `validade` DATE NOT NULL,
  `sabor` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estoque` ;

CREATE TABLE IF NOT EXISTS `mydb`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT(35) NOT NULL,
  `produto_id_produto` INT NOT NULL,
  PRIMARY KEY (`id_estoque`),
  INDEX `fk_estoque_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_estoque_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `mydb`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pedidos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `id_pedidos` INT NOT NULL AUTO_INCREMENT,
  `estoque_id_estoque` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  `info_usr_id_info_usr` INT NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id_pedidos`),
  INDEX `fk_pedidos_estoque1_idx` (`estoque_id_estoque` ASC) VISIBLE,
  INDEX `fk_pedidos_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  INDEX `fk_pedidos_info_usr1_idx` (`info_usr_id_info_usr` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_estoque1`
    FOREIGN KEY (`estoque_id_estoque`)
    REFERENCES `mydb`.`estoque` (`id_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `mydb`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_info_usr1`
    FOREIGN KEY (`info_usr_id_info_usr`)
    REFERENCES `mydb`.`info_usr` (`id_info_usr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pagamento` (
  `id_carrinho` INT NOT NULL AUTO_INCREMENT,
  `estoque_id_estoque` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  `cartao_id_cartao` INT NOT NULL,
  `data` DATE NOT NULL,
  `info_usr_id_info_usr` INT NOT NULL,
  `pedidos_id_pedidos` INT NOT NULL,
  PRIMARY KEY (`id_carrinho`, `cartao_id_cartao`),
  INDEX `fk_carrinho_estoque1_idx` (`estoque_id_estoque` ASC) VISIBLE,
  INDEX `fk_carrinho_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  INDEX `fk_pagamento_cartao1_idx` (`cartao_id_cartao` ASC) VISIBLE,
  INDEX `fk_pagamento_info_usr1_idx` (`info_usr_id_info_usr` ASC) VISIBLE,
  INDEX `fk_pagamento_pedidos1_idx` (`pedidos_id_pedidos` ASC) VISIBLE,
  CONSTRAINT `fk_carrinho_estoque1`
    FOREIGN KEY (`estoque_id_estoque`)
    REFERENCES `mydb`.`estoque` (`id_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrinho_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `mydb`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagamento_cartao1`
    FOREIGN KEY (`cartao_id_cartao`)
    REFERENCES `mydb`.`cartao` (`id_cartao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagamento_info_usr1`
    FOREIGN KEY (`info_usr_id_info_usr`)
    REFERENCES `mydb`.`info_usr` (`id_info_usr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagamento_pedidos1`
    FOREIGN KEY (`pedidos_id_pedidos`)
    REFERENCES `mydb`.`pedidos` (`id_pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cargos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cargos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cargos` (
  `id_cargos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `salario` INT(45) NOT NULL,
  PRIMARY KEY (`id_cargos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`info_func`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`info_func` ;

CREATE TABLE IF NOT EXISTS `mydb`.`info_func` (
  `id_info_usr` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `rg` INT(12) NOT NULL,
  `cpf` VARCHAR(17) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NOT NULL,
  `cargos_id_cargos` INT NOT NULL,
  `endereco_id_endereco` INT NOT NULL,
  PRIMARY KEY (`id_info_usr`),
  INDEX `fk_info_func_cargos_idx` (`cargos_id_cargos` ASC) VISIBLE,
  INDEX `fk_info_func_endereco1_idx` (`endereco_id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_info_func_cargos`
    FOREIGN KEY (`cargos_id_cargos`)
    REFERENCES `mydb`.`cargos` (`id_cargos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_func_endereco1`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `mydb`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
