Algoritmo "H) Escreva um algoritmo que contenha um registro 'pedido' com o código do produto, preço unitário e quantidade comprada e imprima o preço total a ser pago. Altere..."

tipo
Pedido = registro
 codigo: inteiro
 preco: real
 quantidade: real
fimregistro

Var
matrizDezPosicoes:vetor[1..10] de Pedido
contador: inteiro
valorTotal: real

Inicio
para contador de 1 ate 10 faca
     escreval("Escreva o codigo do produto:")
     leia(matrizDezPosicoes[contador].codigo)

     escreval("Escreva o preço unitário:")
     leia(matrizDezPosicoes[contador].preco)

     escreval("Escreva a quantidade comprada:")
     leia(matrizDezPosicoes[contador].quantidade)
fimpara

para contador de 1 ate 10 faca
     valorTotal <- (matrizDezPosicoes[contador].preco * matrizDezPosicoes[contador].quantidade) + valorTotal
fimpara

escreval("")
escreval("O preço total do carinho será:", valorTotal:8:2)

fimalgoritmo