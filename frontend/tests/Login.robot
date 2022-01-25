*Settings*
Documentation       Login test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Session

*Test Cases*
User Login
    [Tags]      smoke

    ${user}                     Factory User    login
    #Add user from database      ${user} removido para o usu das sementes

    Go to login page
    Fill credencials            ${user}
    Submit credencials
    User should be logged in    ${user}
    
Incorrect Pass
    [Tags]      attempt_login       ipass

    ${user}     Create Dictionary       
    ...         email=daniel@hotmail.com
    ...         password=abc123

    Go to login page
    Fill credencials  ${user}
    Submit credencials
    Modal content should be     Usuário e/ou senha inválidos.

User not found
    [Tags]      attempt_login       user404

    ${user}     Create Dictionary       
    ...         email=daniel@404.com
    ...         password=abc123

    Go to login page
    Fill credencials  ${user}
    Submit credencials
    Modal content should be     Usuário e/ou senha inválidos.

Incorrect email
    [Tags]      attempt_login       i_email

    ${user}     Create Dictionary
    ...         email=daniel.com.br
    ...         password=pwd123

    Go to login page
    Fill credencials  ${user}
    Submit credencials
    Should be type email

# Desafio 1 do módulo PRO
# Automatizar 3 novos casos de testes: Email obrigatório, Senha obrigatória, Campos obrigatórios
# Entrega: no Github

Required email
    [Tags]      desafio1     desafio_email

    ${user}     Create Dictionary
    ...         email=${EMPTY}
    ...         password=pwd123

    Go to login page
    Fill credencials  ${user}
    Submit credencials
    Alert span should be    E-mail obrigatório

Required password
    [Tags]      desafio1     desafio_pass

    ${user}     Create Dictionary
    ...         email=daniel@gmail.com
    ...         password=${EMPTY}

    Go to login page
    Fill credencials  ${user}
    Submit credencials
    Alert span should be    Senha obrigatória

Required fields
    [Tags]      desafio1     desafio_campos

    # ${user}     Create Dictionary
    # ...         email=${EMPTY}
    # ...         password=${EMPTY}

    @{alerts}   Create List
    ...         E-mail obrigatório
    ...         Senha obrigatória

    Go to login page
    Submit credencials
    # Alert span should be    E-mail obrigatório
    # Alert span should be    Senha obrigatória
    Alerts spans should be  ${alerts}
