*Settings*
Documentation       Signup actions

*Keywords*
Go to signup form

    Go To       ${BASE_URL}/signup

    Wait For Elements State     css=.signup-form        visible     5

Fill signup form
    [Arguments]         ${user}

    Fill Text       id=name         ${user}[name]
    Fill Text       id=lastname     ${user}[lastname]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submit signup form

    Click       css=.submit-button >> text=Cadastrar

User should be registered

    ${expected_message}     Set Variable        css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State         ${expected_message}         visible     5
    sleep   1   #apenas para carregar a imagem da tela de cadastro feito

Alert span should be
    [Arguments]     ${expected_alert}

    Wait For Elements State     css=span[class=error] >> text=${expected_alert}        visible     5
