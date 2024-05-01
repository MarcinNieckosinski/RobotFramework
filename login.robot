*** Settings ***
Resource    common.resource
Resource    login_page.resource

*** Test Cases ***
StandardUserLogin
    [Documentation]    Login Page - Standard User
    Open Browser    ${login_page}
    Login    ${standard_user}    ${password}
    Verify Current URL    ${inventory}