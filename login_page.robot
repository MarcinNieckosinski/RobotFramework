*** Settings ***
Resource    common.resource
Resource    login_page.resource

*** Test Cases ***
StandardUserLogin
    [Documentation]    Login Page - Standard User
    Open Browser    ${login_page}
    Login    ${standard_user}    ${password}
    Verify Current URL    ${inventory}
    Element Should Be Visible    class=shopping_cart_link
    Element Should Be Visible    id=react-burger-menu-btn

ProblemUserLogin
    [Documentation]    Login Page - Problem User
    Open Browser    ${login_page}
    Login    ${problem_user}    ${password}
    Verify Current URL    ${inventory}
    Element Should Be Visible    class=shopping_cart_link
    Element Should Be Visible    id=react-burger-menu-btn

ErrorUserLogin
    [Documentation]    Login Page - Error User
    Open Browser    ${login_page}
    Login    ${error_user}    ${password}
    Verify Current URL    ${inventory}
    Element Should Be Visible    class=shopping_cart_link
    Element Should Be Visible    id=react-burger-menu-btn

VisualUserLogin
    [Documentation]    Login Page - Visual User
    Open Browser    ${login_page}
    Login    ${visual_user}    ${password}
    Verify Current URL    ${inventory}
    Element Should Be Visible    class=shopping_cart_link
    Element Should Be Visible    id=react-burger-menu-btn

LockedOutUserLogin
    [Documentation]    Login Page - Locked Out User
    Open Browser    ${login_page}
    Login    ${locked_out_user}    ${password}
    Verify URL Not Equal    ${inventory}
    Verify Error Message    Epic sadface: Sorry, this user has been locked out.

NonExistingUserLogin
    [Documentation]    Login Page - Locked Out User
    Open Browser    ${login_page}
    Login    ${non_existing_user}    ${password}
    Verify URL Not Equal    ${inventory}
    Verify Error Message    Epic sadface: Username and password do not match any user in this service

WrongPasswordLogin
    [Documentation]    Login Page - Locked Out User
    Open Browser    ${login_page}
    Login    ${standard_user}    ${wrong_password}
    Verify URL Not Equal    ${inventory}
    Verify Error Message    Epic sadface: Username and password do not match any user in this service