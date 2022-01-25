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
