Algoritmo "Matriz"
// Disciplina   : [Algoritmo e Programa��o]
// Descri��o   : Atribuir 0 a todos as posi��es da matriz 5x10
// Autor(a)   : L�via Faria
// Data  : 16/11/2022
Var
matriz:vetor[0..4,0..9] de real
i,j: inteiro
r: real

Inicio
para i de 0 ate 4 faca
     para j de 0 ate 9 faca
         matriz[i,j]<-0
fimpara
fimpara
para i de 0 ate 4 faca
     para j de 0 ate 9 faca
         escreval("matriz: i[",i," ] j[",j," ]= ",matriz[i,j])
fimpara
fimpara
fimalgoritmo