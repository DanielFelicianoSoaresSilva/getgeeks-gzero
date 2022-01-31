*Settings*
Documentation       Helpers

*Keywords*
Get token
    [Arguments]     ${user}

    # obter o token
    # criando um usuario
    ${payload}      Create Dictionary
    ...             email=${user}[email]
    ...             password=${user}[password]

    ${response}     POST Session    ${payload}
    # armazena o token do IF
    ${result}       Set Variable    ${EMPTY}

    IF      "200" in "${response}"
        # criar a var token e pegar o resultado do response
        ${result}        Set Variable        Bearer ${response.json()}[token]
    END

    [return]    ${result}


Remove User
    [Arguments]     ${user}

    ${token}        Get token       ${user}

    IF      "${token}"
        # DELETE na rota /users
        DELETE User     ${token}
    END