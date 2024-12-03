CREATE TABLE marvel.personagens (
	id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(50) NOT NULL,
	forca TINYINT NOT NULL,
	poder VARCHAR(50) NOT NULL,

	id_tipo_personagem INT
)

CREATE TABLE marvel.tipo_personagem (
	id INT PRIMARY KEY IDENTITY,
	tipo VARCHAR(50) NOT NULL
)

CREATE TABLE marvel.itens (
	id INT PRIMARY KEY IDENTITY,
	id_personagem INT,
	nome VARCHAR(50) NOT NULL
)

CREATE TABLE marvel.batalhas (
	id INT PRIMARY KEY IDENTITY,
	local VARCHAR(50) NOT NULL,
	data_luta DATE NOT NULL
)

CREATE TABLE marvel.personagens_batalha (
	id INT PRIMARY KEY IDENTITY,
	id_batalha INT,
	id_personagem INT,
	id_oponente INT,
	vencedor BIT NOT NULL
)

ALTER TABLE marvel.personagens
ADD CONSTRAINT fk_tipo_personagem 
FOREIGN KEY (id_tipo_personagem)
REFERENCES marvel.tipo_personagem (id)

ALTER TABLE marvel.itens
ADD CONSTRAINT fk_id_personagem
FOREIGN KEY (id_personagem)
REFERENCES marvel.personagens (id)

ALTER TABLE marvel.personagens_batalha
ADD CONSTRAINT fk_id_personagem_batalha
FOREIGN KEY (id_personagem)
REFERENCES marvel.personagens (id)

ALTER TABLE marvel.personagens_batalha
ADD CONSTRAINT fk_id_oponente_batalha
FOREIGN KEY (id_oponente)
REFERENCES marvel.personagens (id)

ALTER TABLE marvel.personagens_batalha
ADD CONSTRAINT fk_id_batalha
FOREIGN KEY (id_batalha)
REFERENCES marvel.batalhas (id)