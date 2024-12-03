-- Criação da tabela Produtos
CREATE TABLE Produtos (
    cod INT PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    preco MONEY NOT NULL,
    estoque INT NOT NULL
);

-- Criação da tabela Tipos_Fornecedor
CREATE TABLE Tipos_Fornecedor (
    tipo_id INT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL
);

-- Criação da tabela Tipos_Delivery
CREATE TABLE Tipos_Delivery (
    tipo_id INT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL
);

-- Criação da tabela Fornecedores
CREATE TABLE Fornecedores (
    cnpj VARCHAR(20) PRIMARY KEY, -- Eu sei, era melhor ser um id (uuid, incremental)
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    tipo_id INT,
    FOREIGN KEY (tipo_id) REFERENCES Tipos_Fornecedor(tipo_id)
);

-- Criação da tabela Fornecimento
CREATE TABLE Fornecimento (
    cod INT PRIMARY KEY,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    cnip VARCHAR(20) NOT NULL,
    entrega DATE NOT NULL,
    FOREIGN KEY (cnpj) REFERENCES Fornecedores(cnpj)
);

-- Criação da tabela Delivery
CREATE TABLE Delivery (
    cod_entregador INT PRIMARY KEY,
    nome_moto VARCHAR(30) NOT NULL,
    tipo_id INT,
    FOREIGN KEY (tipo_id) REFERENCES Tipos_Delivery(tipo_id)
);

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    id_cli INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    desde datetime NOT NULL
);

-- Criação da tabela Controle_Entrega
CREATE TABLE Controle_Entrega (
    cod INT PRIMARY KEY,
    cpf VARCHAR(15) UNIQUE,
    descriptivo VARCHAR(100) NOT NULL,

    id_cli INT,
    cod_entregador INT,
    FOREIGN KEY (id_cli) REFERENCES Clientes(id_cli),
    FOREIGN KEY (cod_entregador) REFERENCES Delivery(cod_entregador)
);

-- Criação da tabela Caixas
CREATE TABLE Caixas (
    cpf VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(30),
    nascimento date,
    endereco VARCHAR(50),
    salario MONEY
);

-- Criação da tabela Vendidos
CREATE TABLE Vendidos (
    cod INT PRIMARY KEY,
    cpf VARCHAR(15),
    cnip VARCHAR(20),
    data_venda DATE,
    FOREIGN KEY (cpf) REFERENCES Caixas(cpf),
    FOREIGN KEY (cnip) REFERENCES Clientes(id_cli)
);
