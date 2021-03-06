from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db(): # nova forma dre utilizar o user seed
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]

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
        'attempt_be_geek': {
            'name': 'Dio',
            'lastname': 'Linux',
            'email': 'dio@linux.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }
        },
        'searcher': {
            'name': 'Johnny',
            'lastname': 'Lawrence',
            'email': 'johnny@cobrakai.com',
            'password': 'pwd123'
        },
        'search_alien': {
            'name': 'Dock',
            'lastname': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': 'Faço conserto de qulquer impressora. Matricial a fita, Matricial a fita colorida, a lazer, a jato de tinta e tambem impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_common': {
            'name': 'Peter',
            'lastname': 'Parker',
            'email': 'parker@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '11999991002',
                'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '200'
            }
        }
    }

    return data[target]



    #     'short_desc': {
    #         'name': 'Peter',
    #         'lastname': 'Jordan',
    #         'email': 'peter@einerd.com',
    #         'password': 'pwd123',
    #         'geek_profile': {
    #             'whats': '21999999999',
    #             'desc': 'Formato o seu PC.',
    #             'printer_repair': 'Não',
    #             'work': 'Ambos',
    #             'cost': '200'
    #         }
    #     },
    #     'long_desc': {
    #         'name': 'Dio',
    #         'lastname': 'Linux',
    #         'email': 'dio@linux.com',
    #         'password': 'pwd123',
    #         'geek_profile': {
    #             'whats': '11999999999',
    #             'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unity.',
    #             'printer_repair': 'Não',
    #             'work': 'Remoto',
    #             'cost': '150'
    #         }
    #     },
    #     'empty_desc': {
    #         'name': 'Dio',
    #         'lastname': 'Linux',
    #         'email': 'dio@linux.com',
    #         'password': 'pwd123',
    #         'geek_profile': {
    #             'whats': '11999999999',
    #             'desc': '',
    #             'printer_repair': 'Não',
    #             'work': 'Remoto',
    #             'cost': '150'
    #         }
    #     },
    #     'empty_whats': {
    #         'name': 'Dio',
    #         'lastname': 'Linux',
    #         'email': 'dio@linux.com',
    #         'password': 'pwd123',
    #         'geek_profile': {
    #             'whats': '',
    #             'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
    #             'printer_repair': 'Não',
    #             'work': 'Remoto',
    #             'cost': '150'
    #         }
    #     }
    # }

    # return data[target]



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
