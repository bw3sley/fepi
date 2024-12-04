package br.fepi.agenda.agenda.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.fepi.agenda.agenda.model.Livro;
import br.fepi.agenda.agenda.repository.LivroRepository;

@RestController
@RequestMapping("/api/livros")
public class LivrosController {
    
    @Autowired
    private LivroRepository repository;

    @GetMapping
    public List<Livro> getAllBooks() {
        return repository.findAll();
    }

    @GetMapping(value = "/{id}")
    public Optional<Livro> getOneBookById(@PathVariable Long id) {
        return repository.findById(id);
    }

    /*
        Tá com o mesmo erro da aula, tentei fazer igual a gente tinha feito utilizando a @Query 
    */

    // @GetMapping(value = "/{title}")
    // public Livro getOneBookByTitle(@PathVariable String title) {
    //     Livro book = repository.findByTitle(title);

    //     return book;
    // }

    @PostMapping
    public String addNewBook(@RequestBody Livro book) {
        repository.save(book);

        return "201";
    }

    @PutMapping
    public String updateBook(@RequestBody Livro book) {
        if (book.getId() == 0) {
            return "400";
        }

        Livro newBook = repository.findById(book.getId()).get();

        if (newBook == null) {
            return "404";
        }

        repository.saveAndFlush(book);

        return "204";
    }

    @DeleteMapping(value = "/{id}")
    public String deleteBook(@PathVariable Long id) {
        repository.deleteById(id);
        
        return "204";
    }

}
