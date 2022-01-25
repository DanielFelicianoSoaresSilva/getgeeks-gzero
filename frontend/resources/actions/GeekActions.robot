*Settings*
Documentation       Geek Actions

*Keywords*
Go to geek form
    Click       css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State     css=.be-geek-form       visible     5

Fill geek form
    [Arguments]     ${geek_profile}

    Fill Text       id=whatsapp             ${geek_profile}[whats]
    Fill Text       id=desc                 ${geek_profile}[desc]

    Select Options By       id=printer_repair       text       ${geek_profile}[printer_repair]
    Select Options By       id=work                 text       ${geek_profile}[work]
    
    Fill Text       id=cost                 ${geek_profile}[cost]

Submit geek form
    Click       css=button >> text=Quero ser um Geek

Geek form should be success
    ${expected_message}     Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${expected_message}       visible     5
    Sleep   1