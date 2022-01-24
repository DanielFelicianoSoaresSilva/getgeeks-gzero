*Settings*
Documentation       Signup test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user

    ${user}     Factory User

    #Set Suite Variable      ${user}     #compartilha a mesma massa de teste com os demais cenários (cria dependencia)

    Go to signup form
    Fill signup form    ${user}
    Submit signup form
    User should be registered

Duplicate user
    [Tags]      attempt_signup      dup_email

    ${user}                     Factory User
    Add user from database      ${user}

    Go to signup form
    Fill signup form    ${user}
    Submit signup form
    Modal content should be     Já temos um usuário com o e-mail informado.

Wrong email
    [Tags]      attempt_signup      wrong_email

    ${user}     Factory Wrong Email

    Go to signup form
    Fill signup form    ${user}
    Submit signup form
    Alert span should be    O email está estranho

Required fields
    [Tags]          attempt_signup      reqf

    @{expected_alerts}      Create List
    ...                     Cadê o seu nome?
    ...                     E o sobrenome?
    ...                     O email é importante também!
    ...                     Agora só falta a senha!

    Go to signup form
    Submit signup form
    Alerts spans should be      ${expected_alerts}

    #executa 4 vezes os cenários do Signup submit without form
    # Cadê o seu nome?
    # E o sobrenome?
    # O email é importante também!
    # Agora só falta a senha!

    # Alert span should be    Cadê o seu nome?
    # Alert span should be    E o sobrenome?
    # Alert span should be    O email é importante também!
    # Alert span should be    Agora só falta a senha!

Short password
    [Tags]          attempt_signup      Shortp
    [Template]      Signup with short pass

    1
    12
    123
    1234
    12345
    a 
    a2
    ab3
    ab3c
    a23bc
    -1
    abc#1

# Short password
#     [Tags]      attempt_signup      Shortp

#     ${user}     Create Dictionary
#     ...         name=Daniel                     lastname=Feliciano
#     ...         email=daniel@hotmail.com        password=12345

#     Go to signup form
#     Fill signup form    ${user}
#     Submit signup form
#     Alert span should be    Informe uma senha com pelo menos 6 caracteres

*Keywords*
Signup with short pass
    [Arguments]     ${short_pass}

    ${user}     Create Dictionary
    ...         name=Daniel                     lastname=Feliciano
    ...         email=daniel@hotmail.com        password=${short_pass}

    Go to signup form
    Fill signup form    ${user}
    Submit signup form
    Alert span should be    Informe uma senha com pelo menos 6 caracteres
