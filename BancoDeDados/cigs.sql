-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cigs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cigs` ;

-- -----------------------------------------------------
-- Schema cigs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cigs` ;
USE `cigs` ;

-- -----------------------------------------------------
-- Table `cigs`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `estado_id` INT NOT NULL,
  PRIMARY KEY (`id`, `estado_id`),
  INDEX `fk_cidade_estado_idx` (`estado_id` ASC),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`estado_id`)
    REFERENCES `cigs`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`bairro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `zona` VARCHAR(45) NULL,
  `cidade_id` INT NOT NULL,
  `cidade_estado_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cidade_id`, `cidade_estado_id`),
  INDEX `fk_bairro_cidade_idx` (`cidade_id` ASC, `cidade_estado_id` ASC),
  CONSTRAINT `fk_bairro_cidade`
    FOREIGN KEY (`cidade_id` , `cidade_estado_id`)
    REFERENCES `cigs`.`cidade` (`id` , `estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`divisaosecao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`divisaosecao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`escolaridade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`qasqms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`qasqms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`postograduacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`postograduacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`situacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`situacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `situacao` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigs`.`militar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cigs`.`militar` (
  `identidade` INT NOT NULL,
  `nome` VARCHAR(70) NOT NULL,
  `nome_guerra` VARCHAR(40) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `preccp` VARCHAR(9) NOT NULL,
  `cnh_num` VARCHAR(12) NULL,
  `cnh_cat` VARCHAR(2) NULL,
  `sexo` CHAR(1) NOT NULL,
  `est_civil` VARCHAR(25) NOT NULL,
  `data_nasc` VARCHAR(8) NOT NULL,
  `data_praca` VARCHAR(8) NOT NULL,
  `pai` VARCHAR(70) NULL,
  `mae` VARCHAR(70) NULL,
  `fone1` VARCHAR(11) NOT NULL,
  `fone2` VARCHAR(11) NULL,
  `email` VARCHAR(45) NOT NULL,
  `nome_referencia` VARCHAR(70) NOT NULL,
  `fone_referencia` VARCHAR(11) NOT NULL,
  `end_cep` VARCHAR(8) NOT NULL,
  `end_logradouro` VARCHAR(60) NOT NULL,
  `end_num` VARCHAR(8) NOT NULL,
  `end_complemento` VARCHAR(70) NULL,
  `naturalidade` VARCHAR(40) NOT NULL,
  `tipo_acesso` VARCHAR(5) NULL,
  `senha` VARCHAR(20) NOT NULL,
  `titulo_num` VARCHAR(12) NOT NULL,
  `titulo_zona` VARCHAR(3) NOT NULL,
  `titulo_secao` VARCHAR(4) NOT NULL,
  `escolaridade_id` INT NOT NULL,
  `qasqms_id` INT NOT NULL,
  `postograduacao_id` INT NOT NULL,
  `divisaosecao_id` INT NOT NULL,
  `bairro_id` INT NOT NULL,
  `bairro_cidade_id` INT NOT NULL,
  `bairro_cidade_estado_id` INT NOT NULL,
  `situacao_id` INT NOT NULL,
  PRIMARY KEY (`identidade`, `escolaridade_id`, `qasqms_id`, `postograduacao_id`, `divisaosecao_id`, `bairro_id`, `bairro_cidade_id`, `bairro_cidade_estado_id`, `situacao_id`),
  INDEX `fk_militar_escolaridade_idx` (`escolaridade_id` ASC),
  INDEX `fk_militar_qasqms_idx` (`qasqms_id` ASC),
  INDEX `fk_militar_postograduacao_idx` (`postograduacao_id` ASC),
  INDEX `fk_militar_divisaosecao_idx` (`divisaosecao_id` ASC),
  INDEX `fk_militar_bairro_idx` (`bairro_id` ASC, `bairro_cidade_id` ASC, `bairro_cidade_estado_id` ASC),
  INDEX `fk_militar_situacao1_idx` (`situacao_id` ASC),
  CONSTRAINT `fk_militar_escolaridade`
    FOREIGN KEY (`escolaridade_id`)
    REFERENCES `cigs`.`escolaridade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_qasqms`
    FOREIGN KEY (`qasqms_id`)
    REFERENCES `cigs`.`qasqms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_postograduacao`
    FOREIGN KEY (`postograduacao_id`)
    REFERENCES `cigs`.`postograduacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_divisaosecao`
    FOREIGN KEY (`divisaosecao_id`)
    REFERENCES `cigs`.`divisaosecao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_bairro`
    FOREIGN KEY (`bairro_id` , `bairro_cidade_id` , `bairro_cidade_estado_id`)
    REFERENCES `cigs`.`bairro` (`id` , `cidade_id` , `cidade_estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_situacao1`
    FOREIGN KEY (`situacao_id`)
    REFERENCES `cigs`.`situacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
