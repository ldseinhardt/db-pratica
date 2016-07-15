/* UFPEL
 * PBD - Projeto de Banco de Dados
 * Luan Einhardt - ldseinhardt@inf.ufpel.edu.br
 * Script de criação da Companhia
 * Utilização dentro do mysql (source Companhia.sql)
 */

-- Deleta a base de dados companhia se existir;
DROP DATABASE IF EXISTS Companhia;

-- Cria a base de dados Companhia
CREATE DATABASE Companhia;

-- Coloca a base de dados companhia em uso
USE Companhia;

-- Cria a tabela empregado
CREATE TABLE EMPREGADO (
  PNOME    VARCHAR(15)    NOT NULL,
  MNOME    CHAR,
  SNOME    VARCHAR(15)    NOT NULL,
  NSS      CHAR(9)        NOT NULL,
  DATANASC DATE,
  ENDERECO VARCHAR(30),
  SEXO     CHAR,
  SALARIO  DECIMAL(10, 2),
  NSSSUPER CHAR(9),
  NDEP     INT            NOT NULL
);

-- Adiciona a chave primaria da tabela empregado
ALTER TABLE EMPREGADO ADD PRIMARY KEY (NSS);

-- Adiciona a coluna funcao em empregado
ALTER TABLE EMPREGADO ADD FUNCAO VARCHAR(15);

-- Cria a tabela departamento
CREATE TABLE DEPARTAMENTO (
  DNOME      VARCHAR(15)  NOT NULL,
  DNUMERO    INT          NOT NULL,
  NSSGER     CHAR(9)      NOT NULL,
  DATINICGER DATE,
PRIMARY KEY (DNUMERO)
);

-- Insere o primeiro registro na tabela empregado
INSERT INTO EMPREGADO (PNOME, MNOME, SNOME, NSS, DATANASC, ENDERECO, SEXO, SALARIO, NDEP) VALUES
  ('James', 'E', 'Borg', '888665555', '1927-11-10', 'Av. H. 8', 'M', 5500, 1);

-- Adiciona a chave estrangeira em empregado que referencia empregado
ALTER TABLE EMPREGADO ADD FOREIGN KEY (NSSSUPER) REFERENCES EMPREGADO (NSS)
  ON DELETE SET NULL
  ON UPDATE CASCADE;


-- Insere o primeiro registro na tabela departamento
INSERT INTO DEPARTAMENTO VALUES
  ('Gerencial', 1, '888665555', '1971-06-19');

-- Adiciona a chave estrangeira em empregado que referencia departamento
ALTER TABLE EMPREGADO ADD FOREIGN KEY (NDEP) REFERENCES DEPARTAMENTO (DNUMERO);

-- Adiciona a chave estrangeira em departamento que referencia empregado
ALTER TABLE DEPARTAMENTO ADD FOREIGN KEY (NSSGER) REFERENCES EMPREGADO (NSS)
  ON DELETE CASCADE;

-- Altera departamento para receber como valore default
ALTER TABLE DEPARTAMENTO ALTER NSSGER SET DEFAULT '888665555';

-- Altera departamento para receber nomes unicos em dnome
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT DEPARTAMENTO_NOME UNIQUE (DNOME);

-- Cria a tabela locais_depto
CREATE TABLE LOCAIS_DEPTO (
  DNUMERO      INT         NOT NULL,
  DLOCALIZACAO VARCHAR(15) NOT NULL,
PRIMARY KEY (DNUMERO, DLOCALIZACAO),
FOREIGN KEY (DNUMERO) REFERENCES DEPARTAMENTO (DNUMERO) ON DELETE CASCADE
);

-- Cria a tabela projeto
CREATE TABLE PROJETO (
  PNOME        VARCHAR(15) NOT NULL,
  PNUMERO      INT         NOT NULL,
  PLOCALIZACAO VARCHAR(15),
  DNUM         INT         NOT NULL,
PRIMARY KEY (PNUMERO),
FOREIGN KEY (DNUM) REFERENCES DEPARTAMENTO (DNUMERO)
);

-- Altera projeto para receber nomes unicos em pnome
ALTER TABLE PROJETO ADD CONSTRAINT PROJETO_NOME UNIQUE (PNOME);

-- Cria a tabela trabalha_em
CREATE TABLE TRABALHA_EM (
  NSSEMP CHAR(9)       NOT NULL,
  PNRO   INT           NOT NULL,
  HORAS  DECIMAL(3, 1) NOT NULL,
PRIMARY KEY (NSSEMP, PNRO),
FOREIGN KEY (NSSEMP) REFERENCES EMPREGADO (NSS) ON DELETE CASCADE,
FOREIGN KEY (PNRO) REFERENCES PROJETO (PNUMERO) ON DELETE CASCADE
);

-- Altera na tabela trabalha_em para horas receber valores nulos
ALTER TABLE TRABALHA_EM MODIFY HORAS DECIMAL(3, 1) NULL;

-- Cria a tabela dependente
CREATE TABLE DEPENDENTE(
  NSSEMP         CHAR(9)     NOT NULL,
  NOMEDEPENDENTE VARCHAR(15) NOT NULL,
  SEXO           CHAR,
  DATANIV        DATE,
  RELACAO        VARCHAR(8),
PRIMARY KEY (NSSEMP, NOMEDEPENDENTE),
FOREIGN KEY (NSSEMP) REFERENCES EMPREGADO (NSS)
);

-- Mostra as tabelas criadas
SHOW TABLES;

-- Mostra a descrição da tabela empregado
DESCRIBE EMPREGADO;

-- Mostra a descrição da tabela departamento
DESCRIBE DEPARTAMENTO;

-- Mostra a descrição da tabela locais_depto
DESCRIBE LOCAIS_DEPTO;

-- Mostra a descrição da tabela projeto
DESCRIBE PROJETO;

-- Mostra a descrição da tabela trabalha_em
DESCRIBE TRABALHA_EM;

-- Mostra a descrição da tabela dependente
DESCRIBE DEPENDENTE;
