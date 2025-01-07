Algoritmo "G) Leia um vetor de 5 posições e imprima o maior e o menor valor."

Var
vetorDeCincoPosicoes: vetor[1..5] de inteiro
menorValor, maiorValor, contador: inteiro

Inicio
escreval("Digite 5 valores: ")

para contador de 1 ate 5 faca
     leia(vetorDeCincoPosicoes[contador])
fimpara

para contador de 1 ate 5 faca
     se (vetorDeCincoPosicoes[contador] > maiorValor) entao
        maiorValor <- vetorDeCincoPosicoes[contador]
     fimse
fimpara

menorValor <- vetorDeCincoPosicoes[5]

para contador de 1 ate 5 faca
     se (vetorDeCincoPosicoes[contador] < menorValor) entao
        menorValor <- vetorDeCincoPosicoes[contador]
     fimse
fimpara

escreval("")
escreval("O maior valor do vetor é: ", maiorValor)
escreval("O menor valor do vetor é: ", menorValor)

Fimalgoritmo