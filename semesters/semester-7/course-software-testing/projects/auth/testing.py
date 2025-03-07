import pytest
import json
import os

from index import cadastrar_usuario, autenticar_usuario, USUARIOS_ARQUIVO

@pytest.fixture
def setup_arquivo():
    if os.path.exists(USUARIOS_ARQUIVO):
        os.remove(USUARIOS_ARQUIVO)
    yield
    if os.path.exists(USUARIOS_ARQUIVO):
        os.remove(USUARIOS_ARQUIVO)

@pytest.fixture
def make_usuario(): 
    def criar_usuario(username="user", senha="p@ssw0rd"):
        cadastrar_usuario(username, senha)

        return username, senha
    
    return criar_usuario

class TestCadastroUsuario:
    def test_cadastrar_usuario_novo(self, setup_arquivo, make_usuario):
        username, senha = make_usuario("usuario1", "senha123")
        
        with open(USUARIOS_ARQUIVO, "r") as file:
            data = json.load(file)
            
            assert username in data
            
            assert data[username] == senha

    def test_cadastrar_usuario_duplicado(self, setup_arquivo, make_usuario):
        make_usuario("usuario1", "senha123")
        
        assert cadastrar_usuario("usuario1", "senha123") == False

class TestAutenticacaoUsuario:
    def test_autenticar_usuario_valido(self, setup_arquivo, make_usuario):
        username, senha = make_usuario("usuario2", "senha123")
        
        assert autenticar_usuario(username, senha) == True

    def test_autenticar_usuario_invalido(self, setup_arquivo):
        
        assert autenticar_usuario("usuario3", "senha123") == False

class TestIntegracaoCadastroAutenticacao:
    def test_cadastrar_e_autenticar_usuario(self, setup_arquivo, make_usuario):
        username, senha = make_usuario("usuario4", "senha123")
        
        assert autenticar_usuario(username, senha) == True