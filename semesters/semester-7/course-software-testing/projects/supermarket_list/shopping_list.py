from database import load_data, save_data, get_user_id

class ShoppingList:
    def __init__(self, db_path=None, test_mode=False):
        self.user_id = get_user_id(test_mode)  # Usa um ID fixo se for teste
        self.db_path = db_path
        self.data = load_data(self.db_path)
        self.list = self.data.get(self.user_id, [])

    def _save(self):
        self.data[self.user_id] = self.list
        save_data(self.data, self.db_path)

    def add_item(self, item_name):
        if item_name in [item['name'] for item in self.list]:
            return f"O item '{item_name}' já está na lista."
        
        self.list.append({'name': item_name, 'bought': False})
        self._save()
        return f"Item '{item_name}' adicionado com sucesso."

    def mark_as_bought(self, item_name):
        for item in self.list:
            if item['name'] == item_name:
                item['bought'] = True
                self._save()
                return f"Item '{item_name}' marcado como comprado."

        return f"Item '{item_name}' não encontrado na lista."

    def remove_item(self, item_name):
        for item in self.list:
            if item['name'] == item_name:
                self.list.remove(item)
                self._save()
                return f"Item '{item_name}' removido da lista."

        return f"Item '{item_name}' não encontrado na lista."

    def clear_list(self):
        self.list = []
        self._save()
        return "Lista de compras esvaziada."

    def get_list(self):
        return self.list
