import { describe, it, expect } from "vitest";

import { compileMath } from "./compiler.js";

/**
 * Avalia uma expressão na sintaxe .math usando o compilador.
 *
 * @param {string} expression - Expressão escrita na linguagem .math.
 * @returns {number} Resultado da avaliação da expressão.
*/

function evaluateExpression(expression) {
  const jsCode = compileMath(expression);

  return eval(jsCode);
}

describe("Math tests", () => {
    it ("should be able to calculate simple expressions", () => {
        const result = evaluateExpression("1 + 2");
        
        expect(result).toBe(3);
    })

    it ("should be able to calculate using prioritized operators", () => {
        const result = evaluateExpression("1 + 2 * 3");
        
        expect(result).toBe(7);
    })

    it ("should be able to calculate using parentheses", () => {
        const result = evaluateExpression("(1 + 2) * 3");
        
        expect(result).toBe(9);
    })

    it ("should be able to calculate using unary operators", () => {
        const result = evaluateExpression("-5 + +3");
        
        expect(result).toBe(-2);
    })

    it ("should be able to calculate complex expressions", () => {
        const result = evaluateExpression("3 + 4 * (2 - 1)");
        
        expect(result).toBe(7);
    })
})
