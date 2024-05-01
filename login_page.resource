*** Variables ***
${standard_user}    standard_user
${problem_user}    problem_user
${error_user}    error_user
${visual_user}    visual_user
${locked_out_user}    locked_out_user
${non_existing_user}    non_existing_user

${password}    secret_sauce
${wrong_password}    wrong_password

*** Keywords ***
Login
    [Arguments]    ${login}    ${password}
    Input Text    id=user-name    ${login}
    Input Password    id=password    ${password}
    Click Button    id=login-button