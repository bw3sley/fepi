import json
import os
import uuid

from pathlib import Path

DB_FILE = Path(__file__).parent / 'db.json'

def load_data(file_path=DB_FILE):
    if not file_path:
        file_path = DB_FILE

    if not os.path.exists(file_path):
        save_data({}, file_path)

    try:
        with open(file_path, "r", encoding="utf-8") as file:
            data = json.load(file)
            return data
    except (json.JSONDecodeError, ValueError):
        save_data({}, file_path)
        return {}

def save_data(data, file_path=DB_FILE):
    if not file_path:
        file_path = DB_FILE

    with open(file_path, 'w', encoding="utf-8") as file:
        json.dump(data, file, indent=4)

def get_user_id(test_mode=False):
    if test_mode:
        return "test_user"

    return str(uuid.uuid4())