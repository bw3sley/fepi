Algoritmo "Exerc�cio 4 - Custo de um carro"
// Disciplina   : [Linguagem e L�gica de Programa��o]
// Professor   : <Ana Paula>
// Descri��o   : <Descripton>
// Autor(a)    : <JUNIOR, Wesley>
// Data atual  : <01/09/2022>
Var
custoFabrica, custoConsumidor: real

Inicio
escreva("Escreva o custo de f�brica do carro: ")
leia(custoFabrica)

custoConsumidor <- (custoFabrica * 0.28) + (custoFabrica * 0.45)

escreval("") // Apenas para estiliza��o
escreval("O custo do consumidor � de: ", custoConsumidor:8:2)
Fimalgoritmo