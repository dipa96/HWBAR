SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `hwbar2` DEFAULT CHARACTER SET utf8 ;
USE `hwbar2` ;

CREATE TABLE IF NOT EXISTS `hwbar2`.`categorie` (
  `idcategorie` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorie`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `hwbar2`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  `indirizzo` VARCHAR(45) NOT NULL,
  `dnascita` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `cap` INT(6) NOT NULL,
  `ntel1` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `ruolo` VARCHAR(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `hwbar2`.`indirizzo_sped` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `indirizzo` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `cap` INT(11) NOT NULL,
  `num_tel` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  `status` INT(11) NOT NULL,
  `civico` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_indirizzo_users_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_indirizzo_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `hwbar2`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `hwbar2`.`pagamento` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `circuito` VARCHAR(45) NOT NULL,
  `codice` VARCHAR(45) NOT NULL,
  `cvc` INT(4) NOT NULL,
  `scad` VARCHAR(45) NULL DEFAULT NULL,
  `intestatario` VARCHAR(45) NULL DEFAULT NULL,
  `status` INT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pagamento_users_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_pagamento_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `hwbar2`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `hwbar2`.`ordini_user` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `totale` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL,
  `data` VARCHAR(45) NULL DEFAULT NULL,
  `status` INT(11) NOT NULL,
  `users_id` INT(10) UNSIGNED NOT NULL,
  `pagamento_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `indirizzo_sped_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ordini_user_users_idx` (`users_id` ASC) ,
  INDEX `fk_ordini_user_pagamento_idx` (`pagamento_id` ASC) ,
  INDEX `fk_ordini_user_indirizzo_sped1_idx` (`indirizzo_sped_id` ASC) ,
  CONSTRAINT `fk_ordini_user_indirizzo_sped1`
    FOREIGN KEY (`indirizzo_sped_id`)
    REFERENCES `hwbar2`.`indirizzo_sped` (`id`),
  CONSTRAINT `fk_ordini_user_pagamento1`
    FOREIGN KEY (`pagamento_id`)
    REFERENCES `hwbar2`.`pagamento` (`id`),
  CONSTRAINT `fk_ordini_user_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `hwbar2`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `hwbar2`.`prodotti` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `prezzo` DECIMAL(6,2) NOT NULL,
  `deposito` INT(11) NOT NULL,
  `descrizione` VARCHAR(150) NULL DEFAULT NULL,
  `categorie_idcategorie` INT(11) NOT NULL,
  `path` VARCHAR(500) NULL DEFAULT NULL,
  `status` INT(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `fk_prodotti_categorie_idx` (`categorie_idcategorie` ASC) ,
  CONSTRAINT `fk_prodotti_categorie1`
    FOREIGN KEY (`categorie_idcategorie`)
    REFERENCES `hwbar2`.`categorie` (`idcategorie`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `hwbar2`.`ordini_prodotti` (
  `ordini_user_id` INT(11) NOT NULL,
  `prodotti_id` INT(11) NOT NULL,
  `qnt` INT(10) UNSIGNED NOT NULL,
  `totalep` DECIMAL(6,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ordini_user_id`, `prodotti_id`),
  INDEX `fk_ordini_prodotti_prodotti_idx` (`prodotti_id` ASC) ,
  INDEX `fk_ordini_prodotti_ordini_user_idx` (`ordini_user_id` ASC) ,
  CONSTRAINT `fk_ordini_user_has_prodotti_ordini_user`
    FOREIGN KEY (`ordini_user_id`)
    REFERENCES `hwbar2`.`ordini_user` (`id`),
  CONSTRAINT `fk_ordini_user_has_prodotti_prodotti1`
    FOREIGN KEY (`prodotti_id`)
    REFERENCES `hwbar2`.`prodotti` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `hwbar2`.`assistenza` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` INT(10) UNSIGNED NOT NULL,
  `stato` INT NULL DEFAULT 0,
  `messaggio` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_assistenza_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_assistenza_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `hwbar2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
