Algoritmo "E) Crie um algoritmo em que o usuário entre com 7 valores e calcule a multiplicação entre os valores."

Var
vetorComSetePosicoes: vetor[1..7] de inteiro
contador: inteiro
multiplicacao: real

Inicio
escreval("Digite 7 valores: ")

multiplicacao <- 1

para contador de 1 ate 7 faca
     leia(vetorComSetePosicoes[contador])
fimpara

para contador de 1 ate 7 faca
     multiplicacao <- multiplicacao * vetorComSetePosicoes[contador]
fimpara

escreval("") // Para identação
escreval("A multiplicação dos 7 valores deu: ", multiplicacao)

Fimalgoritmo