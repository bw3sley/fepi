package br.fepi.produtos.produtos.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.fepi.produtos.produtos.model.Produtos;

public interface ProdutosRepository extends JpaRepository<Produtos, Long>{
    @Query(value = "SELECT nome FROM produtos WHERE nome = ?1")  
    public Produtos findProdutosByName(String nome);
} 
