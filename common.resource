*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_page}    https://www.saucedemo.com/
${inventory}    https://www.saucedemo.com/inventory.html
${cart_page}    https://www.saucedemo.com/cart.html
${first_checkout_page}    https://www.saucedemo.com/checkout-step-one.html
${second_checkout_page}    https://www.saucedemo.com/checkout-step-two.html
${checkout_complete_page}    https://www.saucedemo.com/checkout-complete.html

*** Keywords ***
Verify Current URL
    [Arguments]    ${url}
    ${current_url}    Get Location
    Should Be Equal    ${current_url}    ${url}    Url is not valid