*Settings*
Documentation       Geek Actions

*Keywords*
Go to geek form
    Click       css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State     css=.be-geek-form       visible     5

Go to geeks
    Click       css=a[href="/geeks"] >> text=Geeks

    Wait For Elements State         css=.title strong >> text=Estes são os Geeks disponíveis.
    ...                             visible     5

Fill geek form
    [Arguments]     ${geek_profile}

    Reset geek form

    Fill Text       id=whatsapp             ${geek_profile}[whats]
    Fill Text       id=desc                 ${geek_profile}[desc]

    IF      '${geek_profile}[printer_repair]'
        Select Options By       id=printer_repair       text       ${geek_profile}[printer_repair]
    END

    IF      '${geek_profile}[work]'

        Select Options By       id=work                 text       ${geek_profile}[work]
    END

    Fill Text       id=cost                 ${geek_profile}[cost]

Fill search form
    [Arguments]     ${target_option}        ${target_text}

    IF      '${target_option}'
        Select Options By       id=printer_repair       value       ${target_option}
    END
    
    Fill Text       id=desc                 ${target_text}

Submit geek form
    Click       css=button >> text=Quero ser um Geek

Submit search form
    Click       css=button[type='submit'] >> text=Buscar

Geek form should be success
    ${expected_message}     Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${expected_message}       visible     5
    Sleep   1

Reset geek form
    Execute Javascript      document.getElementsByClassName("be-geek-form")[0].reset();

Geek should be found
    [Arguments]         ${geek}

    ${fullname}         Set Variable        ${geek}[name] ${geek}[lastname]

    ${target_geek}      Get Element         xpath=//strong[contains(text(), "${fullname}")]/../../..

    ${work}             Convert To Lower Case           ${geek}[geek_profile][work]

    Get Text            ${target_geek}       contains        Atendimento ${work}
    Get Text            ${target_geek}       contains        ${geek}[geek_profile][desc]
    Get Text            ${target_geek}       contains        ${geek}[geek_profile][cost]

    Set Suite Variable      ${target_geek}

Alien icon should be visible
    Get Text        ${target_geek}           contains        👽

Search alert should be
    [Arguments]     ${expected_alert}

    Wait For Elements State     css=.search-not-found >> text=${expected_alert}
    ...                         visible     5
