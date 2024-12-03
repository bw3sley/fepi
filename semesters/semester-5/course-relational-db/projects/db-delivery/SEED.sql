-- Lucas Faria (019790) e Wesley Júnior (020321)

INSERT INTO Tipos_Fornecedor (descricao) VALUES ('Distribuidor');
INSERT INTO Tipos_Fornecedor (descricao) VALUES ('Fabricante');
INSERT INTO Tipos_Fornecedor (descricao) VALUES ('Bebidas');

INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('12.345.678/0001-91', 'Fornecedor A', 'Endereço A', 1);
INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('98.765.432/0001-10', 'Fornecedor B', 'Endereço B', 2);
INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('56.789.123/0001-25', 'Fornecedor Bebidas', 'Endereço Bebidas', 3);
INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('11.111.111/0001-11', 'Fornecedor Carne', 'Endereço Carne', (SELECT TOP 1 tipo_id FROM Tipos_Fornecedor));
INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('22.222.222/0001-22', 'Fornecedor Cerveja', 'Endereço Cerveja', (SELECT TOP 1 tipo_id FROM Tipos_Fornecedor));
INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('33.333.333/0001-33', 'Fornecedor Chocolate', 'Endereço Chocolate', (SELECT TOP 1 tipo_id FROM Tipos_Fornecedor));
INSERT INTO Fornecedores (cnpj, nome, endereco, tipo_id) VALUES ('00.000.000/0001-00', 'Fornecedor X', 'Rua Halls', (SELECT TOP 1 tipo_id FROM Tipos_Fornecedor));

INSERT INTO Produtos (nome, preco, estoque) VALUES ('Produto 1', 10.00, 100);
INSERT INTO Produtos (nome, preco, estoque) VALUES ('Produto 2', 20.00, 200);
INSERT INTO Produtos (nome, preco, estoque) VALUES ('Cerveja', 15.00, 200);
INSERT INTO Produtos (nome, preco, estoque) VALUES ('Presunto', 30.00, 50);
INSERT INTO Produtos (nome, preco, estoque) VALUES ('Caviar', 300.00, 10);
INSERT INTO Produtos (nome, preco, estoque) VALUES ('Carne', 40.00, 100);
INSERT INTO Produtos (nome, preco, estoque) VALUES ('Chocolate', 5.00, 200);

INSERT INTO Fornecimento (entrega, cod, cnpj) VALUES ('2024-04-26', 1, '12.345.678/0001-91');
INSERT INTO Fornecimento (entrega, cod, cnpj) VALUES ('2024-04-27', 2, '98.765.432/0001-10');
INSERT INTO Fornecimento (entrega, cod, cnpj) VALUES ('2020-07-20', 3, '22.222.222/0001-22');
INSERT INTO Fornecimento (entrega, cod, cnpj) VALUES ('2019-06-15', 6, '11.111.111/0001-11');
INSERT INTO Fornecimento (entrega, cod, cnpj) VALUES ('2019-08-25', 7, '33.333.333/0001-33');

INSERT INTO Tipos_Delivery (descricao) VALUES ('Moto');
INSERT INTO Tipos_Delivery (descricao) VALUES ('Carro');

INSERT INTO Delivery (cod_entregador, nome_moto, tipo_id) VALUES (1, 'Entregador A', 1);
INSERT INTO Delivery (cod_entregador, nome_moto, tipo_id) VALUES (2, 'Entregador B', 2);

INSERT INTO Clientes (nome, endereco, desde) VALUES ('Cliente A', 'Endereço Cliente A', '2022-01-01');
INSERT INTO Clientes (nome, endereco, desde) VALUES ('Cliente B', 'Endereço Cliente B', '2022-06-01');
INSERT INTO Clientes (nome, endereco, desde) VALUES ('Cliente C', 'Endereço Cliente C', '2023-01-01');
INSERT INTO Clientes (nome, endereco, desde) VALUES ('Cliente D', 'Endereço Cliente D', '2023-02-01');
INSERT INTO Clientes (nome, endereco, desde) VALUES ('Cliente E', 'Endereço Cliente E', '2023-03-01');

INSERT INTO Caixas (cpf, nome, nascimento, endereco, salario) VALUES ('123.456.789-00', 'Caixa A', '1990-01-01', 'Endereço Caixa A', 3000.00);
INSERT INTO Caixas (cpf, nome, nascimento, endereco, salario) VALUES ('987.654.321-00', 'Caixa B', '1985-05-20', 'Endereço Caixa B', 3500.00);

INSERT INTO Vendidos (cod, cpf) VALUES (1, '123.456.789-00');
INSERT INTO Vendidos (cod, cpf) VALUES (2, '987.654.321-00');
INSERT INTO Vendidos (cod, cpf) VALUES (3, '123.456.789-00');
INSERT INTO Vendidos (cod, cpf) VALUES (4, '987.654.321-00');
INSERT INTO Vendidos (cod, cpf) VALUES ((SELECT top 1 cod FROM Produtos WHERE nome = 'Caviar'), (SELECT TOP 1 cpf FROM Caixas));
INSERT INTO Vendidos (cod, cpf, data_venda) VALUES ((SELECT TOP 1 cod FROM Produtos), (SELECT TOP 1 cpf FROM Caixas), DATEADD(year, -6, GETDATE()));
INSERT INTO Vendidos (cod, cpf, data_venda) VALUES ((SELECT TOP 1 cod FROM Produtos), (SELECT TOP 1 cpf FROM Caixas), DATEADD(year, -6, GETDATE()));
INSERT INTO Vendidos (cod, cpf, data_venda) VALUES ((SELECT TOP 1 cod FROM Produtos), (SELECT TOP 1 cpf FROM Caixas), DATEADD(year, -7, GETDATE()));

INSERT INTO Controle_Entrega (descricao, id_venda, id_cliente, cod_entregador) VALUES ('Entrega de Produto 1', 1, 1, 1);
INSERT INTO Controle_Entrega (descricao, id_venda, id_cliente, cod_entregador) VALUES ('Entrega de Produto 2', 2, 2, 2);
INSERT INTO Controle_Entrega (descricao, id_venda, id_cliente, cod_entregador) VALUES ('Entrega para Cliente C', (SELECT TOP 1 id FROM Vendidos), 3, 1);
INSERT INTO Controle_Entrega (descricao, id_venda, id_cliente, cod_entregador) VALUES ('Entrega para Cliente D', (SELECT TOP 1 id FROM Vendidos), 4, 1);
INSERT INTO Controle_Entrega (descricao, id_venda, id_cliente, cod_entregador) VALUES ('Entrega para Cliente E', (SELECT TOP 1 id FROM Vendidos), 5, 1);