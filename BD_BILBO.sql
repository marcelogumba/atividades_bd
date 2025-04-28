##### Criação da base de dados
CREATE DATABASE biblioteca;
USE biblioteca;

##### Tabela Pessoa
CREATE TABLE Pessoa (
    bi CHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('M', 'F') NOT NULL
);

##### Tabela Aluno
CREATE TABLE Aluno (
    bi CHAR(14) PRIMARY KEY,
    ano_academico INT NOT NULL,
    turma CHAR(1) NOT NULL,
    FOREIGN KEY (bi) REFERENCES Pessoa(bi)
);

##### Tabela Professor
CREATE TABLE Professor (
    bi CHAR(14) PRIMARY KEY,
    ano_experiencia INT NOT NULL,
    FOREIGN KEY (bi) REFERENCES Pessoa(bi)
);

##### Tabela Livro
CREATE TABLE Livro (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    ISBN CHAR(13) UNIQUE NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL
);

##### Tabela Emprestimo
CREATE TABLE Emprestimo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    livro_codigo INT NOT NULL,
    pessoa_bi CHAR(14) NOT NULL,
    FOREIGN KEY (livro_codigo) REFERENCES Livro(codigo),
    FOREIGN KEY (pessoa_bi) REFERENCES Pessoa(bi)
);

##### INSERÇÕES


##### 15 Inserções de Alunos - Pessoa
INSERT INTO Pessoa (bi, nome, data_nascimento, genero) VALUES
('008577829MO045', 'Ana Tchozo', '2004-05-12', 'F'), ('008577830MO046', 'Bruno Varela', '2003-08-22', 'M'),
('008577831MO047', 'Carla Prata', '2005-01-30', 'F'), ('008577832MO048', 'Daniel Nascimento', '2004-11-15', 'M'),
('008577833MO049', 'Eduarda Arda', '2003-07-09', 'F'), ('008577834MO050', 'Felipe Neto', '2005-02-17', 'M'),
('008577835MO051', 'Gabriela Campos', '2004-06-25', 'F'), ('008577836MO052', 'Henrique da Silva', '2003-12-03', 'M'),
('008577837MO053', 'Isabela Pinto', '2005-09-10', 'F'), ('008577838MO054', 'João Gomes', '2004-03-14', 'M'),
('008577839MO055', 'Karina Rina', '2005-04-20', 'F'), ('008577840MO056', 'Lucas Loco', '2004-10-05', 'M'),
('008577841MO057', 'Mariana Mendonça', '2003-02-28', 'F'), ('008577842MO058', 'Nicolas Testa', '2005-08-12', 'M'),
('008577843MO059', 'Olivia Azeite', '2004-01-18', 'F');

INSERT INTO Aluno (bi, ano_academico, turma) VALUES
('008577829MO045', 1, 'A'), ('008577830MO046', 2, 'B'), ('008577831MO047', 1, 'A'),('008577832MO048', 3, 'C'),
('008577833MO049', 2, 'B'), ('008577834MO050', 1, 'A'), ('008577835MO051', 2, 'B'), ('008577836MO052', 3, 'C'),
('008577837MO053', 1, 'A'), ('008577838MO054', 2, 'B'), ('008577839MO055', 1, 'A'), ('008577840MO056', 3, 'C'),
('008577841MO057', 2, 'B'), ('008577842MO058', 3, 'C'), ('008577843MO059', 1, 'A');

