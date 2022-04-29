#!/usr/bin/env node
const fs = require("fs");
const process = require("process");

/**
 * Tipos de tokens usados na linguagem .math.
 * @enum {string}
*/

const TOKEN_NUMBER = "NUMBER";
const TOKEN_PLUS = "PLUS";
const TOKEN_MINUS = "MINUS";
const TOKEN_MULTIPLIER = "MULTIPLIER";
const TOKEN_DIVIDER = "DIVIDER";
const TOKEN_LPAREN = "LPAREN";
const TOKEN_RPAREN = "RPAREN";
const TOKEN_EOF = "EOF";

/**
 * Classe que representa um token.
*/

class Token {
    /**
     * Cria um token.
     * @param {string} type - O tipo do token.
     * @param {*} value - O valor do token.
    */

    constructor(type, value) {
        this.type = type;
        this.value = value;
    }
}

/**
 * Converte o código fonte em uma lista de tokens.
 *
 * @param {string} input - O código fonte escrito em .math.
 * @returns {Token[]} Array de tokens.
 * @throws {Error} Se for encontrado um caractere inválido.
*/

function tokenize(input) {
    const tokens = [];

    let counter = 0;

    while (counter < input.length) {
        const char = input[counter];

        // Ignora espaços em branco
        if (/\s/.test(char)) {
            counter++;
            
            continue;
        }

        // Número (suporta inteiros e decimais)
        if (/\d/.test(char)) {
            let value = "";

            while (value < input.length && /[\d\.]/.test(input[counter])) {
                value += input[counter];

                counter++;
            }

            tokens.push(new Token(TOKEN_NUMBER, parseFloat(value)));

            continue;
        }

        if (char === "+") {
            tokens.push(new Token(TOKEN_PLUS, char));  

            counter++;

            continue;
        }

        if (char === "-") {
            tokens.push(new Token(TOKEN_MINUS, char));

            counter++;

            continue;
        }

        if (char === "*") {
            tokens.push(new Token(TOKEN_MULTIPLIER, char));

            counter++;

            continue;
        }

        if (char === "/") {
            tokens.push(new Token(TOKEN_DIVIDER, char));

            counter++;

            continue;
        }

        if (char === "(") {
            tokens.push(new Token(TOKEN_LPAREN, char));

            counter++;

            continue;
        }

        if (char === ")") {
            tokens.push(new Token(TOKEN_RPAREN, char));

            counter++;

            continue;
        }

        throw new Error(`Invalid character found: ${char}`);
    }

    tokens.push(new Token(TOKEN_EOF, null));

    return tokens;
}

/**
 * Classe responsável por converter a lista de tokens em uma Árvore de Sintaxe Abstrata (AST).
*/

class Parser {
    /**
     * Cria um parser.
     * @param {Token[]} tokens - Array de tokens gerados pelo lexer.
    */

    constructor(tokens) {
        this.tokens = tokens;
        this.position = 0;
        this.currentToken = tokens[0];
    }

    /**
     * Consome um token do tipo esperado.
     *
     * @param {string} tokenType - O tipo do token que se espera encontrar.
     * @throws {Error} Se o token atual não corresponder ao tipo esperado.
    */

    eat(tokenType) {
        if (this.currentToken.type === tokenType) {
            this.position++;
            this.currentToken = this.tokens[this.position];
        }

        else {
            throw new Error("Invalid syntax");
        }
    }

    /**
     * Processa um fator.
     * Um fator pode ser um número, uma expressão entre parênteses ou uma operação unária.
     *
     * @returns {Object} Nó da AST representando o fator.
     * @throws {Error} Se um token inválido for encontrado.
    */

