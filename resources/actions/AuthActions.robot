*Settings*
Documentation       Auth actions

*Variables*
${INPUT_EMAIL}      id=email
${INPUT_PASS}       id=password

*Keywords*
Go to login page

    Go to       ${BASE_URL}
    Wait For Elements State     css=.login-form     visible     5

Fill credencials
    [Arguments]         ${user}

    Fill Text           ${INPUT_EMAIL}      ${user}[email]
    Fill Text           ${INPUT_PASS}       ${user}[password]

Submit credencials
    Click       css=.submit-button >> text=Entrar

User should be logged in
    [Arguments]         ${user}

    ${element}                  Set Variable        css=a[href="/profile"]
    ${expected_fullname}        Set Variable        ${user}[name] ${user}[lastname]

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      equal       ${expected_fullname}

#validar mensagem do navegador, onde não é possivel validar o elemento
Should be type email
    #Pega a propriedade do elemento id=email, na qual a propriedade é type e o comparardor de igualdade equal email
    Get Property       ${INPUT_EMAIL}        type        equal       email