-- 15 Inserções Professores - Pessoa
INSERT INTO Pessoa (bi, nome, data_nascimento, genero) VALUES
('008577844MO060', 'Marcelo Gumba', '1980-04-12', 'M'), ('008577845MO061', 'Ricardo Amaral', '1978-09-18', 'M'),
('008577846MO062', 'Sandra Feca', '1985-07-20', 'F'), ('008577847MO063', 'Tatiane Lucas', '1982-03-11', 'F'),
('008577848MO064', 'Jorge Moraes', '1975-11-09', 'M'), ('008577849MO065', 'Valéria Valeriana', '1987-06-15', 'F'),
('008577850MO066', 'Lucas da Silva', '1979-10-30', 'M'), ('008577851MO067', 'Tereza Andrade', '1981-12-05', 'F'),
('008577852MO068', 'Yuri Lima', '1983-01-25', 'M'), ('008577853MO069', 'Zuleica Lopes', '1977-08-03', 'F'),
('008577854MO070', 'Arthur Tanda', '1986-05-07', 'M'), ('008577855MO071', 'Alexo Salvador', '1988-02-14', 'F'),
('008577856MO072', 'Caio Costa', '1981-09-22', 'M'), ('008577857MO073', 'Denise Braga', '1985-04-19', 'F'),
('008577858MO074', 'Elias Prado', '1979-07-01', 'M');

INSERT INTO Professor (bi, ano_experiencia) VALUES
('008577844MO060', 12), ('008577845MO061', 15), ('008577846MO062', 10), ('008577847MO063', 11),
('008577848MO064', 20), ('008577849MO065', 8), ('008577850MO066', 18), ('008577851MO067', 9),
('008577852MO068', 13), ('008577853MO069', 16), ('008577854MO070', 7), ('008577855MO071', 6),
('008577856MO072', 14), ('008577857MO073', 12), ('008577858MO074', 19);

INSERT INTO Livro (ISBN, titulo, autor, quantidade) VALUES
('9780001', 'O Senhor dos Anéis', 'J.R.R. Tolkien', 5),
('9780002', 'Dom Quixote', 'Miguel de Cervantes', 3),
('9780003', '1984', 'George Orwell', 4),
('9780004', 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 6),
('9780005', 'Cem Anos de Solidão', 'Gabriel García Márquez', 2),
('9780006', 'A Revolução dos Bichos', 'George Orwell', 7),
('9780007', 'Orgulho e Preconceito', 'Jane Austen', 5),
('9780008', 'A Odisséia', 'Homero', 2),
('9780009', 'O Hobbit', 'J.R.R. Tolkien', 6),
('9780010', 'Moby Dick', 'Herman Melville', 3),
('9780011', 'O Código Da Vinci', 'Dan Brown', 4),
('9780012', 'O Alquimista', 'Paulo Coelho', 8),
('9780013', 'Drácula', 'Bram Stoker', 2),
('9780014', 'A Metamorfose', 'Franz Kafka', 4),
('9780015', 'Crime e Castigo', 'Fiódor Dostoiévski', 5),
('9780016', 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 6),
('9780017', 'Senhora', 'José de Alencar', 3),
('9780018', 'Os Miseráveis', 'Victor Hugo', 4),
('9780019', 'A Divina Comédia', 'Dante Alighieri', 2),
('9780020', 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 10),
('9780021', 'Percy Jackson: O Ladrão de Raios', 'Rick Riordan', 7),
('9780022', 'A Menina que Roubava Livros', 'Markus Zusak', 5),
('9780023', 'Jogos Vorazes', 'Suzanne Collins', 6),
('9780024', 'O Nome do Vento', 'Patrick Rothfuss', 3),
('9780025', 'It: A Coisa', 'Stephen King', 4);


INSERT INTO Emprestimo (data_emprestimo, data_devolucao, livro_codigo, pessoa_bi) VALUES
('2025-04-01', '2025-04-10', 1, '008577829MO045'), -- aluno
('2025-04-02', '2025-04-12', 2, '008577830MO046'), -- aluno
('2025-04-03', '2025-04-13', 3, '008577831MO047'), -- aluno
('2025-04-04', '2025-04-14', 4, '008577832MO048'), -- aluno
('2025-04-05', '2025-04-15', 5, '008577833MO049'), -- aluno
('2025-04-06', '2025-04-16', 6, '008577834MO050'), -- aluno
('2025-04-07', '2025-04-17', 7, '008577835MO051'), -- aluno
('2025-04-08', '2025-04-18', 8, '008577836MO052'), -- aluno
('2025-04-09', '2025-04-19', 9, '008577837MO053'), -- aluno
('2025-04-10', '2025-04-20', 10, '008577838MO054'), -- aluno
('2025-04-11', '2025-04-21', 11, '008577839MO055'), -- aluno
('2025-04-12', '2025-04-22', 12, '008577840MO056'), -- aluno
('2025-04-13', '2025-04-23', 13, '008577841MO057'), -- aluno
('2025-04-14', '2025-04-24', 14, '008577842MO058'), -- aluno
('2025-04-15', '2025-04-25', 15, '008577843MO059'), -- aluno

