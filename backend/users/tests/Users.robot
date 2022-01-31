*Settings*
Documentation       Users route test suite

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Add new user

    ${user}      Factory New User

    # remover user via api
    Remove User  ${user}

    ${response}         POST User   ${user}
    Status Should Be    201         ${response}

