*Settings*
Documentation       Database helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect to postgress

    Connect To Database     psycopg2                                #driver
    ...                     dssnrkei                                #nome do banco
    ...                     dssnrkei                                #nome do usuário
    ...                     sT0_2TCeypUHP03zFZST5cZCHLzCywpY        #senha
    ...                     fanny.db.elephantsql.com                #endereço do servidos
    ...                     5432                                    #porta do BD (por padrão 5432 do postgress)

Reset env

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Insert user
    [Arguments]     ${user}

    ${hashed_pass}      Get Hashed pass     ${user}[password]

    ${query}        Set Variable        INSERT into public.users(name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_pass}', false)

    Execute SQL String      ${query}

Users seed

    ${user}     Factory User    login
    Insert user  ${user}
    
    ${user2}     Factory User   be_geek
    Insert user  ${user2}

    ${user3}     Factory User   attempt_be_geek
    Insert user  ${user3}
    
