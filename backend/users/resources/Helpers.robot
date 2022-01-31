*Settings*
Documentation       Helpers

*Keywords*
Remove User
    [Arguments]     ${user}

    # obter o token
    # criando um usuario
    ${payload}      Create Dictionary       email=${user}[email]        password=${user}[password]
    ${response}     POST Session    ${payload}

    IF      "200" in "${response}"
        
        # criar a var token e pegar o resultado do response
        ${token}        Set Variable        Bearer ${response.json()}[token]

        # DELETE na rota /users
        DELETE User     ${token}

    END