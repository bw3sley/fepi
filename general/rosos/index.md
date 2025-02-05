# RObot SOccer Simulator (ROSOS)

Neste projeto, desenvolvi um robô utilizando a biblioteca RObot SOccer Simulator (ROSOS). Este foi utilizado durante um torneio de robôs simulados sobre a plataforma Processing.

# Onde posso aprender mais sobre o ROSOS?

1. Na [Página do GitHub](https://github.com/ivanseidel/Robot-Soccer-Simulator/wiki) deste repositório;
2. No canal do [ROSOS no YouTube]((https://www.youtube.com/channel/UCZekRTPIwhe56lbicQpO-vg));
3. Se você tiver algum material que deseja compartilhar, abra uma issue na página de [issues](https://github.com/ivanseidel/Robot-Soccer-Simulator/issues);

# O que é o ROSOS?

![ROSOS](https://raw.githubusercontent.com/ivanseidel/Robot-Soccer-Simulator/master/images/window.png "ROSOS")

O simulador foi desenvolvido pensando na compatibilidade com os principais sistemas operacionais e na facilidade de desenvolvimento e testes, sem a necessidade de conhecimento profundo sobre comandos de terminal ou sobre compilação e construção de código do zero.

Por isso, a solução mais adequada foi utilizar o ambiente Processing. Sua estrutura é muito semelhante às placas Arduino que as equipes já utilizam, e é escrito em Java, que não é tão diferente do C++ também usado no Arduino.

O simulador possui dois objetivos principais, que também podemos chamar de "desafios" durante o desenvolvimento:

Ser realmente fácil de programar, ao mesmo tempo em que não pode ter mudanças enormes no código escrito para um robô real.

Não ser tão difícil de hackear e fazer alterações no jogo em si, permitindo que as equipes alterem a física e que a organização proponha desafios de Super Equipe durante a competição, que sejam desafiadores para as equipes.

Com esses objetivos em mente, o código foi escrito visando uma interface confiável e genérica, que pode ser usada para criar objetos "Simuláveis" e Sensores de maneira bastante direta.

O simulador também considera a possibilidade de diferentes tipos de "Juízes", diversos tipos de sensores e configurações de robôs. Uma ampla gama de controladores de motor é usada para controlar a velocidade do robô na simulação.