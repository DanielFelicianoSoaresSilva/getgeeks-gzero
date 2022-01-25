from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def factory_user(target):

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },
        'wrong_email': {
            'name': 'Pedro',
            'lastname': 'De Lara',
            'email': 'pedro_dl*hotmail.com',
            'password': 'pwd123' 
        },
        'login': {
            'name': 'Daniel',
            'lastname': 'Feliciano',
            'email': 'daniel@hotmail.com',
            'password': 'pwd123'
        },
        'be_geek': {
            'name': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        'short_desc': {
            'name': 'Peter',
            'lastname': 'Jordan',
            'email': 'peter@einerd.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Formato o seu PC.',
                'printer_repair': 'Não',
                'work': 'Ambos',
                'cost': '200'
            }
        }
    }

    return data[target]



# def factory_user():
#     user = {
#         'name': fake.first_name(),
#         'lastname': fake.last_name(),
#         'email': fake.free_email(),
#         'password': 'pwd123'
#     }

#     return user

# def factory_wrong_email():

#     first_name = fake.first_name()

#     return {
#         'name': first_name,
#         'lastname': fake.last_name(),
#         'email': first_name.lower() + '&gmail.com',
#         'password': 'pwd123' 
#     }

# def factory_user_login():
#     return{
#         'name': 'Daniel',
#         'lastname': 'Feliciano',
#         'email': 'daniel@hotmail.com',
#         'password': 'pwd123'
#     }

# def factory_user_be_geek():
#     return{
#         'name': 'Kim',
#         'lastname': 'Dotcom',
#         'email': 'kim@dot.com',
#         'password': 'pwd123',
#         'geek_profile': {
#             'whats': '11999999999',
#                 'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
#                 'printer_repair': 'Sim',
#                 'work': 'Remoto',
#                 'cost': '100'
#         }
#     }
