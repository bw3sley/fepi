Algoritmo "Exercício 3 - Média ponderada de notas"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : <Ana Paula>
// Descrição   : <Descripton>
// Autor(a)    : <JUNIOR, Wesley>
// Data atual  : <01/09/2022>
Var
media, nota_1, nota_2, nota_3: real

Inicio
escreva("Escreva sua nota 1: ")
leia(nota_1)
escreva("Escreva sua nota 2: ")
leia(nota_2)
escreva("Escreva sua nota 3: ")
leia(nota_3)

media <- ((nota_1 * 2) + (nota_2 * 3) + (nota_3 * 5)) / ( 2 * 3 * 5 )

escreval("") // Apenas para estilização
escreval("Sua média é de: ", media)
Fimalgoritmo