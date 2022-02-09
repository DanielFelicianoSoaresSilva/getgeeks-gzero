*Settings*
Documentation       Services API

Library     RequestsLibrary

*Variables*
${API_GATEWAY}      https://getgeeks-gateway-daniel.herokuapp.com

*Keywords*
Get token as a Service
    [Arguments]     ${user}

    ${payload}      Create Dictionary
    ...             email=${user}[email]
    ...             password=${user}[password]

    ${response}     POST    ${API_GATEWAY}/sessions     json=${payload}

    ${token}        Set Variable        Bearer ${response.json()}[token]

    [return]        ${token}

Be a Geek as a service
    [Arguments]     ${payload}      ${token}

    ${headers}      Create Dictionary       AUthorization=${token}

    ${response}     POST    ${API_GATEWAY}/geeks
    ...             json=${payload}
    ...             headers=${headers}

    [return]        ${response}
