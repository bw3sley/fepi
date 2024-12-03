-- Quais os itens do heroi chamado Feiticeira
SELECT 
	personagens.nome as nome_personagem, 
	itens.nome as nome_item 

FROM marvel.itens itens

INNER JOIN marvel.personagens personagens
	ON itens.id_personagem = personagens.id

WHERE personagens.nome = 'Feiticeira'

-- Quem foi o heroi e o vilão que lutaram em Marte

SELECT 
	batalhas.local,
	personagens.nome as nome_personagem,
	oponentes.nome as nome_oponente,
	
	personagens_batalha.vencedor

FROM marvel.personagens_batalha personagens_batalha

INNER JOIN marvel.personagens personagens
	ON personagens_batalha.id_personagem = personagens.id

INNER JOIN marvel.personagens oponentes
	ON personagens_batalha.id_oponente = oponentes.id

INNER JOIN marvel.batalhas batalhas
	ON personagens_batalha.id_batalha = batalhas.id

WHERE batalhas.local = 'Marte'