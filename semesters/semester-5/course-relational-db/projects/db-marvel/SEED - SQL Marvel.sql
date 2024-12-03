INSERT INTO marvel.tipo_personagem (tipo) VALUES ('Herói');
INSERT INTO marvel.tipo_personagem (tipo) VALUES ('Vilão');

INSERT INTO marvel.personagens (nome, forca, poder, id_tipo_personagem) VALUES ('Feiticeira', 80, 'Magia', 1);
INSERT INTO marvel.personagens (nome, forca, poder, id_tipo_personagem) VALUES ('Homem de Ferro', 90, 'Tecnologia', 1);
INSERT INTO marvel.personagens (nome, forca, poder, id_tipo_personagem) VALUES ('Thanos', 100, 'Força', 2);

INSERT INTO marvel.itens (id_personagem, nome) VALUES (1, 'Varinha');
INSERT INTO marvel.itens (id_personagem, nome) VALUES (1, 'Livro de Magia');
INSERT INTO marvel.itens (id_personagem, nome) VALUES (2, 'Armadura Mark 50');
INSERT INTO marvel.itens (id_personagem, nome) VALUES (3, 'Manopla do Infinito');

INSERT INTO marvel.batalhas (local, data_luta) VALUES ('Marte', '2024-05-10');
INSERT INTO marvel.batalhas (local, data_luta) VALUES ('Nova York', '2024-04-05');
INSERT INTO marvel.batalhas (local, data_luta) VALUES ('Londres', '2024-03-20');
INSERT INTO marvel.batalhas (local, data_luta) VALUES ('Tóquio', '2024-02-15');
INSERT INTO marvel.batalhas (local, data_luta) VALUES ('São Paulo', '2024-01-30');
INSERT INTO marvel.batalhas (local, data_luta) VALUES ('Paris', '2024-05-01');
INSERT INTO marvel.batalhas (local, data_luta) VALUES ('Berlim', '2024-04-25');

INSERT INTO marvel.personagens_batalha (id_batalha, id_personagem, id_oponente, vencedor) VALUES (1, 1, 3, 1); -- Feiticeira vs Thanos, Feiticeira venceu
INSERT INTO marvel.personagens_batalha (id_batalha, id_personagem, id_oponente, vencedor) VALUES (1, 3, 1, 0); -- Thanos vs Feiticeira, Thanos perdeu
INSERT INTO marvel.personagens_batalha (id_batalha, id_personagem, id_oponente, vencedor) VALUES (2, 2, 3, 1); -- Homem de Ferro vs Thanos, Homem de Ferro venceu
INSERT INTO marvel.personagens_batalha (id_batalha, id_personagem, id_oponente, vencedor) VALUES (3, 1, 2, 1); -- Feiticeira vs Homem de Ferro, Feiticeira venceu
INSERT INTO marvel.personagens_batalha (id_batalha, id_personagem, id_oponente, vencedor) VALUES (4, 3, 2, 0); -- Thanos vs Homem de Ferro, Thanos perdeu
INSERT INTO marvel.personagens_batalha (id_batalha, id_personagem, id_oponente, vencedor) VALUES (5, 2, 1, 1); -- Homem de Ferro vs Feiticeira, Homem de Ferro venceu