    factor() {
        const token = this.currentToken;

        if (token.type === TOKEN_NUMBER) {
            this.eat(TOKEN_NUMBER);

            return {
                type: "NumberLiteral",
                value: token.value
            }
        }

        else if (token.type === TOKEN_LPAREN) {
            this.eat(TOKEN_LPAREN);

            const node = this.expr();

            this.eat(TOKEN_RPAREN);

            return node;
        }

        else if (token.type === TOKEN_PLUS) {
            this.eat(TOKEN_PLUS);

            const node = this.factor();

            return { 
                type: "UnaryOp",
                operator: "+",
                operand: node
            }
        }

        else if (token.type === TOKEN_MINUS) {
            this.eat(TOKEN_MINUS);

            const node = this.factor();

            return {
                type: "UnaryOp",
                operator: "-",
                operand: node
            }
        }

        throw new Error(`Invalid token in factor: ${token.type}`);
    }

    /**
     * Processa um termo.
     * Um termo consiste em fatores conectados por multiplicação ou divisão.
     *
     * @returns {Object} Nó da AST representando o termo.
    */

    term() {
        let node = this.factor();

        while ([TOKEN_MULTIPLIER, TOKEN_DIVIDER].includes(this.currentToken.type)) {
            const token = this.currentToken;

            if (token.type === TOKEN_MULTIPLIER) {
                this.eat(TOKEN_MULTIPLIER);
            }

            else if (token.type === TOKEN_DIVIDER) {
                this.eat(TOKEN_DIVIDER);
            }

            node = {
                type: "BinaryOp",
                operator: token.value,
                left: node,
                right: this.factor()
            }
        }

        return node;
    }

    /**
     * Processa uma expressão.
     * Uma expressão consiste em termos conectados por adição ou subtração.
     *
     * @returns {Object} Nó da AST representando a expressão.
    */

    expr() {
        let node = this.term();

        while ([TOKEN_PLUS, TOKEN_MINUS].includes(this.currentToken.type)) {
            const token = this.currentToken;

            if (token.type === TOKEN_PLUS) {
                this.eat(TOKEN_PLUS);
            }

            else if (token.type === TOKEN_MINUS) {
                this.eat(TOKEN_MINUS);
            }

            node = {
                type: "BinaryOp",
                operator: token.value,
                left: node,
                right: this.term()
            }
        }

        return node;
    }

    /**
     * Inicia o processo de parsing e retorna a AST resultante.
     *
     * @returns {Object} A AST da expressão compilada.
    */

    parse() {
        return this.expr();
    }
}

/**
 * Gera código JavaScript a partir da AST.
 *
 * @param {Object} node - Nó da AST.
 * @returns {string} Código JavaScript que representa a expressão.
 * @throws {Error} Se o tipo de nó for desconhecido.
*/

function generateCode(node) {
    if (node.type === "NumberLiteral") {
        return node.value;
    }

    else if (node.type === "BinaryOp") {
        return `(${generateCode(node.left)} ${node.operator} ${generateCode(node.right)})`;
    }

    else if (node.type === "UnaryOp") {
        return `(${node.operator}${generateCode(node.right)})`;
    }

    else {
        throw new Error("Unknown node type");
    }
}

/**
 * Compila o código fonte escrito em .math para código JavaScript.
 *
 * @param {string} source - O código fonte em .math.
 * @returns {string} Código JavaScript gerado a partir da AST.
*/

function compileMath(source) {
    const tokens = tokenize(source);

    const parser = new Parser(tokens);

    const ast = parser.parse();

    const jsCode = generateCode(ast);

    return jsCode;
}

/**
 * Bloco principal de execução.
 * Lê o arquivo passado como argumento na linha de comando, compila o código e exibe o resultado.
 *
 * Uso: node compiler.js <file-name.math>
*/

if (require.main === module) {
    const fileName = process.argv[2];

    if (!fileName) {
        console.error("Please provide a file name with .math extension");

        process.exit(1);
    }

    const source = fs.readFileSync(fileName, "utf-8");

    try {
        const jsCode = compileMath(source);

        console.log(`Result: ${eval(jsCode)}`);
    }

    catch (error) {
        console.log(error);
        console.error("An error occurred while compiling the '.math' expression");
    }
}