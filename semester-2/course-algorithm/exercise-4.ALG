Algoritmo "Exercício 4 - Custo de um carro"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : <Ana Paula>
// Descrição   : <Descripton>
// Autor(a)    : <JUNIOR, Wesley>
// Data atual  : <01/09/2022>
Var
custoFabrica, custoConsumidor: real

Inicio
escreva("Escreva o custo de fábrica do carro: ")
leia(custoFabrica)

custoConsumidor <- (custoFabrica * 0.28) + (custoFabrica * 0.45)

escreval("") // Apenas para estilização
escreval("O custo do consumidor é de: ", custoConsumidor:8:2)
Fimalgoritmo