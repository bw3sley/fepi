Algoritmo "Exercicio maior menor - Vetor "
// Disciplina   : [Algoritmo e Programação]
// Descrição   : entrar com 5 valores e determinar o maior e o menor
// Autor(a)   : Guilherme Miguel Silveira Renó
// Data  : 03/11/2022
Var
vet:vetor[0..4] de real
i: inteiro
r,maior,menor: real

Inicio

escreval("Escreva 5 valores:")
para i de 0 ate 4 faca
         leia(vet[i])

         se vet[i]>maior entao
         maior<-vet[i]
         fimse
 fimpara
 menor<-vet[i]
para i de 0 ate 4 faca
         se vet[i]<menor entao
         menor<-vet[i]
         fimse
fimpara
escreval("menor",menor)
escreval("maior",maior)
fimalgoritmo