*Settings*
Documentation       Test Helpers

*Keywords*
# Add user
    #[Arguments]     ${user}

    # Go to signup form
    # Fill signup form    ${user}
    # Submit signup form
    # User should be registered

Add user from database
    [Arguments]     ${user}

    Connect to postgress
    Insert user     ${user}
    Disconnect From Database

Do login
    [Arguments]     ${user}

    Go to login page
    Fill credencials  ${user}
    Submit credencials
    User should be logged in  ${user}

Create geek profile as a service
    [Arguments]     ${user}

    ${token}                    Get token as a service          ${user}
    Be a Geek as a Service      ${user}[geek_profile]          ${token}
