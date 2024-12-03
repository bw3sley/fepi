# Texto de contextualização

No mundial de fórmula XP existem várias provas conhecidas como grande prêmio. Um grande prêmio é caracterizado por um nome único e uma quantidade de voltas. Durante o grande prêmio são realizadas várias voltas por um carro de competição que percorre muitas voltas. Essas voltas são caracterizadas por um número de situações: situação de quebra, situação de ultrapassagem, situação de box. A situação de quebra da volta de um carro é definida como o motivo da quebra. A situação de ultrapassagem da volta de um carro é definida pelo carro foi ultrapassado e quantidade de pneus trocados. Um carro de competição é caracterizada por um número único e potência. Todo carro de competição contém apenas um único piloto, vários engenheiros mecânicos e é de uma única equipe. O piloto é caracterizado pelo nome, nacionalidade, data de contrato. O engenheiro é caracterizado pelo CREA, nome e data de contrato. Os pilotos e os engenheiros são membros de uma equipe que é caracterizada por um nome e data de fundação. Os engenheiros mecânicos são definidos pela especialidade, nome, data de contrato e data de nascimento.

# Explicando os relacionamentos
## Grande prêmio e Volta
Um `grande_premio` **POSSUI** várias `volta`, porém uma `volta` só **PERTENCE** a um `grande_premio`. Isso reflete como cada evento de grande prêmio é composto por múltiplas voltas, mas cada volta ocorre dentro do contexto de um único grande prêmio.

## Volta e Carro de competição (utilizando a tabela associativa `volta_carro`**)**
Uma `volta` pode envolver vários `carro_competicao` e um `carro_competicao` pode participar de várias `volta`, estabelecendo um relacionamento **MUITOS-PARA-MUITOS**. A tabela `volta_carro` serve como uma ponte para este relacionamento, permitindo registrar quais carros competiram em quais voltas.

## Carro de Competição, Piloto e Equipe
Um `carro_competicao` é **CONDUZIDO POR** um único `piloto` e **PERTENCE** a uma única `equipe`. Isso destaca a exclusividade da relação entre um carro, seu piloto e a equipe à qual ambos estão associados, refletindo como cada carro de competição tem um piloto designado e é operado por uma equipe específica.

## **Pilotos e Engenheiros Mecânicos em Equipes**
Um `piloto` e um `engenheiro_mecanico` **SÃO MEMBROS DE** uma `equipe`, significando que tanto pilotos quanto engenheiros fazem parte de equipes de corrida, embora desempenhem funções diferentes. Cada membro contribui com suas habilidades e conhecimentos específicos para o sucesso da equipe.

## **Volta e Situação**
Uma `volta` pode ter associadas a ela várias `situacao`, indicando que diversos eventos (como quebras, ultrapassagens, ou paradas no box) podem ocorrer durante a mesma volta. Este relacionamento **UM-PARA-MUITOS** permite detalhar as diversas circunstâncias que podem impactar o desempenho em uma volta específica.

