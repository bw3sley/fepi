DROP DATABASE IF EXISTS exercicio_5;
GO

CREATE DATABASE exercicio_5;
GO

USE exercicio_5;

CREATE TABLE funcionarios (
  id_funcionario INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE pilotos (
  id_funcionario INT PRIMARY KEY,
  FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE aeronaves (
  id_aeronave INT IDENTITY(1,1) PRIMARY KEY,
  modelo VARCHAR(100) NOT NULL,
  autonomia INT NOT NULL
);

CREATE TABLE voos (
  num_voo INT IDENTITY(1,1) PRIMARY KEY,
  origem VARCHAR(100) NOT NULL,
  destino VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  distancia INT NOT NULL,
  id_aeronave INT NOT NULL,
  FOREIGN KEY (id_aeronave) REFERENCES aeronaves(id_aeronave)
);

CREATE TABLE certificados (
  id_funcionario INT NOT NULL,
  id_aeronave INT NOT NULL,
  PRIMARY KEY (id_funcionario, id_aeronave),
  FOREIGN KEY (id_funcionario) REFERENCES pilotos(id_funcionario),
  FOREIGN KEY (id_aeronave) REFERENCES aeronaves(id_aeronave)
);

INSERT INTO funcionarios (nome, salario) VALUES 
('João Silva', 8500.00),
('Maria Oliveira', 9200.00),
('Carlos Souza', 7800.00),
('Ana Lima', 9900.00),
('Bruno Rocha', 8700.00);

INSERT INTO pilotos (id_funcionario) VALUES 
(1),
(2),
(3);

INSERT INTO aeronaves (modelo, autonomia) VALUES 
('Boeing 737', 5000),
('Airbus A320', 4800),
('Embraer 190', 4200),
('Super Tucano', 1500),
('K390', 3500);

INSERT INTO voos (origem, destino, preco, distancia, id_aeronave) VALUES 
('São Paulo', 'Rio de Janeiro', 350.00, 450, 1),
('Brasília', 'Salvador', 700.00, 1200, 2),
('Belo Horizonte', 'Fortaleza', 850.00, 2000, 3),
('Recife', 'Manaus', 950.00, 2500, 2),
('Curitiba', 'Porto Alegre', 300.00, 700, 1);

INSERT INTO certificados (id_funcionario, id_aeronave) VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);
