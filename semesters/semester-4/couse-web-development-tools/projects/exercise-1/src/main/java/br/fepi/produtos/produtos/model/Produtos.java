package br.fepi.produtos.produtos.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "cont_seq", sequenceName = "contato_seq", initialValue = 1, allocationSize = 1)
public class Produtos {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cont_seq")
    private long id;
    
    private String nome;
    
    private String descricao;
    
    private double preco;

    public Produtos () {}

    public Produtos(long id, String nome, String descricao, double preco) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
    }

    /**
     * @return long return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return String return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return String return the descricao
     */
    public String getdescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setdescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return String return the preco
     */
    public double getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(double preco) {
        this.preco = preco;
    }

}
