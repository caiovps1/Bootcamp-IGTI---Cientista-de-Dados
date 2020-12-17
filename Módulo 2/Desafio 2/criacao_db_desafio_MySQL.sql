CREATE SCHEMA IF NOT EXISTS `db_desafio` DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_cor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_tiposanguineo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(3) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
  
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` CHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
  
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_estado` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_id_estado_idx` (`id_estado` ASC),
  CONSTRAINT `fk_id_estado`
		FOREIGN KEY (`id_estado`)
		REFERENCES `db_desafio`.`tb_estado` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
  
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_pessoa` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NULL,
    `idade` INT NULL, 
    `data_nasc` DATETIME NULL,
    `sexo` CHAR(1) NULL,
    `signo` VARCHAR(45) NULL,
    `altura` FLOAT NULL,
    `peso` FLOAT NULL,
    `id_cidade` INT NULL,
    `id_cor` INT NULL,
    `id_tiposanguineo` INT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_id_cidade_idx` (`id_cidade` ASC),
	INDEX `fk_id_cor_idx` (`id_cor` ASC),
    INDEX `fk_id_tiposanguineo_idx` (`id_tiposanguineo` ASC),
    CONSTRAINT `fk_id_cidade`
		FOREIGN KEY (`id_cidade`)
		REFERENCES `db_desafio`.`tb_cidade` (`id`),
	CONSTRAINT `fk_id_cor`
		FOREIGN KEY (`id_cor`)
		REFERENCES `db_desafio`.`tb_cor` (`id`),
	CONSTRAINT `fk_id_tiposanguineo`
		FOREIGN KEY (`id_tiposanguineo`)
		REFERENCES `db_desafio`.`tb_tiposanguineo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
