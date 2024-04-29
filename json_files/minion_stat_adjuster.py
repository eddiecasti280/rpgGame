import json
import sys

FILE_NAME = 'party_members.json'

def add_to_json(name, health, strength, agility):
    try:
        with open(FILE_NAME, 'r') as file:
            existing_data = json.load(file)
            existing_data[name] = {'Health': health, 'Strength': strength, 'Agility': agility}
            with open(FILE_NAME, 'w') as file:
                json.dump(existing_data, file, indent=4)
    except FileNotFoundError:
        with open(FILE_NAME, 'w') as file:
            json.dump({name: {'Health': health, 'Strength': strength, 'Agility': agility}}, file, indent=4)

def add_key_to_member(member_name, key_name, value_type):
    try:
        with open(FILE_NAME, 'r') as file:
            data = json.load(file)
            if member_name in data:
                if value_type == 'string':
                    data[member_name][key_name] = ''
                elif value_type == 'boolean':
                    data[member_name][key_name] = False
                elif value_type == 'integer':
                    data[member_name][key_name] = 0
                elif value_type == 'float':
                    data[member_name][key_name] = 0.0
                else:
                    print('Invalid value type')
                    return
                with open(FILE_NAME, 'w') as file:
                    json.dump(data, file, indent=4)
            else:
                print(f'Member {member_name} does not exist')
    except FileNotFoundError:
        print(f'File {FILE_NAME} does not exist')

def remove_key_from_member(member_name, key_name):
    try:
        with open(FILE_NAME, 'r') as file:
            data = json.load(file)
            if member_name in data:
                if key_name in data[member_name]:
                    del data[member_name][key_name]
                    with open(FILE_NAME, 'w') as file:
                        json.dump(data, file, indent=4)
                else:
                    print(f'Key {key_name} does not exist for member {member_name}')
            else:
                print(f'Member {member_name} does not exist')
    except FileNotFoundError:
        print(f'File {FILE_NAME} does not exist')

add_to_json('Duck', 32, 20, 20)