Algoritmo "Crie um algoritmo em que o usuário entre com 10 valores e mostre a média."

Var
vetorDeDezPosicoes: vetor[1..10] de inteiro
contador, somatorio: inteiro
media: real

Inicio
escreval("Digite 10 valores: ")

para contador de 1 ate 10 faca
     leia(vetorDeDezPosicoes[contador])
fimpara

para contador de 1 ate 10 faca
     somatorio <- somatorio + vetorDeDezPosicoes[contador]
fimpara

media <- somatorio / 10

escreval("") // Para identação
escreval("A média dos valores digitados resultou em: ", media)

Fimalgoritmo