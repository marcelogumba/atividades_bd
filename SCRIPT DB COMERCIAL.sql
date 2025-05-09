CREATE DATABASE comercial;    # Criação do banco de dados "Comercial"
USE  comercial;				  # Comando para selecionar o banco desejado

-- ATIVAR O EVENT SCHEDULER
SET GLOBAL event_scheduler = ON;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE comclien (
    n_numeclien INT PRIMARY KEY AUTO_INCREMENT,
    c_nomeclien VARCHAR(40),
    c_cidaclien VARCHAR(30),
    c_estaclien CHAR(2),
    c_foneclien VARCHAR(20)
);

CREATE TABLE comvenda (
    n_numvenda INT PRIMARY KEY AUTO_INCREMENT,
    d_datavenda DATE,
    n_numeclien INT,
    n_totavenda FLOAT(10,2),
    FOREIGN KEY (n_numeclien) REFERENCES comclien(n_numeclien)
);

CREATE TABLE comvende (
    n_numvende INT PRIMARY KEY AUTO_INCREMENT,
    c_nomevende VARCHAR(40),
    c_cidavende VARCHAR(30),
    c_estavende CHAR(2),
    c_fonevende VARCHAR(20),
    n_comivende FLOAT(10,2)
);

CREATE TABLE comivenda (
    n_numeivenda INT,
    n_valoivenda FLOAT(10,2),
    n_descivenda FLOAT(10,2),
    n_qtdeivenda INT
);

CREATE TABLE comcontato (
    n_numecontato INT PRIMARY KEY AUTO_INCREMENT,
    c_nomecontato VARCHAR(40),
    c_fonecontato VARCHAR(20),
    c_cidacontato VARCHAR(30),
    c_estacontato CHAR(2),
    n_numeclien INT,
    FOREIGN KEY (n_numeclien) REFERENCES comclien(n_numeclien)
);

-- INSERÇÕES
INSERT INTO comclien VALUES (NULL, 'ANDRE', 'SANTOS', 'BA', '71-99999-9999');
INSERT INTO comclien VALUES (NULL, 'RODRIGO', 'SALVADOR', 'BA', '71-88888-8888');
INSERT INTO comclien VALUES (NULL, 'JULIANA', 'FEIRA', 'BA', '75-77777-7777');
INSERT INTO comclien VALUES (NULL, 'PATRICIA', 'SALVADOR', 'BA', '71-66666-6666');

-- CONSULTAS
SELECT * FROM comclien;
SELECT * FROM comclien ORDER BY c_nomeclien;
SELECT * FROM comclien WHERE c_estaclien = 'BA';
SELECT * FROM comclien WHERE c_cidaclien IN ('SALVADOR','FEIRA');
SELECT * FROM comclien WHERE c_nomeclien LIKE '%A';
SELECT * FROM comclien WHERE c_nomeclien LIKE 'J%';

-- CONSULTAS COM FUNÇÕES DE STRING
SELECT c_nomeclien, LENGTH(c_nomeclien) AS tamanho FROM comclien;
SELECT c_nomeclien, UPPER(c_nomeclien) AS maiuscula FROM comclien;
SELECT c_nomeclien, LOWER(c_nomeclien) AS minuscula FROM comclien;

-- CONSULTAS COM FUNÇÕES DE AGREGAÇÃO
SELECT COUNT(*) AS total_clientes FROM comclien;
SELECT c_cidaclien, COUNT(*) AS total_por_cidade FROM comclien GROUP BY c_cidaclien;
SELECT c_estaclien, COUNT(*) AS total_por_estado FROM comclien GROUP BY c_estaclien HAVING COUNT(*) >= 2;

-- CONSULTAS COM JOIN
SELECT a.n_numvenda, a.d_datavenda, b.c_nomeclien FROM comvenda a
INNER JOIN comclien b ON a.n_numeclien = b.n_numeclien;

-- ATUALIZAÇÃO E REMOÇÃO
UPDATE comclien SET c_nomeclien = 'PATRÍCIA SILVA' WHERE c_nomeclien = 'PATRICIA';
DELETE FROM comclien WHERE c_nomeclien = 'JULIANA';

-- PROCEDURE DE EXIBIÇÃO
DELIMITER //
CREATE PROCEDURE sp_exibe_clientes()
BEGIN
    SELECT * FROM comclien;
END //
DELIMITER ;

CALL sp_exibe_clientes();

-- FUNÇÃO PARA CALCULAR COMISSÃO
DELIMITER //
CREATE FUNCTION rt_percentual_comissao(codigo INT) RETURNS FLOAT(10,2)
DETERMINISTIC
BEGIN
    DECLARE percentual FLOAT(10,2);
    SELECT n_comivende INTO percentual FROM comvende WHERE n_numvende = codigo;
    RETURN percentual;
END //
DELIMITER ;

-- TRIGGER PARA CALCULAR COMISSÃO AUTOMÁTICA
DELIMITER //
CREATE TRIGGER tri_vendas_bi BEFORE INSERT ON comvenda
FOR EACH ROW
BEGIN
    DECLARE percentual_comissao FLOAT(10,2);
    DECLARE valor_comissao FLOAT(10,2);
    SET percentual_comissao = rt_percentual_comissao(NEW.n_numeclien);
    SET valor_comissao = ((NEW.n_totavenda * percentual_comissao) / 100);
    SET NEW.n_totavenda = valor_comissao;
END //
DELIMITER ;


-- INSERÇÃO MASSIVA DE CLIENTES COMO CONTATOS
INSERT INTO comcontato (n_numecontato, c_nomecontato, c_fonecontato, c_cidacontato, c_estacontato, n_numeclien)
SELECT NULL, c_nomeclien, c_foneclien, c_cidaclien, c_estaclien, n_numeclien FROM comclien;

-- CONSULTA FINAL COM JOIN MULTITABELA
SELECT c.c_nomeclien, v.n_numvenda, v.d_datavenda, v.n_totavenda
FROM comvenda v
JOIN comclien c ON v.n_numeclien = c.n_numeclien;
