*Settings*
Documentation       Users route test suite

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Add new user

    ${user}      Factory New User

    # remover user via api
    Remove User  ${user}

    ${response}         POST User   ${user}
    Status Should Be    201         ${response}

    # validar id
    ${user_id}          Set Variable        ${response.json()}[id]
    Should Be True      ${user_id} > 0

Get user data

    # cadastra o usuário
    ${user}     Factory Get User
    POST User   ${user}

    ${token}            Get token   ${user}
    ${response}         GET User    ${token}
    Status Should Be    200         ${response}

    Should Be Equal As Strings      ${user}[name]       ${response.json()}[name]
    Should Be Equal As Strings      ${user}[email]      ${response.json()}[email]
    
    # comparar nulo no whatsapp
    Should Be Equal As Strings      None        ${response.json()}[whatsapp]
    Should Be Equal As Strings      None        ${response.json()}[avatar]
    
    Should Be Equal As Strings      False       ${response.json()}[is_geek]

Remove user

    # Dado que existe um usuário no sistema
    ${user}         Factory Remove User
    POST User       ${user}

    # E tenho um token desse usuário
    # obtem o token e chama o DELETE
    ${token}                Get token       ${user}

    # Quando faço uma solicitação de remoção na rota /users
    ${response}             DELETE User     ${token}

    # Então deve retornar o status code 204 (no content)
    Status Should Be        204             ${response} 

    # E ao fazer uma requisição GET, deve retornar o status code 404 (not found)
    ${response}             GET User        ${token}

    Status Should Be        404             ${response} 

Update a user

    ${user}         Factory Update User
    POST User       ${user}[before]

    ${token}        Get token       ${user}[before]

    ${response}     PUT User        ${token}        ${user}[after]

    Status Should Be        200             ${response}

    ${response}         GET User    ${token}

    Should Be Equal As Strings      ${user}[after][name]            ${response.json()}[name]
    Should Be Equal As Strings      ${user}[after][email]           ${response.json()}[email]
    Should Be Equal As Strings      ${user}[after][whatsapp]        ${response.json()}[whatsapp]
    Should Be Equal As Strings      ${user}[after][avatar]          ${response.json()}[avatar]
    Should Be Equal As Strings      False                           ${response.json()}[is_geek]
