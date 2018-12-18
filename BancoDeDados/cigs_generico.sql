SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `cigs_generico` DEFAULT CHARACTER SET utf8 ;
USE `cigs_generico` ;

CREATE TABLE `postograduacao` (
  `pg_id` int(11) NOT NULL,
  `pg_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`pg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `divisaosecao` (
  `ds_id` int(11) NOT NULL,
  `ds_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qas_qms` (
  `Arma_id` int(11) NOT NULL,
  `Arma_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`Arma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `escolaridade` (
  `Esc_id` int(11) NOT NULL,
  `Esc_nome` varchar(60) NOT NULL,
  PRIMARY KEY (`Esc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bairro` (
  `Bairro_id` int(11) NOT NULL,
  `Bairro_nome` varchar(45) NOT NULL,
  `Bairro_zona` varchar(45) NOT NULL,
  PRIMARY KEY (`Bairro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `militar` (
  `Mil_nome_guerra` varchar(40) NOT NULL,
  `Mil_nome` varchar(70) NOT NULL,
  `Mil_end_cep` varchar(8) NOT NULL,
  `Mil_end_logradouro` varchar(60) NOT NULL,
  `Mil_end_estado` varchar(45) NOT NULL,
  `Mil_end_cidade` varchar(45) NOT NULL,
  `Mil_end_num` varchar(10) NOT NULL,
  `Mil_fone1` varchar(11) NOT NULL,
  `Mil_fone2` varchar(11) NOT NULL,
  `Mil_email` varchar(45) NOT NULL,
  `Mil_contato_referencia` varchar(60) NOT NULL,
  `Mil_fone_referencia` varchar(11) NOT NULL,
  `Mil_senha` varchar(20) NOT NULL,
  `Mil_end_complemento` varchar(70) NOT NULL,
  `PostoGraduacao_pg_id` int(11) NOT NULL,
  `QAS_QMS_Arma_id` int(11) NOT NULL,
  `DivisaoSecao_ds_id` int(11) NOT NULL,
  `Escolaridade_Esc_id` int(11) NOT NULL,
  `Bairro_Bairro_id` int(11) NOT NULL,
  `Situacao_id` int(11) NOT NULL,
  `Mil_sexo` char(1) NOT NULL,
  `Mil_naturalidade` varchar(45) NOT NULL,
  `Mil_est_civil` varchar(30) NOT NULL,
  `Mil_dt_praca` varchar(8) NOT NULL,
  `Mil_identidade` varchar(10) NOT NULL,
  `Mil_cpf` varchar(11) NOT NULL,
  `Mil_preccp` varchar(9) NOT NULL,
  `Mil_data_nasc` varchar(8) DEFAULT NULL,
  `Mil_cnh_num` varchar(12) DEFAULT NULL,
  `Mil_cnh_cat` varchar(2) DEFAULT NULL,
  `Mil_pai` varchar(45) DEFAULT NULL,
  `Mil_mae` varchar(45) DEFAULT NULL,
  `Mil_tipo_acesso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Mil_identidade`,`Mil_senha`,`PostoGraduacao_pg_id`,`QAS_QMS_Arma_id`,`DivisaoSecao_ds_id`,`Escolaridade_Esc_id`,`Bairro_Bairro_id`),
  KEY `fk_Militar_PostoGraduacao_idx` (`PostoGraduacao_pg_id`),
  KEY `fk_Militar_QAS_QMS1_idx` (`QAS_QMS_Arma_id`),
  KEY `fk_Militar_DivisaoSecao1_idx` (`DivisaoSecao_ds_id`),
  KEY `fk_Militar_Escolaridade1_idx` (`Escolaridade_Esc_id`),
  KEY `fk_Militar_Bairro1_idx` (`Bairro_Bairro_id`),
  CONSTRAINT `fk_Militar_Bairro1` FOREIGN KEY (`Bairro_Bairro_id`) REFERENCES `bairro` (`Bairro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Militar_DivisaoSecao1` FOREIGN KEY (`DivisaoSecao_ds_id`) REFERENCES `divisaosecao` (`ds_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Militar_Escolaridade1` FOREIGN KEY (`Escolaridade_Esc_id`) REFERENCES `escolaridade` (`Esc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Militar_PostoGraduacao` FOREIGN KEY (`PostoGraduacao_pg_id`) REFERENCES `postograduacao` (`pg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Militar_QAS_QMS1` FOREIGN KEY (`QAS_QMS_Arma_id`) REFERENCES `qas_qms` (`Arma_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
