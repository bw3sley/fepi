Algoritmo "Exerc�cio 1 - Idade"
// Disciplina   : [Linguagem e L�gica de Programa��o]
// Professor   : <Ana Paula>
// Descri��o   : <Descripton>
// Autor(a)    : <JUNIOR, Wesley>
// Data atual  : <01/09/2022>
Var
idade: vetor[1..3] de real
total: real

Inicio
escreval("Escreva sua idade em anos, meses e dias, respectivamente: ")
leia(idade[1], idade[2], idade[3])

total <- ( idade[1] * 365 ) + ( idade[2] * 30 ) + idade[3]

escreval("") // Apenas para estiliza��o
escreval("Ent�o voc� tem ", idade[1], " , ", idade[2], " meses e ", idade[3], " dias")
escreval("Sua idade total em dias � de: ", total:8:0)
Fimalgoritmo