('2025-04-01', '2025-04-11', 16, '008577844MO060'), -- professor
('2025-04-02', '2025-04-12', 17, '008577845MO061'), -- professor
('2025-04-03', '2025-04-13', 18, '008577846MO062'), -- professor
('2025-04-04', '2025-04-14', 19, '008577847MO063'), -- professor
('2025-04-05', '2025-04-15', 20, '008577848MO064'), -- professor
('2025-04-06', '2025-04-16', 21, '008577849MO065'), -- professor
('2025-04-07', '2025-04-17', 22, '008577850MO066'), -- professor
('2025-04-08', '2025-04-18', 23, '008577851MO067'), -- professor
('2025-04-09', '2025-04-19', 24, '008577852MO068'), -- professor
('2025-04-10', '2025-04-20', 25, '008577853MO069'); -- professor


## BUSCAS ---

## 1. Ver todos os alunos
SELECT p.bi, p.nome, p.data_nascimento, p.genero, a.ano_academico, a.turma
FROM Pessoa p
JOIN Aluno a ON p.bi = a.bi;

## 2. Ver todos os professores
SELECT p.bi, p.nome, p.data_nascimento, p.genero, pr.ano_experiencia
FROM Pessoa p
JOIN Professor pr ON p.bi = pr.bi;

## 3. Ver todos os livros
SELECT codigo, ISBN, titulo, autor, quantidade
FROM Livro;

## 4. Ver todos os empréstimos
SELECT e.data_emprestimo, e.data_devolucao, e.livro_codigo, e.pessoa_bi, p.nome
FROM Emprestimo e
JOIN Pessoa p ON e.pessoa_bi = p.bi;

## 5. Ver empréstimos em uma data específica (Exemplo: dia '2025-04-02')
SELECT e.data_emprestimo, e.data_devolucao, e.livro_codigo, e.pessoa_bi, p.nome
FROM Emprestimo e
JOIN Pessoa p ON e.pessoa_bi = p.bi
WHERE e.data_emprestimo = '2025-04-02';

## 6. Ver empréstimos de um aluno específico (Exemplo: aluno com BI '008577829MO045')
SELECT e.data_emprestimo, e.data_devolucao, e.livro_codigo, e.pessoa_bi, p.nome
FROM Emprestimo e
JOIN Pessoa p ON e.pessoa_bi = p.bi
WHERE e.pessoa_bi = '008577829MO045';

## 7. Ver empréstimos de um professor específico (Exemplo: professor com BI '008577844MO060')
SELECT e.data_emprestimo, e.data_devolucao, e.livro_codigo, e.pessoa_bi, p.nome
FROM Emprestimo e
JOIN Pessoa p ON e.pessoa_bi = p.bi
WHERE e.pessoa_bi = '008577844MO060';

## 8. Ver livros com uma certa quantidade (Exemplo: livros com quantidade menor ou igual a 5)
SELECT codigo, ISBN, titulo, autor, quantidade
FROM Livro
WHERE quantidade <= 5;

## 9. Ver apenas empréstimos feitos por professores
SELECT e.data_emprestimo, e.data_devolucao, e.livro_codigo, e.pessoa_bi, p.nome
FROM Emprestimo e
JOIN Pessoa p ON e.pessoa_bi = p.bi
WHERE e.pessoa_bi IN (SELECT bi FROM Professor);

## 10. Ver apenas empréstimos feitos por alunos
SELECT e.data_emprestimo, e.data_devolucao, e.livro_codigo, e.pessoa_bi, p.nome
FROM Emprestimo e
JOIN Pessoa p ON e.pessoa_bi = p.bi
WHERE e.pessoa_bi IN (SELECT bi FROM Aluno);




