Algoritmo "D) Crie um algoritmo que leia uma vetor com 4 notas e calcule a m�dia, se a media for maior ou igual a 70 o aluno est� aprovado, sen�o o aluno estar� reprovado."

Var
vetorComAsQuatroNotas: vetor[1..4] de inteiro
contador, somatorio: inteiro
notaFinal: real

Inicio
escreval("Digite suas 4 notas: ")

para contador de 1 ate 4 faca
     leia(vetorComAsQuatroNotas[contador])
fimpara

para contador de 1 ate 4 faca
     somatorio <- somatorio + vetorComAsQuatroNotas[contador]
fimpara

notaFinal <- somatorio / 4

se (notaFinal >= 70) entao
   escreval("") // Para identa��o
   escreval("Voc� foi aprovado! Sua nota foi de: ", notaFinal)
senao
   escreval("") // Para identa��o
   escreval("Voc� foi reprovado! Sua nota foi de: ", notaFinal)
fimse

Fimalgoritmo