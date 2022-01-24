*Settings*
Documentation       Login test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User Login

    ${user}                     Factory User Login
    #Add user from database      ${user} removido para o usu das sementes

    Go to login page
    Fill credencials            ${user}
    Submit credencials
    User should be logged in    ${user}
    sleep   1
    
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
