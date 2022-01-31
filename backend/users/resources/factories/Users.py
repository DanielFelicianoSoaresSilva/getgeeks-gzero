def factory_new_user():

    return {
        'name': 'Clint Barton',
        'email': 'barton@shield.com',
        'password': 'pwd123'
    }

def factory_get_user():

    return {
        'name': 'Gwen Stacy',
        'email': 'stacy@ozcorp.com',
        'password': 'pwd123'
    }

def factory_remove_user():

    return {
        'name': 'Thaddeus Ross',
        'email': 'ross@gmail.com',
        'password': 'pwd123'
    }

def factory_update_user():

    email = 'feliciano@gmail.com'

    return {
        'before': {
            'name': 'Feliciano Daniel',
            'email': email,
            'password': 'pwd123'
        },
        'after': {
            'name': 'Daniel Feliciano',
            'email': email,
            'whatsapp': '11999999999',
            'avatar': 'https://avatars.githubusercontent.com/u/88690749'
        }
    }

def factory_user_session(target):

    name = 'Kate Bishop',
    email = 'kate@hotmail.com',
    password = 'pwd123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]

