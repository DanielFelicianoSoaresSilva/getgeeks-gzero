*Settings*
Documentation       Sessions route test suite

Resource    ${EXECDIR}/resources/Base.robot

*Variables*
&{inv_pass}         email=kate@hotmail.com          password=abc123
&{inv_email}        email=kate.hotmail.com          password=pwd123
&{email_404}        email=kate@404.com              password=pwd123
&{empty_email}      email=${EMPTY}                  password=pwd123
&{without_email}    password=abc123
&{empty_pass}       email=kate@hotmail.com          password=${EMPTY}
&{without_pass}     email=kate@hotmail.com

*Test Cases*
User session
# A biblioteca requestsLibrary faz a conversão para JSON automáticamente, então, não precisa do headers

    # ${payload}      Create Dictionary       email=kate@hotmail.com        password=pwd123
    # ${headers}      Create Dictionary       Content-Type=application/json
    # ${response}     POST            ${API_USERS}/sessions   # endereço com a rota
    # ...                             data=${payload}         # massa de teste
    # ...                             ${headers}=${headers}   # cabeçalho
    # Status Should Be        200     ${response}
#   
    # criar usuário pela api
    ${payload}      Factory User Session    signup
    POST User       ${payload}

    # validar login
    ${payload}      Factory User Session   login
    
    ${response}     POST Session  ${payload}

    Status Should Be        200                     ${response}

    ${size}                 Get Length              ${response.json()}[token]  # devolve integer
#   Quando acusa diferença entre integer e String
    ${expected_size}        Convert To Integer      141

    Should Be Equal         ${expected_size}        ${size}  # devolver como string
    Should Be Equal         10d                     ${response.json()}[expires_in]

Should not get token
    [Template]      Attempt POST session

    ${inv_pass}         401     Unauthorized
    ${inv_email}        400     Incorrect email
    ${email_404}        401     Unauthorized
    ${empty_email}      400     Required email
    ${without_email}    400     Required email
    ${empty_pass}       400     Required pass
    ${without_pass}     400     Required pass

*Keywords*
Attempt POST session
    [Arguments]     ${payload}      ${status_code}      ${error_message}

    ${response}     POST Session    ${payload}

    Status Should Be        ${status_code}      ${response}
    Should Be Equal         ${error_message}    ${response.json()}[error]



# Incorrect pass

#     ${payload}      Create Dictionary       email=kate@hotmail.com        password=abc123
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        401                         ${response}
#     Should Be Equal         Unauthorized                ${response.json()}[error]

# User not found

#     ${payload}      Create Dictionary       email=kate@404.com        password=pwd123
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        401                         ${response}
#     Should Be Equal         Unauthorized                ${response.json()}[error]

# Incorrect email

#     ${payload}      Create Dictionary       email=kate.hotmail.com        password=pwd123
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        400                         ${response}
#     Should Be Equal         Incorrect email             ${response.json()}[error]

# Empty email

#     ${payload}      Create Dictionary       email=${EMPTY}        password=pwd123
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        400                         ${response}
#     Should Be Equal         Required email              ${response.json()}[error]

# Without email

#     ${payload}      Create Dictionary                   password=pwd123
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        400                         ${response}
#     Should Be Equal         Required email              ${response.json()}[error]

# Empty pass

#     ${payload}      Create Dictionary       email=kate@hotmail.com        password=${EMPTY}
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        400                         ${response}
#     Should Be Equal         Required pass               ${response.json()}[error]

# Without pass

#     ${payload}      Create Dictionary       email=kate@hotmail.com
    
#     ${response}     POST Session  ${payload}

#     Status Should Be        400                         ${response}
#     Should Be Equal         Required pass               ${response.json()}[error]
