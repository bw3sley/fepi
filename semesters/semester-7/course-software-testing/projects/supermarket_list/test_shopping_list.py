import pytest
import os
import json
import time

from database import save_data
from shopping_list import ShoppingList

from pathlib import Path

TEST_DB_FILE = Path(__file__).parent / "test.json"

def setup_function():
    save_data({}, TEST_DB_FILE)

def teardown_function():
    if os.path.exists(TEST_DB_FILE):
        os.remove(TEST_DB_FILE)

MAX_ITEMS = 10000

# Testes de Unidade
@pytest.mark.unit
def test_add_item():
    shopping_list = ShoppingList(TEST_DB_FILE)
    response = shopping_list.add_item("Maçã")
    assert response == "Item 'Maçã' adicionado com sucesso."
    assert any(item["name"] == "Maçã" for item in shopping_list.get_list())

@pytest.mark.unit
def test_add_duplicate_item():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Banana")
    response = shopping_list.add_item("Banana")
    assert response == "O item 'Banana' já está na lista."

@pytest.mark.unit
def test_mark_as_bought():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Leite")
    response = shopping_list.mark_as_bought("Leite")
    assert response == "Item 'Leite' marcado como comprado."
    assert any(item["name"] == "Leite" and item["bought"] for item in shopping_list.get_list())

@pytest.mark.unit
def test_remove_item():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Ovos")
    response = shopping_list.remove_item("Ovos")
    assert response == "Item 'Ovos' removido da lista."
    assert not any(item["name"] == "Ovos" for item in shopping_list.get_list())

@pytest.mark.unit
def test_clear_list():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Carne")
    shopping_list.add_item("Queijo")
    response = shopping_list.clear_list()
    assert response == "Lista de compras esvaziada."
    assert shopping_list.get_list() == []

# Testes de Integração
@pytest.mark.integration
def test_persistencia_dados():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Feijão")
    shopping_list.add_item("Arroz")

    new_session = ShoppingList(TEST_DB_FILE)
    assert len(new_session.get_list()) == 2

@pytest.mark.integration
def test_persistencia_remocao():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Peixe")
    shopping_list.remove_item("Peixe")
    new_session = ShoppingList(TEST_DB_FILE)
    assert not any(item["name"] == "Peixe" for item in new_session.get_list())

# Testes de Performance
@pytest.mark.performance
def test_tempo_de_resposta():
    shopping_list = ShoppingList(TEST_DB_FILE)
    start_time = time.time()
    for i in range(100):
        shopping_list.add_item(f"Produto {i}")
    end_time = time.time()
    assert (end_time - start_time) < 2  # Deve rodar em menos de 2 segundos

# Testes de Carga
@pytest.mark.load
def test_carga_lista_compras():
    shopping_list = ShoppingList(TEST_DB_FILE)
    for i in range(MAX_ITEMS): 
        shopping_list.add_item(f"Produto {i}")
    assert len(shopping_list.get_list()) == MAX_ITEMS

# Testes de Segurança
@pytest.mark.security
def test_arquivo_json_seguro():
    shopping_list = ShoppingList(TEST_DB_FILE)
    shopping_list.add_item("Teste")
    with open(TEST_DB_FILE, "r", encoding="utf-8") as file:
        data = json.load(file)
        assert isinstance(data, dict)  # Garante que não foi comprometido

@pytest.mark.security
def test_arquivo_json_integridade():
    with open(TEST_DB_FILE, "w", encoding="utf-8") as file:
        file.write("corrompido")
    
    shopping_list = ShoppingList(TEST_DB_FILE)
    assert shopping_list.get_list() == []  # Sistema deve resetar caso haja corrupção

# Testes de Usabilidade
@pytest.mark.usability
def test_interface_usuario():
    shopping_list = ShoppingList(TEST_DB_FILE)
    assert isinstance(shopping_list.get_list(), list)

# Testes de Aceitação
@pytest.mark.acceptance
def test_fluxo_completo():
    shopping_list = ShoppingList(TEST_DB_FILE)
    assert shopping_list.add_item("Pão") == "Item 'Pão' adicionado com sucesso."
    assert shopping_list.mark_as_bought("Pão") == "Item 'Pão' marcado como comprado."
    assert shopping_list.remove_item("Pão") == "Item 'Pão' removido da lista."
    assert shopping_list.get_list() == []