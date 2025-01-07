Algoritmo "E) Crie uma matriz de 2 dimensões com 5 linhas e 10 colunas e atribua à todas as posições o valor zero"

Var
matriz:vetor[1..5,1..10] de real
contadorUm, contadorDois: inteiro

Inicio

para contadorUm de 1 ate 5 faca
     para contadorDois de 1 ate 10 faca
          matriz[contadorUm, contadorDois] <- 0
     fimpara
fimpara

para contadorUm de 1 ate 5 faca
     para contadorDois de 1 ate 10 faca
         escreval("Matriz: i[", contadorUm," ] j[", contadorDois," ]= ", matriz[contadorUm, contadorDois])
fimpara
fimpara
fimalgoritmo