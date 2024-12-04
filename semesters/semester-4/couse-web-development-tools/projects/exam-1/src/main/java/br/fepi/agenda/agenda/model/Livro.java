package br.fepi.agenda.agenda.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "cont_seq", sequenceName = "livro_seq", initialValue = 1, allocationSize = 1)
public class Livro {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cont_seq")
    private long id;
    
    private String title;

    private String author;

    private String gender;
    
    private String published_at;

    public Livro() {}

    public Livro(long id, String title, String author, String gender, String published_at) {
        this.id = id;
        this.title = title;
        this.gender = gender;
        this.published_at = published_at;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getpublished_at() {
        return published_at;
    }

    public void setpublished_at(String published_at) {
        this.published_at = published_at;
    }
}
