# Atividade 02

## 1) Escreva um código que mostre os números ímpares entre 1 e 10.

```js
for (let counter = 0; counter <= 10; counter++) {
  if (counter % 2 !== 0) {
    console.log(counter);
  }
}
```

## 2) Escreva um código que calcule a soma de 1 até 100. (obs: a resposta é 5050)

```js
let total = 0;

for (let counter = 0; counter <= 100; counter++) {
  total += counter;
}

console.log(total);
```

## 3) Crie um Array igual ao abaixo e mostre apenas os nomes das pessoas que tenham 4 letras.

```js
const people = ["João", "José", "Maria", "Sebastião", "Antônio"];

people.filter(person => person.length === 4);
```

