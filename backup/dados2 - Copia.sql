-- MySQL Script generated by MySQL Workbench
-- Sun Aug 26 17:38:21 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema goldbitc_loteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goldbitc_loteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goldbitc_loteria` DEFAULT CHARACTER SET utf8 ;
USE `goldbitc_loteria` ;

-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`Bilhete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`Bilhete` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numeros` VARCHAR(100) NOT NULL,
  `mediana` VARCHAR(45) NULL,
  `media` VARCHAR(45) NULL,
  `moda` VARCHAR(45) NULL,
  `variancia` VARCHAR(45) NULL,
  `varianciaAmostral` VARCHAR(45) NULL,
  `desvioPadrao` VARCHAR(45) NULL,
  `desvioPadraoAmostral` VARCHAR(45) NULL,
  `max` VARCHAR(45) NULL,
  `min` VARCHAR(45) NULL,
  `modaInversa` VARCHAR(45) NULL,
  `coeficientedevariacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `numeros_UNIQUE` (`numeros` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`Bilhete_Coluna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`Bilhete_Coluna` (
  `id` INT NOT NULL,
  `numeros` VARCHAR(100) NULL,
  `Bilhete_id` INT NOT NULL,
  `mediana` VARCHAR(45) NULL,
  `media` VARCHAR(45) NULL,
  `moda` VARCHAR(45) NULL,
  `variancia` VARCHAR(45) NULL,
  `varianciaAmostral` VARCHAR(45) NULL,
  `desvioPadrao` VARCHAR(45) NULL,
  `desvioPadraoAmostral` VARCHAR(45) NULL,
  `max` VARCHAR(45) NULL,
  `min` VARCHAR(45) NULL,
  `modaInversa` VARCHAR(45) NULL,
  `Bilhete_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Bilhete_Coluna_Bilhete1_idx` (`Bilhete_id1` ASC),
  CONSTRAINT `fk_Bilhete_Coluna_Bilhete1`
    FOREIGN KEY (`Bilhete_id1`)
    REFERENCES `goldbitc_loteria`.`Bilhete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`moda_BilheteColuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`moda_BilheteColuna` (
  `id` INT NOT NULL,
  `moda` VARCHAR(45) NULL,
  `Bilhete_Coluna_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_moda_BilheteColuna_Bilhete_Coluna1_idx` (`Bilhete_Coluna_id` ASC),
  CONSTRAINT `fk_moda_BilheteColuna_Bilhete_Coluna1`
    FOREIGN KEY (`Bilhete_Coluna_id`)
    REFERENCES `goldbitc_loteria`.`Bilhete_Coluna` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`EstatisticaTodosDados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`EstatisticaTodosDados` (
  `id` INT NOT NULL,
  `mo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`mediana_BilheteColuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`mediana_BilheteColuna` (
  `id` INT NOT NULL,
  `mediana` VARCHAR(45) NULL,
  `Bilhete_Coluna_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mediana_BilheteColuna_Bilhete_Coluna1_idx` (`Bilhete_Coluna_id` ASC),
  CONSTRAINT `fk_mediana_BilheteColuna_Bilhete_Coluna1`
    FOREIGN KEY (`Bilhete_Coluna_id`)
    REFERENCES `goldbitc_loteria`.`Bilhete_Coluna` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`max`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`max` (
  `id` INT NOT NULL,
  `max` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`Bilhete_Coluna_NaoSaiu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`Bilhete_Coluna_NaoSaiu` (
  `id` INT NOT NULL,
  `numeros` VARCHAR(100) NULL,
  `Bilhete_id` INT NOT NULL,
  `mediana` VARCHAR(45) NULL,
  `media` VARCHAR(45) NULL,
  `moda` VARCHAR(45) NULL,
  `variancia` VARCHAR(45) NULL,
  `varianciaAmostral` VARCHAR(45) NULL,
  `desvioPadrao` VARCHAR(45) NULL,
  `desvioPadraoAmostral` VARCHAR(45) NULL,
  `max` VARCHAR(45) NULL,
  `min` VARCHAR(45) NULL,
  `modaInversa` VARCHAR(45) NULL,
  `Bilhete_Coluna_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Bilhete_Coluna_NaoSaiu_Bilhete_Coluna1_idx` (`Bilhete_Coluna_id` ASC),
  CONSTRAINT `fk_Bilhete_Coluna_NaoSaiu_Bilhete_Coluna1`
    FOREIGN KEY (`Bilhete_Coluna_id`)
    REFERENCES `goldbitc_loteria`.`Bilhete_Coluna` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`Bilhete_Linha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`Bilhete_Linha` (
  `id` INT NOT NULL,
  `numeros` VARCHAR(100) NULL,
  `Bilhete_id` INT NOT NULL,
  `mediana` VARCHAR(45) NULL,
  `media` VARCHAR(45) NULL,
  `moda` VARCHAR(45) NULL,
  `variancia` VARCHAR(45) NULL,
  `varianciaAmostral` VARCHAR(45) NULL,
  `desvioPadrao` VARCHAR(45) NULL,
  `desvioPadraoAmostral` VARCHAR(45) NULL,
  `max` VARCHAR(45) NULL,
  `min` VARCHAR(45) NULL,
  `modaInversa` VARCHAR(45) NULL,
  `Bilhete_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Bilhete_Linha_Bilhete1_idx` (`Bilhete_id1` ASC),
  CONSTRAINT `fk_Bilhete_Linha_Bilhete1`
    FOREIGN KEY (`Bilhete_id1`)
    REFERENCES `goldbitc_loteria`.`Bilhete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`Bilhete_Linha_naosaiu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`Bilhete_Linha_naosaiu` (
  `id` INT NOT NULL,
  `numeros` VARCHAR(100) NULL,
  `Bilhete_id` INT NOT NULL,
  `mediana` VARCHAR(45) NULL,
  `media` VARCHAR(45) NULL,
  `moda` VARCHAR(45) NULL,
  `variancia` VARCHAR(45) NULL,
  `varianciaAmostral` VARCHAR(45) NULL,
  `desvioPadrao` VARCHAR(45) NULL,
  `desvioPadraoAmostral` VARCHAR(45) NULL,
  `max` VARCHAR(45) NULL,
  `min` VARCHAR(45) NULL,
  `modaInversa` VARCHAR(45) NULL,
  `Bilhete_Linha_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Bilhete_Linha_naosaiu_Bilhete_Linha1_idx` (`Bilhete_Linha_id` ASC),
  CONSTRAINT `fk_Bilhete_Linha_naosaiu_Bilhete_Linha1`
    FOREIGN KEY (`Bilhete_Linha_id`)
    REFERENCES `goldbitc_loteria`.`Bilhete_Linha` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`DiadaSorte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`DiadaSorte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `n1` INT NULL,
  `n2` INT NULL,
  `n3` INT NULL,
  `n4` INT NULL,
  `n5` INT NULL,
  `n6` INT NULL,
  `n7` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldbitc_loteria`.`FrequenciaGrupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldbitc_loteria`.`FrequenciaGrupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `n1` INT NULL,
  `n2` INT NULL,
  `n3` INT NULL,
  `n4` INT NULL,
  `n5` INT NULL,
  `frequencia` INT NULL,
  `controle` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `controle_UNIQUE` (`controle` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
