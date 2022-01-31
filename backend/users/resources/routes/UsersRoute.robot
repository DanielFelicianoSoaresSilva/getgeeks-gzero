*Settings*
Documentation       Users Route

*Keywords*
POST User
    [Arguments]     ${payload}

    ${response}     POST        ${API_USERS}/users      # endereço com a rota
    ...                         json=${payload}         # massa de teste
    ...                         expected_status=any     # aceita outras validações além do 200
    
    [return]        ${response}                         # devolve para quem chamar

DELETE User
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     DELETE          ${API_USERS}/users      # endereço com a rota
    ...                             headers=${headers}
    ...                             expected_status=any     # aceita outras validações além do 200
    
    [return]        ${response} 

GET User
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     GET             ${API_USERS}/users
    ...                             headers=${headers}
    ...                             expected_status=any

    [return]        ${response}
    
PUT User
    [Arguments]     ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     PUT        ${API_USERS}/users      # endereço com a rota
    ...                        json=${payload}         # massa de teste
    ...                        headers=${headers}
    ...                        expected_status=any     # aceita outras validações além do 200
    
    [return]        ${response}                         # devolve para quem chamar
