/* UFPEL
 * PBD - Projeto de Banco de Dados
 * Luan Einhardt - ldseinhardt@inf.ufpel.edu.br
 * Script de inserção da Companhia
 * Utilização dentro do mysql (source Companhia_insert.sql)
 */

-- AVISO !!! MANTENHA A ORDEM DAS INSERÇÕES !!!

-- Insere valores em departamento
INSERT INTO DEPARTAMENTO (DNOME, DNUMERO, DATINICGER) VALUES
  ('Pesquisa', 5, '1978-05-22'),
  ('Administrativo', 4, '1985-01-19');

-- Insere valores em empregado
INSERT INTO EMPREGADO VALUES ('Franklin', 'T', 'Wong', '333445555', '1945-12-08', 'R. B. 2', 'M', 4000, '888665555', 5, NULL);
INSERT INTO EMPREGADO VALUES ('john', 'B', 'Smith', '123456789', '1955-01-09', 'R. A. 1', 'M', 3000, '333445555', 5, NULL);
INSERT INTO EMPREGADO VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Trav. D. 4', 'F', 4300, '888665555', 4, NULL);
INSERT INTO EMPREGADO VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1958-07-19', 'Av. C. 3', 'F', 2500, '987654321', 4, NULL);
INSERT INTO EMPREGADO VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'R. E. 5', 'M', 3800, '333445555', 5, NULL);
INSERT INTO EMPREGADO VALUES ('Joyce', 'A', 'English', '453453453', '1962-07-31', 'R. F. 6', 'F', 2500, '333445555', 5, NULL);
INSERT INTO EMPREGADO VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Av. G. 7', 'M', 2500, '987654321', 4, 'Assistente');

-- Corrige valores em departamento
UPDATE DEPARTAMENTO SET NSSGER='987654321' WHERE DNUMERO=4;
UPDATE DEPARTAMENTO SET NSSGER='333445555' WHERE DNUMERO=5;

-- Insere valores em locais_depto
INSERT INTO LOCAIS_DEPTO VALUES
  (1, 'Houston'),
  (4, 'Stafford'),
  (5, 'Bellaire'),
  (5, 'Sugariand'),
  (5, 'Houston');

-- Insere valores em projeto
INSERT INTO PROJETO VALUES
  ('ProdutoX', 1, 'Bellaire', 5),
  ('ProdutoY', 2, 'Sugarland', 5),
  ('ProdutoZ', 3, 'Houston', 5),
  ('Automação', 10, 'Stafford', 4),
  ('Reorganização', 20, 'Houston', 1),
  ('Beneficiamento', 30, 'Stafford', 4);

-- Insere valores em trabalha_em
INSERT INTO TRABALHA_EM VALUES
  ('123456789', 1, 32.5),
  ('123456789', 2, 7.5),
  ('666884444', 3, 40.0),
  ('453453453', 1, 20.0),
  ('453453453', 2, 20.0),
  ('333445555', 2, 10.0),
  ('333445555', 3, 10.0),
  ('333445555', 10, 10.0),
  ('333445555', 20, 10.0),
  ('999887777', 30, 30.0),
  ('999887777', 10, 10.0),
  ('987987987', 10, 35.0),
  ('987987987', 30, 5.0),
  ('987654321', 30, 20.0),
  ('987654321', 20, NULL);

-- Insere valores em dependente
INSERT INTO DEPENDENTE VALUES
  ('333445555', 'Alice', 'F', '1976-04-05', 'FILHA'),
  ('333445555', 'Theodore', 'M', '1973-10-25', 'FILHO'),
  ('333445555', 'Joy', 'F', '1948-05-03', 'ESPOSA'),
  ('987654321', 'Abner', 'M', '1978-02-29', 'MARIDO'),
  ('123456789', 'Michael', 'M', '1978-01-01', 'FILHO'),
  ('123456789', 'Alice', 'F', '1978-12-31', 'FILHA'),
  ('123456789', 'Elizabeth', 'F', '1957-05-05', 'ESPOSA');

-- Mostra os dados inseridos em empregado
SELECT * FROM EMPREGADO;

-- Mostra os dados inseridos em departamento
SELECT * FROM DEPARTAMENTO;

-- Mostra os dados inseridos em locais_depto
SELECT * FROM LOCAIS_DEPTO;

-- Mostra os dados inseridos em projeto
SELECT * FROM PROJETO;

-- Mostra os dados inseridos em trabalha_em
SELECT * FROM TRABALHA_EM;

-- Mostra os dados inseridos em dependente
SELECT * FROM DEPENDENTE;
