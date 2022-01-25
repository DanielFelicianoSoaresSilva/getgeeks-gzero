*Settings*
Documentation       Attempt BeGeek test suite

Resource        ${EXECDIR}/resources/Base.robot

Suite Setup      Start session for attempty be a geek
Test Template   Attempt be a geek

#removido devido o Take Screeshot estar no código pata tirar o print de cada step
#Test Teardown   Finish Session

*Variables*
${LONG_DESC}    Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unity.

*Test Cases*
Whats only DDD      whats               11                      O Whatsapp deve ter 11 digitos contando com o DDD
Whats only number   whats               999999999               O Whatsapp deve ter 11 digitos contando com o DDD
Empty whats         whats               ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Short desc          desc                Formato o seu PC.       A descrição deve ter no minimo 80 caracteres
Long desc           desc                ${LONG_DESC}            A descrição deve ter no máximo 255 caracteres
Empty desc          desc                ${EMPTY}                Informe a descrição do seu trabalho
Cost letters        cost                aaaa                    Valor hora deve ser numérico
Cost alpha          cost                aa12                    Valor hora deve ser numérico
Cost special chars  cost                !$#%                    Valor hora deve ser numérico
Empty cost          cost                ${EMPTY}                Valor hora deve ser numérico
No printer repair   printer_repair      ${EMPTY}                Por favor, informe se você é um Geek Supremo
No work             work                ${EMPTY}                Por favor, selecione o modelo de trabalho

*Keywords*
Attempt be a geek
    [Arguments]     ${key}      ${input_field}      ${output_message}

    ${user}     Factory User    attempt_be_geek

    Set To Dictionary   ${user}[geek_profile]   ${key}      ${input_field}

    Fill geek form      ${user}[geek_profile]
    Submit geek form
    Alert span should be    ${output_message}

    After Session

    #Por causa do pabot
    #Take Screenshot     fullPage=True

Start session for attempty be a geek

    ${user}     Factory User    attempt_be_geek

    Start Session
    Do login    ${user}
    Go to geek form


#Aqui conta apenas com um teste, acima conta como 10 testes
# Should not be a geek
#     [Template]      Attempt be a geek

#     whats       11                      O Whatsapp deve ter 11 digitos contando com o DDD
#     whats       999999999               O Whatsapp deve ter 11 digitos contando com o DDD
#     whats       ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
#     desc        Formato o seu PC.       A descrição deve ter no minimo 80 caracteres
#     desc        ${LONG_DESC}            A descrição deve ter no máximo 255 caracteres
#     desc        ${EMPTY}                Informe a descrição do seu trabalho
#     cost        aaaa                    Valor hora deve ser numérico
#     cost        aa12                    Valor hora deve ser numérico
#     cost        !$#%                    Valor hora deve ser numérico
#     cost        ${EMPTY}                Valor hora deve ser numérico

# *Keywords*
# Attempt be a geek
#     [Arguments]     ${key}      ${input_field}      ${output_message}

#     ${user}     Factory User    attempt_be_geek

#     Set To Dictionary   ${user}[geek_profile]   ${key}      ${input_field}

#     Fill geek form      ${user}[geek_profile]
#     Submit geek form
#     Alert span should be    ${output_message}

#     Take Screenshot     fullPage=True

# Start session for attempty be a geek

#     ${user}     Factory User    attempt_be_geek

#     Start Session
#     Do login    ${user}
#     Go to geek form

