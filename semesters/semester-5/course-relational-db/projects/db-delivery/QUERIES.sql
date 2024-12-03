-- Lucas Faria (019790) e Wesley Júnior (020321)

SELECT COUNT(1) AS QuantidadeProdutos FROM Produtos;

SELECT AVG(preco) AS PrecoMedio FROM Produtos;

SELECT nome FROM Produtos WHERE estoque = (SELECT MAX(estoque) FROM Produtos);

SELECT nome FROM Produtos WHERE preco > 5;

SELECT F.nome
FROM Fornecedores F
INNER JOIN Tipos_Fornecedor TF ON F.tipo_id = TF.tipo_id
WHERE TF.descricao = 'Bebidas';

SELECT COUNT(1) AS NumeroFornecedores FROM Fornecedores;

SELECT nome FROM Fornecedores WHERE endereco = 'Rua Halls';

SELECT F.nome AS Fornecedor, Fo.entrega AS DataEntrega
FROM Fornecedores F
INNER JOIN Fornecimento Fo ON F.cnpj = Fo.cnpj
INNER JOIN Produtos P ON Fo.cod = P.cod
WHERE P.nome = 'Carne';

SELECT DISTINCT F.nome, Tipos_Fornecedor.descricao AS Fornecedor
FROM Fornecedores F
INNER JOIN Tipos_Fornecedor
	ON F.tipo_id = Tipos_Fornecedor.tipo_id
WHERE F.cnpj NOT IN (
    SELECT Fo.cnpj FROM Fornecimento Fo INNER JOIN Produtos P ON Fo.cod = P.cod WHERE P.nome IN ('Cerveja', 'Chocolate')
);

SELECT P.nome AS Produto
FROM Produtos P
INNER JOIN Fornecimento Fo ON P.cod = Fo.cod
WHERE Fo.entrega BETWEEN '2019-01-01' AND '2020-12-31';

SELECT C.nome
FROM Caixas C
INNER JOIN Vendidos V ON C.cpf = V.cpf
INNER JOIN Produtos P ON V.cod = P.cod
WHERE P.nome = 'Presunto';

SELECT DISTINCT C.nome
FROM Caixas C
INNER JOIN Vendidos V ON C.cpf = V.cpf
WHERE YEAR(V.data_venda) IN (2017, 2018);

SELECT DISTINCT C.nome
FROM Caixas C
INNER JOIN Vendidos V ON C.cpf = V.cpf
INNER JOIN Produtos P ON V.cod = P.cod
WHERE P.nome = 'Caviar';

SELECT C.nome
FROM Caixas C
WHERE C.cpf NOT IN (SELECT V.cpf FROM Vendidos V JOIN Produtos P ON V.cod = P.cod WHERE P.nome = 'Carne');

SELECT C.nome
FROM Caixas C
WHERE EXISTS (SELECT 1 FROM Vendidos V WHERE V.cpf = C.cpf AND V.data_venda < '2018-01-01');

SELECT P.nome
FROM Produtos P
WHERE P.preco < ANY (SELECT preco FROM Produtos WHERE nome = '%Cerveja%');

SELECT YEAR(desde) AS AnoCadastro, AVG(YEAR(GETDATE()) - YEAR(desde)) AS AnoMedio
FROM Clientes
GROUP BY YEAR(desde)
HAVING COUNT(*) >= 2;

SELECT D.nome_moto
FROM Delivery D
INNER JOIN Controle_Entrega CE ON D.cod_entregador = CE.cod_entregador
GROUP BY D.nome_moto
HAVING COUNT(DISTINCT CE.id_cliente) > 3;




