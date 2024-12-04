package br.fepi.agenda.agenda.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.fepi.agenda.agenda.model.Livro;

@Repository
public interface LivroRepository extends JpaRepository<Livro, Long>{
    // @Query(value = "SELECT livro.title, livro.published_at, livro.author, livro.gender FROM livro WHERE title = ?1")
    // public Livro findByTitle(String title);
} 
