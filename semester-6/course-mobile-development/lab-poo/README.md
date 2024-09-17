# Lab - Herança, Polimorfismo, Interface e Composição

Este laboratório visa consolidar os conceitos de POO em Java, focando na criação de classes, uso de construtores, encapsulamento, herança, polimorfismo, interfaces, e composição. Os conceitos aplicados aqui poderão ser reutilizados em futuros projetos de desenvolvimento de aplicativos Android.

## Passo 1: Criação de Classes e Objetos

**1. Crie uma Classe** `Livro`:

- Atributos: `String titulo`, `String isbn`, `Autor autor`.
- Construtor: Recebe `titulo`, `isbn` e `autor` como parâmetros.
- Métodos: `getTitulo()`, `getIsbn()`, `getAutor()`, `exibirInformacoes()`.

```java
public class Livro {
    private String titulo;
    private String isbn;
    private Autor autor;

    public Livro(String titulo, String isbn, Autor autor) {
        this.titulo = titulo;
        this.isbn = isbn;
        this.autor = autor;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getIsbn() {
        return isbn;
    }

    public Autor getAutor() {
        return autor;
    }

    public void exibirInformacoes() {
        System.out.println("Título: " + titulo);
        System.out.println("ISBN: " + isbn);
        System.out.println("Autor: " + autor.getNome());
    }

    public void exibirInformacoes(boolean exibirAutor) {
        exibirInformacoes();
        if (exibirAutor) {
            autor.exibirInformacoes();
        }
    }
}
```

**2. Crie uma Classe** `Autor`:

- Atributos: `String nome`, `String biografia`.
- Construtor: Recebe `nome` e `biografia` como parâmetros.
- Métodos: `getNome()`, `getBiografia()`, `exibirInformacoes()`.

```java
public class Autor {
    private String nome;
    private String biografia;

    public Autor(String nome, String biografia) {
        this.nome = nome;
        this.biografia = biografia;
    }

    public String getNome() {
        return nome;
    }

    public String getBiografia() {
        return biografia;
    }

    public void exibirInformacoes() {
        System.out.println("Nome do Autor: " + nome);
        System.out.println("Biografia: " + biografia);
    }
}
```

**3. Crie uma Classe** `Membro`:

- Atributos: `String nome`, `String matricula`.
- Construtor: Recebe `nome` e `matricula` como parâmetros.
- Métodos: `getNome()`, `getMatricula()`, `exibirInformacoes()`.

```java
public class Membro {
    private String nome;
    private String matricula;

    public Membro(String nome, String matricula) {
        this.nome = nome;
        this.matricula = matricula;
    }

    public String getNome() {
        return nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void exibirInformacoes() {
        System.out.println("Nome: " + nome);
        System.out.println("Matrícula: " + matricula);
    }
}
```

## Passo 2: Encapsulamento e Modificadores de Acesso

**1. Modifique as Classes `Livro`, `Autor` e `Membro`:**

- Defina os atributos como `private`.
- Crie métodos `getters` e `setters` para cada atributo, respeitando os conceitos de encapsulamento.

## Passo 3: Herança

**1. Crie uma Subclasse `MembroProfessor` que Herda de `Membro`:**

- Atributos adicionais: `String departamento`.
- Construtor: Recebe `nome`, `matricula` e `departamento`.
- Métodos: `getDepartamento()`, `exibirInformacoes()` (sobrescrito para incluir o departamento).

```java
public class MembroProfessor extends Membro {
    private String departamento;

    public MembroProfessor(String nome, String matricula, String departamento) {
        super(nome, matricula);
        this.departamento = departamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    @Override
    public void exibirInformacoes() {
        super.exibirInformacoes();
        System.out.println("Departamento: " + departamento);
    }
}
```

**2. Crie uma Subclasse `MembroEstudante` que Herda de `Membro`:**

- Atributos adicionais: `int anoDeIngresso`.
- Construtor: Recebe `nome`, `matricula` e `anoDeIngresso`.
- Métodos: getAnoDeIngresso(), exibirInformacoes() (sobrescrito para incluir o ano de ingresso).

```java
public class MembroEstudante extends Membro {
    private int anoDeIngresso;

    public MembroEstudante(String nome, String matricula, int anoDeIngresso) {
        super(nome, matricula);
        this.anoDeIngresso = anoDeIngresso;
    }

    public int getAnoDeIngresso() {
        return anoDeIngresso;
    }

    @Override
    public void exibirInformacoes() {
        super.exibirInformacoes();
        System.out.println("Ano de Ingresso: " + anoDeIngresso);
    }
}
```

## Passo 4: Polimorfismo

**1. Sobrescreva os Métodos `exibirInformacoes()` nas Classes `Livro`, `Autor`, `MembroProfessor` e `MembroEstudante`:**

- O método deve exibir as informações específicas de cada classe.

**2. Sobrecarga de Métodos:**

- Na classe `Livro`, crie dois métodos `exibirInformacoes()`. Um sem parâmetros, que exibe as informações do livro, e outro que recebe um parâmetro booleano `exibirAutor`. Se `exibirAutor` for verdadeiro, também exiba as informações do autor.

## Passo 5: Interfaces e Classes Abstratas

**1. Crie uma Interface `Publicacao`:**

