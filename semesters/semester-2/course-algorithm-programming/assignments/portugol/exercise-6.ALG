Algoritmo "Crie um algoritmo em que o usu�rio entre com 12 valores e mostre o seu somat�rio. "

Var
vetorDeDozePosicoes: vetor[1..12] de inteiro
contador, somatorio: inteiro

Inicio
escreval("Digite 12 valores: ")

para contador de 1 ate 12 faca
     leia(vetorDeDozePosicoes[contador])
fimpara

para contador de 1 ate 12 faca
     somatorio <- somatorio + vetorDeDozePosicoes[contador]
fimpara

escreval("") // Para identa��o
escreval("A soma dos valores digitados resultou em: ", somatorio)

Fimalgoritmo