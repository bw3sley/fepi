Algoritmo "Exercicio registro - Carrinho de compras "
// Disciplina   : [Algoritmo e Programação]
// Descrição   : Fazer um carrinho de compras e mostrar o total
// Autor(a)   : Guilherme Miguel Silveira Renó
// Data  : 10/11/2022
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
escreval("Escreva o preço unitário:")
         leia(vet[i].preU)
escreval("Escreva a quantidade comprada:")
         leia(vet[i].quantC)

fimpara
para i de 0 ate 9 faca
tot<- (vet[i].preU*vet[i].quantC) + tot

fimpara

escreval("O preço total do carinho será:",tot)

fimalgoritmo