- Métodos abstratos: `void emprestar()`, `void devolver()`.

```java
public interface Publicacao {
    void emprestar();
    void devolver();
}
```

**2. Modifique a Classe `Livro` para implementar a interface `Publicacao`:**

- Implemente os métodos `emprestar()` e `devolver()`, mostrando mensagens no console indicando se o livro foi emprestado ou devolvido.

**3. Crie uma Classe Abstrata `MaterialBiblioteca`:**

- Atributos: `String codigo`, `String titulo`.
- Construtor: Recebe `codigo` e `titulo`.
- Métodos abstratos: `exibirDetalhes()`.
- Métodos concretos: `getCodigo()`, `getTitulo()`.

```java
public abstract class MaterialBiblioteca {
    private String codigo;
    private String titulo;

    public MaterialBiblioteca(String codigo, String titulo) {
        this.codigo = codigo;
        this.titulo = titulo;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getTitulo() {
        return titulo;
    }

    public abstract void exibirDetalhes();
}
```

**4. Faça a Classe `Livro` Herdar de `MaterialBiblioteca` e implementar o método `exibirDetalhes()`:**

- Exiba o código e o título do livro.

```java
public class Livro extends MaterialBiblioteca implements Publicacao {
    private Autor autor;

    public Livro(String titulo, String isbn, Autor autor) {
        super(isbn, titulo); // isbn como código
        this.autor = autor;
    }

    public Autor getAutor() {
        return autor;
    }

    @Override
    public void exibirDetalhes() {
        System.out.println("Código: " + getCodigo());
        System.out.println("Título: " + getTitulo());
    }

    @Override
    public void emprestar() {
        System.out.println("O livro '" + getTitulo() + "' foi emprestado.");
    }

    @Override
    public void devolver() {
        System.out.println("O livro '" + getTitulo() + "' foi devolvido.");
    }

    public void exibirInformacoes(boolean exibirAutor) {
        exibirDetalhes();
        if (exibirAutor) {
            autor.exibirInformacoes();
        }
    }
}
```

## Passo 6: Composição

**1. Modifique a Classe `Livro`:**

Utilize um atributo Autor autor, que será uma instância da classe Autor, para representar o autor do livro.
No construtor de Livro, receba um objeto Autor como parâmetro e atribua ao atributo autor.

**2. Modifique a Classe `Membro`:**

- Crie um atributo `List<Livro> livrosEmprestados` para armazenar os livros emprestados pelo membro.
- Adicione métodos para `emprestarLivro(Livro livro)` e `devolverLivro(Livro livro)`.

```java
import java.util.ArrayList;
import java.util.List;

public class Membro {
    private String nome;
    private String matricula;
    private List<Livro> livrosEmprestados;

    public Membro(String nome, String matricula) {
        this.nome = nome;
        this.matricula = matricula;
        this.livrosEmprestados = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void exibirInformacoes() {
        System.out.println("Nome: " + nome);
        System.out.println("Matrícula: " + matricula);
    }

    public void emprestarLivro(Livro livro) {
        livrosEmprestados.add(livro);
        livro.emprestar();
    }

    public void devolverLivro(Livro livro) {
        livrosEmprestados.remove(livro);
        livro.devolver();
    }
}
```

## Passo 7: Testando o Sistema

**1. Na Classe Principal (`Main`)**:

- Crie alguns objetos `Autor`, `Livro`, `MembroProfessor` e `MembroEstudante`.
- Teste a criação de objetos, utilização de métodos sobrescritos, sobrecarga de métodos e composição.
- Empreste e devolva livros utilizando os métodos implementados.

### Exemplo de Código de Teste (Main):

```java
public class Main {
    public static void main(String[] args) {
        Autor autor1 = new Autor("J.K. Rowling", "Autora da série Harry Potter");
        Livro livro1 = new Livro("Harry Potter e a Pedra Filosofal", "978-3-16-148410-0", autor1);

        MembroProfessor professor = new MembroProfessor("Dr. John Doe", "PROF123", "Departamento de Literatura");
        MembroEstudante estudante = new MembroEstudante("Jane Doe", "STU456", 2023);

        livro1.exibirInformacoes(true);
        professor.exibirInformacoes();
        estudante.exibirInformacoes();

        professor.emprestarLivro(livro1);
        professor.devolverLivro(livro1);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        Autor autor1 = new Autor("J.K. Rowling", "Autora da série Harry Potter");
        Livro livro1 = new Livro("Harry Potter e a Pedra Filosofal", "978-3-16-148410-0", autor1);

        Membro membro = new Membro("John Doe", "MEM123");
        MembroProfessor professor = new MembroProfessor("Dr. John Doe", "PROF123", "Departamento de Literatura");
        MembroEstudante estudante = new MembroEstudante("Jane Doe", "STU456", 2023);

        // Demonstrando Polimorfismo
        Membro[] membros = {membro, professor, estudante};

        for (Membro m : membros) {
            m.exibirInformacoes();
            System.out.println();
        }

        // Demonstrando Polimorfismo com a sobrecarga de métodos
        livro1.exibirInformacoes();
        livro1.exibirInformacoes(false);

        // Emprestando e devolvendo livros
        professor.emprestarLivro(livro1);
        professor.devolverLivro(livro1);
    }
}
```