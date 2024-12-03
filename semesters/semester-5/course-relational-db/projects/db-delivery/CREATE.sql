-- Lucas Faria (019790) e Wesley Júnior (020321)

CREATE TABLE Produtos (
    cod INT PRIMARY KEY IDENTITY,
    nome VARCHAR(25) NOT NULL,
    preco MONEY NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Tipos_Fornecedor (
    tipo_id INT PRIMARY KEY IDENTITY,
    descricao VARCHAR(30) NOT NULL
);

CREATE TABLE Fornecedores (
    cnpj VARCHAR(18) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(30) NOT NULL,

    tipo_id INT,
    FOREIGN KEY (tipo_id) REFERENCES Tipos_Fornecedor(tipo_id)
);


CREATE TABLE Fornecimento (
	id INT PRIMARY KEY IDENTITY,
    entrega DATE NOT NULL,

    cod INT,
    cnpj VARCHAR(18),
    
	FOREIGN KEY (cnpj) REFERENCES Fornecedores(cnpj),
    FOREIGN KEY (cod) REFERENCES Produtos(cod)
);

CREATE TABLE Tipos_Delivery (
    tipo_id INT PRIMARY KEY IDENTITY,
    descricao VARCHAR(30) NOT NULL
);

CREATE TABLE Delivery (
    cod_entregador INT PRIMARY KEY,
    nome_moto VARCHAR(30) NOT NULL,
    
	tipo_id INT,
    
	FOREIGN KEY (tipo_id) REFERENCES Tipos_Delivery(tipo_id)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    desde DATE
);

CREATE TABLE Caixas (
    cpf VARCHAR(18) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    salario MONEY NOT NULL
);

CREATE TABLE Vendidos (
	id INT PRIMARY KEY IDENTITY,
    data_venda DATETIME DEFAULT GETDATE(),

    cod INT,
    cpf VARCHAR(18),

    FOREIGN KEY (cpf) REFERENCES Caixas(cpf),
    FOREIGN KEY (cod) REFERENCES Produtos(cod)
);

CREATE TABLE Controle_Entrega (
    id INT PRIMARY KEY IDENTITY,
    descricao VARCHAR(100) NOT NULL,

	id_venda INT,
    id_cliente INT,
    cod_entregador INT,

    FOREIGN KEY (id_venda) REFERENCES Vendidos(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (cod_entregador) REFERENCES Delivery(cod_entregador)
);
