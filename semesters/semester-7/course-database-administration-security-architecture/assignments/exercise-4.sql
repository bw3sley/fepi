-- 1) Criando o banco de dados
CREATE DATABASE lab2_num;
GO

USE lab2_num;
GO

-- 2) Criando a tabela de Funcionarios
CREATE TABLE Funcionarios (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    vaga VARCHAR(20) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    nascimento DATE,
    nacionalidade VARCHAR(30)
)
GO

-- 3) riando a tabela Departamentos
CREATE TABLE Departamentos (
    id_dept INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    saldo DECIMAL(15,2) NOT NULL CHECK (saldo >= 0)
)
GO

CREATE TABLE Trabalha_em (
    endereco VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    id_dept INT NOT NULL,
    desde DATE NOT NULL,
    capacidade VARCHAR(50),

    PRIMARY KEY (endereco, cpf, id_dept),
    
    FOREIGN KEY (cpf) REFERENCES Funcionarios(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_dept) REFERENCES Departamentos(id_dept) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

-- 4) Adicionando 10 funcionários
INSERT INTO Funcionarios (cpf, nome, vaga, sexo, nascimento, nacionalidade) VALUES
('11111111111', 'Bento de Alcantara', 'DRH', 'M', '1955-01-01', 'Brasil',),
('22222222222', 'Maria Mariana', 'OPE', 'F', '1992-05-12', 'EUA'),
('33333333333', 'Felipe Sobral', 'DRH', 'M', '2000-11-10', 'Brasil'),
('44444444444', 'Cristina Aguilera', 'DEV', 'F', '1977-03-15', 'Argentina'),
('55555555555', 'Bebeto Bolero', 'DIR', 'M', '1982-09-30', 'Brasil'),
('66666666666', 'Maria Brega', 'ENG', 'F', '1992-07-22', 'Paquistão'),
('77777777777', 'Chico Chaves', 'MED', 'M', '1985-06-14', 'Senegal'),
('88888888888', 'Paloma Arte', 'OPE', 'F', '1998-08-29', 'Brasil'),
('99999999999', 'Tim Jorge', 'DEV', 'M', '1948-12-02', 'Índia'),
('00000000000', 'Carlos Mota', 'DEV', 'M', '1990-04-21', 'Espanha')
GO

-- 5) Adicionando 5 departamentos
INSERT INTO Departamentos (nome, saldo) VALUES
('DEV', 1000),
('OPE', 20000),
('DRH', 50000),
('DIR', 1000000),
('ENG', 20000),
('MED', 203656)
GO

-- 6) Adicionando 5 registros no relacionamento Trabalha_em
INSERT INTO Trabalha_em (endereco, cpf, id_dept, desde, capacidade) VALUES
('Avenida Redonda', '2', 2, '2010-01-01', 'C++'),
('Rua Masseli', '3', 2, '2016-02-15', 'Enrolar'),
('Rua Nova', '4', 3, '2016-05-10', 'Prog'),
('Rua Sem Começo', '5', 3, '2015-07-20', 'Front End'),
('Rua Masseli', '1', 2, '2018-08-30', 'Enrolar')
GO

-- 7) Criando a tabela Reporta_a
CREATE TABLE Reporta_a (
    supervisor_cpf CHAR(11),
    subordinado_cpf CHAR(11),
    
    PRIMARY KEY (supervisor_cpf, subordinado_cpf),
    
    FOREIGN KEY (supervisor_cpf) REFERENCES Funcionarios(cpf) ON DELETE NO ACTION,
    FOREIGN KEY (subordinado_cpf) REFERENCES Funcionarios(cpf) ON DELETE CASCADE
)
GO

-- Desafio
CREATE TABLE Gerencia (
    cpf CHAR(11) NOT NULL,
    id_dept INT NOT NULL,
    desde DATE NOT NULL,
    
    PRIMARY KEY (id_dept),
    
    FOREIGN KEY (cpf) REFERENCES Funcionarios(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_dept) REFERENCES Departamentos(id_dept) ON DELETE CASCADE ON UPDATE CASCADE
)
GO