*Settings*
Documentation       Sessions Route

*Keywords*
POST Session
    [Arguments]     ${payload}

    ${response}     POST        ${API_USERS}/sessions   # endereço com a rota
    ...                         json=${payload}         # massa de teste
    ...                         expected_status=any     # aceita outras validações além do 200
    
    [return]        ${response}                         # devolve para quem chamar



















