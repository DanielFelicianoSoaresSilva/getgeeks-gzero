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
