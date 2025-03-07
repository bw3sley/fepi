# python main.py

from shopping_list import ShoppingList

def main():
    shopping_list = ShoppingList()

    while True:
        print("\n📋 Lista de Compras\n")

        print("---------------------------------\n")

        item_list = shopping_list.get_list()

        if not item_list:
            print("Lista vazia.\n")

        else:
            for item in item_list:
                status = "✅" if item["bought"] else "❌"

                print(f"{status} {item['name']}")

        print("\nOpções:\n")

        print("---------------------------------\n")

        print("1 - Adicionar Item")
        print("2 - Marcar Item como Comprado")
        print("3 - Remover Item")
        print("4 - Limpar Lista")
        print("5 - Sair\n")

        print("---------------------------------\n")

        escolha = input("Escolha uma opção: ").strip()

        if escolha == "1":
            item = input("Digite o nome do item: ").strip()

            print(shopping_list.add_item(item))

        elif escolha == "2":
            item = input("Digite o nome do item: ").strip()

            print(shopping_list.mark_as_bought(item))

        elif escolha == "3":
            item = input("Digite o nome do item: ").strip()

            print(shopping_list.remove_item(item))

        elif escolha == "4":
            confirm = input("Tem certeza que deseja limpar a lista? (s/n): ").strip().lower()
            
            if confirm == "s" or confirm == "sim":
                print(shopping_list.clear_list())

        elif escolha == "5":
            print("🛒 Boas compras... ")
            break

        else:
            print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    main()