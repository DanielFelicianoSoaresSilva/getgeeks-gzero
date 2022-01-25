*Settings*
Documentation       BeGeek test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Be a BeGeek
    [Tags]      begeek

    ${user}     Factory User    be_geek

    Do login    ${user}
    Go to geek form
    Fill geek form      ${user}[geek_profile]
    Submit geek form
    Geek form should be success

Short description
    [Tags]      shortdesc

    ${user}     Factory User    short_desc

    Do login    ${user}
    Go to geek form
    Fill geek form      ${user}[geek_profile]
    Submit geek form
    Alert span should be    A descrição deve ter no minimo 80 caracteres

