# Plano de Teste

**Lista de Compras no Terminal**

*versão 1.0*

## Histórico das alterações

   Data    | Versão |    Descrição   | Autor(a)
-----------|--------|----------------|-----------------
15/03/2025 |  1.0   | Release inicial | Equipe de Testes

## 1 - Introdução

Este documento descreve os requisitos a testar, os tipos de testes definidos para cada iteração, os recursos de hardware e software a serem empregados e o cronograma dos testes ao longo do projeto. As seções referentes aos requisitos, recursos e cronograma servem para permitir ao gerente do projeto acompanhar a evolução dos testes.

Com esse documento, você deve:
- Identificar informações de projeto existentes e os componentes de software que devem ser testados.
- Listar os Requisitos a testar.
- Recomendar e descrever as estratégias de teste a serem empregadas.
- Identificar os recursos necessários e prover uma estimativa dos esforços de teste.
- Listar os elementos resultantes do projeto de testes.

## 2 - Requisitos a Testar

Esta seção deve conter os casos de uso e requisitos não funcionais identificados como objetos dos testes ao longo do desenvolvimento do projeto.

### Casos de uso:

Identificador do caso de uso | Nome do caso de uso
-----------------------------|---------------------
UC01 | Adicionar Produto à Lista
UC02 | Marcar Produto Como Comprado
UC03 | Excluir Produto da Lista
UC04 | Limpar Lista

### Requisitos não-funcionais:

Identificador do requisito   | Nome do requisito
-----------------------------|---------------------
RNF01 | Persistência de dados
RNF02 | Performance aceitável

## 3 - Tipos de teste

Os seguintes tipos de testes serão realizados:

- **Teste de Unidade**
- **Teste de Integração**
- **Teste de Sistema**
- **Teste de Aceitação**
- **Teste de Regressão**
- **Teste de Carga**

### 3.1 - Métodos da Classe

Para teste de funcionalidade.
Aqui deve-se verificar se cada função retorna o esperado. Se possível, usar testes automatizados.

| Objetivo | Garantir o correto funcionamento das funções |
|----------|------------------------------------------|
| Técnica  | ( ) Manual (x) Automática |
| Estágio do teste | Unidade (x) Integração ( ) Sistema ( ) Aceitação ( ) |
| Abordagem do teste | Caixa branca (x) Caixa preta (x) |
| Responsável(is) | Lucas Faria e Wesley Júnior |

### 3.2 - Persistência de Dados

Para testar a integridade de dados e garantir que as informações não sejam perdidas após falhas.

| Objetivo | Verificar se os dados são mantidos após encerramento inesperado |
|----------|------------------------------------------------------|
| Técnica  | (x) Manual (x) Automática |
| Estágio do teste | Unidade ( ) Integração ( ) Sistema (x) Aceitação ( ) |
| Abordagem do teste | Caixa branca ( ) Caixa preta (x) |
| Responsável(is) | Lucas Faria e Wesley Júnior |

### 3.3 - Integração dos Componentes

Testar a comunicação entre diferentes funções do sistema.

| Objetivo | Garantir a integração entre os componentes |
|----------|-----------------------------------------|
| Técnica  | (x) Manual (x) Automática |
| Estágio do teste | Unidade ( ) Integração (x) Sistema ( ) Aceitação ( ) |
| Abordagem do teste | Caixa branca (x) Caixa preta (x) |
| Responsável(is) | Júlia Rodrigues e Lucas Gorgulho |

### 3.4 - Tempo de Resposta

Verificar se o tempo de resposta do programa é aceitável.

| Objetivo | Avaliar a performance do programa |
|----------|----------------------------------|
| Técnica  | ( ) Manual (x) Automática |
| Estágio do teste | Unidade ( ) Integração ( ) Sistema (x) Aceitação ( ) |
| Abordagem do teste | Caixa branca ( ) Caixa preta (x) |
| Responsável(is) | Gabriel Gorgulho e Lucas Faria |

### 3.5 - Teste de Carga

Avaliar como o sistema se comporta ao lidar com grandes volumes de dados.

| Objetivo | Verificar se o sistema mantém a estabilidade ao processar um grande número de itens |
|----------|-----------------------------------------------|
| Técnica  | ( ) Manual (x) Automática |
| Estágio do teste | Unidade ( ) Integração ( ) Sistema (x) Aceitação ( ) |
| Abordagem do teste | Caixa branca ( ) Caixa preta (x) |
| Responsável(is) | Wesley Júnior e Júlia Rodrigues |

## 4 - Recursos

### 4.1 - Ambiente de teste - Software e Hardware

- **Sistema Operacional:** Windows
- **Linguagem:** Python
- **Framework de Testes:** Pytest
- **Gerenciamento:** GitHub

### 4.2 - Ferramenta de teste

- **Pytest** para testes automatizados.
- **GitHub Actions** para integração contínua dos testes.

## 5 - Cronograma

| Tipo de teste | Duração | Data de início | Data de término |
|--------------|---------|---------------|---------------|
| Planejar teste | 1 dia | 15/03/2025 | 15/03/2025 |
| Projetar teste | 1 dia | 15/03/2025 | 15/03/2025 |
| Implementar teste | 2 dias | 15/03/2025 | 17/03/2025 |
| Executar teste | 1 dia | 17/03/2025 | 17/03/2025 |
| Avaliar teste | 1 dia | 17/03/2025 | 17/03/2025 |