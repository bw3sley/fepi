# Naruto

<img src="https://files.catbox.moe/up3kal.jpg" />

</br>

Considere que você é um programador e deseja criar um sistema de modelagem orientada a objetos em Java para representar personagens do universo Naruto. O objetivo é criar classes que capturem as características essenciais dos ninjas, clãs, vilas, bijus, jutsus e senseis presentes na história. Abaixo, descreva a estrutura das principais classes e suas relações:

No núcleo do sistema, a classe `Ninja` é implementada para representar um ninja, contendo atributos como nome, idade, clã, vila e uma lista dinâmica de jutsus aprendidos. Esta classe é a base para personagens específicos, como **Naruto, Sasuke e Gaara**.

Os clãs são modelados pela classe `Clan`, que possui atributos como nome e símbolo. Para representar a diversidade dos clãs no universo Naruto, foram criadas subclasses como UzumakiClan, UchihaClan e SandClan, herdando de Clan e adicionando características específicas, como membros do clã.

A classe `Village` representa uma vila, com um atributo para o nome. No contexto do sistema, vilas como **Hidden Leaf** e **Hidden Sand** são instâncias dessa classe.

Para as poderosas bijus, a classe `Biju` foi implementada com atributos como nome e número de caudas. Esta classe captura a singularidade das bestas com caudas no universo Naruto.

A classe `Jutsu` modela técnicas especiais, com atributos como nome e descrição. Essa classe é essencial para representar os poderosos ataques que os ninjas podem realizar.

A figura do sensei é representada pela classe `Sensei`, que possui atributos gerais como nome, idade, clã, vila e uma lista de estudantes (ninjas). O conceito de herança é explorado com a classe Kakashi, que herda de **Sensei** e adiciona um atributo adicional representando uma técnica especial única.

Para testar e demonstrar o sistema, são criadas instâncias dessas classes, atribuindo valores aos seus atributos. Exemplos de métodos específicos são utilizados para ilustrar a funcionalidade das classes. Ao desenvolver essa aplicação, a herança é cuidadosamente aplicada para representar de maneira eficaz as relações hierárquicas entre as entidades do universo Naruto.