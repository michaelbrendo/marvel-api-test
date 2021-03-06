*Settings*
Documentation    Initial test

Library    RequestsLibrary 
Library    Helpers.py


Resource    routes/Characters.robot

*Variables*
${API_URI}    http://marvel.qaninja.academy

*Keywords*
Super Setup
    [Arguments]    ${email}

    Set Client Key      ${email}
    Back To The Past

Set Client Key
    [Arguments]    ${email}
    &{user}     Create Dictionary    email=${email}

    ${response}    POST
    ...            ${API_URI}/accounts
    ...            json=${user}

    ${client_key}    Set Variable         ${response.json()}[client_key]
    &{HEADERS}       Create Dictionary    client_key=${client_key}

    Set Suite Variable    ${HEADERS}

Back To The Past

    DELETE    ${API_URI}/delorean    headers=${HEADERS}