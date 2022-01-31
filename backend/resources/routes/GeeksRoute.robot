*Settings*
Documentation       Geeks Route

*Keywords*
POST Geek
    [Arguments]     ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     POST        ${API_GEEKS}/geeks      # endereço com a rota
    ...                         json=${payload}         # massa de teste
    ...                         headers=${headers}
    ...                         expected_status=any     # aceita outras validações além do 200
    
    [return]        ${response}

GET Geeks
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     GET         ${API_GEEKS}/geeks      # endereço com a rota
    ...                         headers=${headers}
    ...                         expected_status=any     # aceita outras validações além do 200
    
    [return]        ${response}

    