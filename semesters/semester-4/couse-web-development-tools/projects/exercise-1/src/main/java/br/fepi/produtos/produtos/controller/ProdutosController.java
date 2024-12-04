package br.fepi.produtos.produtos.controller;

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

import br.fepi.produtos.produtos.model.Produtos;
import br.fepi.produtos.produtos.repository.ProdutosRepository;

@RestController
@RequestMapping("/produtos")
public class ProdutosController {
    
    @Autowired
    private ProdutosRepository repositorio;

    @PostMapping
    public String cadastrar(@RequestBody Produtos produto){
        repositorio.save(produto);
        return "201 - Cadastrado com sucesso";
    }

    @GetMapping
    public List<Produtos> listar(){
        return repositorio.findAll();
    }

    @GetMapping(value = "/{id}")
    public Optional<Produtos> listarUmPorId(@PathVariable Long id) {
        Optional<Produtos> item = repositorio.findById((id));
        
        return item;
    }


    // Could not resolve root entity 'produtos'
    @GetMapping(value = "/{nome}")
    public Produtos listarUmPorNome(@PathVariable String name) {
        Produtos item = repositorio.findProdutosByName(name);
        
        return item;
    }

    @DeleteMapping(value = "/{id}")
    public String delete(@PathVariable Long id){
        repositorio.deleteById(id);
        return "204 - Removido com sucesso";
    }

    @PutMapping
    public String update(@RequestBody Produtos produto) {
        if (produto.getId() > 0) {
            repositorio.save(produto);
           
            return "204 - Atualizado com sucesso";
        }
 
        return "404";
    }
}
