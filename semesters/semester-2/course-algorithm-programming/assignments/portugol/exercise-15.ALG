Algoritmo "Carrinho de compras "
// Disciplina   : [Algoritmo e Programa��o]
// Descri��o   : Fazer um carrinho de compras e mostrar o total
// Autor(a)   : L�via Faria
// Data  : 16/11/2022
tipo
pedido = registro
cod: inteiro
preU: real
quantC: real
fimregistro
Var
vet:vetor[0..9] de pedido
i: inteiro
tot: real
Inicio
para i de 0 ate 9 faca
escreval("Escreva o codigo do produto:")
         leia(vet[i].cod)
escreval("Escreva o pre�o unit�rio:")
         leia(vet[i].preU)
escreval("Escreva a quantidade comprada:")
         leia(vet[i].quantC)

fimpara
para i de 0 ate 9 faca
tot<- (vet[i].preU*vet[i].quantC) + tot

fimpara

escreval("O pre�o total do carinho ser�:",tot)

fimalgoritmo