*Settings*
Documentation       BeGeek test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Session

*Test Cases*
Be a Geek
    [Tags]      smoke       begeek

    ${user}     Factory User    be_geek

    Do login    ${user}
    Go to geek form
    Fill geek form      ${user}[geek_profile]
    Submit geek form
    Geek form should be success

# Short description
#     [Tags]      shortdesc

#     ${user}     Factory User    short_desc

#     Do login    ${user}
#     Go to geek form
#     Fill geek form      ${user}[geek_profile]
#     Submit geek form
#     Alert span should be    A descrição deve ter no minimo 80 caracteres

# Long description
#     [Tags]      longdesc

#     ${user}     Factory User    long_desc

#     Do login    ${user}
#     Go to geek form
#     Fill geek form      ${user}[geek_profile]
#     Submit geek form
#     Alert span should be    A descrição deve ter no máximo 255 caracteres

# Empty description
#     [Tags]      empty_desc

#     ${user}     Factory User    empty_desc

#     Do login    ${user}
#     Go to geek form
#     Fill geek form      ${user}[geek_profile]
#     Submit geek form
#     Alert span should be    Informe a descrição do seu trabalho

# Empty whats
#     [Tags]      empty_whats

#     ${user}     Factory User    empty_whats

#     Do login    ${user}
#     Go to geek form
#     Fill geek form      ${user}[geek_profile]
#     Submit geek form
#     Alert span should be    O Whatsapp deve ter 11 digitos contando com o DDD

