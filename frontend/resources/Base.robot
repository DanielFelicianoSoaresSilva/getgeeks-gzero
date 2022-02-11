*Settings*
Documentation       Base test

Library     Browser
Library     Collections
Library     Utils.py
Library     String

Library     factories/Users.py

Resource    actions/_SharedActions.robot
Resource    actions/AuthActions.robot
Resource    actions/GeekActions.robot
Resource    actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot
Resource    Services.robot

*Variables*
${BASE_URL}      https://getgeeks-daniel.herokuapp.com

*Keywords*
Start Session
    #New Browser             chromium        headless=False      #slowMo=00:00:00.5
    
    New Browser             ${BROWSER}        headless=${headless}      #slowMo=00:00:00.5
    New Page                ${BASE_URL}
    Set Viewport Size       1280    760

After Session
    ${shot_name}        Screenshot Name
    Take Screenshot     fullPage=True       filename=${shot_name}
    