# Script de banco de dados
## SQL Server
### Criação das tabelas
```
USE fepi;

-- Criação do Schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'atividade_c')
BEGIN
    EXEC('CREATE SCHEMA atividade_c');
END

-- Criação da tabela Grande Prêmio
CREATE TABLE atividade_c.grande_premio (
    id INT PRIMARY KEY,
    nome VARCHAR(255) UNIQUE,
    quantidade_voltas INT
);

-- Criação da tabela Equipe
CREATE TABLE atividade_c.equipe (
    id INT PRIMARY KEY,
    nome VARCHAR(255) UNIQUE,
    data_fundacao DATETIME
);

-- Criação da tabela Volta
CREATE TABLE atividade_c.volta (
    id INT PRIMARY KEY,
    grande_premio_id INT,
    FOREIGN KEY (grande_premio_id) REFERENCES atividade_c.grande_premio(id)
);

-- Criação da tabela Piloto
CREATE TABLE atividade_c.piloto (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(255),
    data_contrato DATETIME,
    equipe_id INT,
    FOREIGN KEY (equipe_id) REFERENCES atividade_c.equipe(id)
);

-- Criação da tabela Carro de Competição
CREATE TABLE atividade_c.carro_competicao (
    numero INT PRIMARY KEY,
    potencia INT,
    equipe_id INT,
    piloto_id INT,
    FOREIGN KEY (equipe_id) REFERENCES atividade_c.equipe(id),
    FOREIGN KEY (piloto_id) REFERENCES atividade_c.piloto(id)
);

-- Criação da tabela Engenheiro Mecânico
CREATE TABLE atividade_c.engenheiro_mecanico (
    crea INT PRIMARY KEY,
    nome VARCHAR(255),
    especialidade VARCHAR(255),
    data_contrato DATETIME,
    data_nascimento DATETIME,
    equipe_id INT,
    FOREIGN KEY (equipe_id) REFERENCES atividade_c.equipe(id)
);


-- Criação da tabela Volta_Carro (para relacionamento Muitos-para-Muitos entre Volta e Carro de Competição)
CREATE TABLE atividade_c.volta_carro (
    volta_id INT,
    carro_competicao_numero INT,
    PRIMARY KEY (volta_id, carro_competicao_numero),
    FOREIGN KEY (volta_id) REFERENCES atividade_c.volta(id),
    FOREIGN KEY (carro_competicao_numero) REFERENCES atividade_c.carro_competicao(numero)
);

-- Criação da tabela Situação
CREATE TABLE atividade_c.situacao (
    id INT PRIMARY KEY,
    volta_id INT,
    tipo_situacao VARCHAR(255),
    descricao VARCHAR(255) NULL,
    quantidade_pneus_trocados INT NULL,
    FOREIGN KEY (volta_id) REFERENCES atividade_c.volta(id)
);
```
### Criação de registros (seed)
```
USE fepi;

-- Inserção de dados na tabela Equipe
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO atividade_c.equipe (id, nome, data_fundacao)
    VALUES (@i, CONCAT('Equipe ', @i), DATEADD(day, -(@i * 365), GETDATE()));
    SET @i = @i + 1;
END

-- Inserção de dados na tabela Piloto
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO atividade_c.piloto (id, nome, nacionalidade, data_contrato, equipe_id)
    VALUES (@i, CONCAT('Piloto ', @i), 'Nacionalidade ' + CAST(@i AS VARCHAR(10)), DATEADD(day, -(@i * 30), GETDATE()), @i);
    SET @i = @i + 1;
END

-- Inserção de dados na tabela Carro de Competição
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO atividade_c.carro_competicao (numero, potencia, equipe_id, piloto_id)
    VALUES (@i, 600 + (@i * 10), @i, @i);
    SET @i = @i + 1;
END

-- Inserção de dados na tabela Grande Prêmio
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO atividade_c.grande_premio (id, nome, quantidade_voltas)
    VALUES (@i, CONCAT('Grande Prêmio ', @i), 50 + (@i % 20));
    SET @i = @i + 1;
END

```
## mySQL
### Criação das tabelas
```
USE fepi;

-- Criação da tabela Equipe
CREATE TABLE IF NOT EXISTS atividade_c.equipe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) UNIQUE,
    data_fundacao DATE
) ENGINE=InnoDB;

-- Criação da tabela Piloto
CREATE TABLE IF NOT EXISTS atividade_c.piloto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(255),
    data_contrato DATE,
    equipe_id INT,
    FOREIGN KEY (equipe_id) REFERENCES atividade_c.equipe(id)
) ENGINE=InnoDB;

-- Criação da tabela Carro de Competição
CREATE TABLE IF NOT EXISTS atividade_c.carro_competicao (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    potencia INT,
    equipe_id INT,
    piloto_id INT,
    FOREIGN KEY (equipe_id) REFERENCES atividade_c.equipe(id),
    FOREIGN KEY (piloto_id) REFERENCES atividade_c.piloto(id)
) ENGINE=InnoDB;

-- Criação da tabela Grande Prêmio
CREATE TABLE IF NOT EXISTS atividade_c.grande_premio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) UNIQUE,
    quantidade_voltas INT
) ENGINE=InnoDB;

-- Criação da tabela Volta
CREATE TABLE IF NOT EXISTS atividade_c.volta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    grande_premio_id INT,
    FOREIGN KEY (grande_premio_id) REFERENCES atividade_c.grande_premio(id)
) ENGINE=InnoDB;

-- Criação da tabela Volta_Carro
CREATE TABLE IF NOT EXISTS atividade_c.volta_carro (
    volta_id INT,
    carro_competicao_numero INT,
    PRIMARY KEY (volta_id, carro_competicao_numero),
    FOREIGN KEY (volta_id) REFERENCES atividade_c.volta(id),
    FOREIGN KEY (carro_competicao_numero) REFERENCES atividade_c.carro_competicao(numero)
) ENGINE=InnoDB;

-- Criação da tabela Situação
CREATE TABLE IF NOT EXISTS atividade_c.situacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    volta_id INT,
    tipo_situacao VARCHAR(255),
    descricao VARCHAR(255) NULL,
    quantidade_pneus_trocados INT NULL,
    FOREIGN KEY (volta_id) REFERENCES atividade_c.volta(id)
) ENGINE=InnoDB;
```


