Algoritmo "H) Escreva um algoritmo que contenha um registro 'pedido' com o c�digo do produto, pre�o unit�rio e quantidade comprada e imprima o pre�o total a ser pago. Altere..."

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

     escreval("Escreva o pre�o unit�rio:")
     leia(matrizDezPosicoes[contador].preco)

     escreval("Escreva a quantidade comprada:")
     leia(matrizDezPosicoes[contador].quantidade)
fimpara

para contador de 1 ate 10 faca
     valorTotal <- (matrizDezPosicoes[contador].preco * matrizDezPosicoes[contador].quantidade) + valorTotal
fimpara

escreval("")
escreval("O pre�o total do carinho ser�:", valorTotal:8:2)

fimalgoritmo