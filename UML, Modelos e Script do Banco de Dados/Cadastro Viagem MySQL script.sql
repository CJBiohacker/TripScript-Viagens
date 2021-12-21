-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TripScript
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TripScript
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TripScript` ;
USE `TripScript` ;

-- -----------------------------------------------------
-- Table `TripScript`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TripScript`.`Cliente` (
  `idCliente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(150) NOT NULL,
  `Data_Nasc` DATE NOT NULL,
  `Endereco` VARCHAR(100) NOT NULL,
  `Celular` CHAR(11) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `TripScript`.`Viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TripScript`.`Viagem` (
  `idViagem` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Destino` VARCHAR(30) NOT NULL,
  `Data` DATE NOT NULL,
  `Horario` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(5,2) NOT NULL,
  `Quantidade` SMALLINT UNSIGNED NOT NULL,
  `Cliente_idCliente` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idViagem`),
  INDEX `fk_Viagem_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Viagem_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `TripScript`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
