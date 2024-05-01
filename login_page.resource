*** Variables ***
${standard_user}    standard_user
${problem_user}    problem_user
${error_user}    error_user
${visual_user}    visual_user
${locked_out_user}    locked_out_user
${non_existing_user}    non_existing_user

${password}    secret_sauce
${wrong_password}    wrong_password

${error_field}    //h3[@data-test='error']

*** Keywords ***
Login
    [Arguments]    ${login}    ${password}
    Input Text    id=user-name    ${login}
    Input Password    id=password    ${password}
    Click Button    id=login-button

Verify Error Message
    [Arguments]    ${message}
    ${error}    Get Text    ${error_field}
    Should Be Equal    ${error}    ${message}