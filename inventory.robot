*** Settings ***
Resource    common.resource
Resource    login_page.resource
Resource    inventory.resource

*** Test Cases ***
AllProductNamesOk
    Open Browser    ${login_page}
    Login    ${standard_user}    ${password}
    Verify Element Text    xpath=(//div[@class='inventory_item_name '])[1]    ${backpack_name}
    Verify Element Text    (//div[@class='inventory_item_name '])[2]    ${bikelight_name}
    Verify Element Text    (//div[@class='inventory_item_name '])[3]    ${tshirt_name}
    Verify Element Text    (//div[@class='inventory_item_name '])[4]    ${jacket_name}
    Verify Element Text    (//div[@class='inventory_item_name '])[5]    ${onesie_name}
    Verify Element Text    (//div[@class='inventory_item_name '])[6]    ${tshirt_red_name}

AllProductDescriptionOk
    Open Browser    ${login_page}
    Login    ${standard_user}    ${password}
    Verify Element Text    (//div[@class='inventory_item_desc'])[1]    ${backpack_description}
    Verify Element Text    (//div[@class='inventory_item_desc'])[2]    ${bikelight_description}
    Verify Element Text    (//div[@class='inventory_item_desc'])[3]    ${tshirt_description}
    Verify Element Text    (//div[@class='inventory_item_desc'])[4]    ${jacket_description}
    Verify Element Text    (//div[@class='inventory_item_desc'])[5]    ${onesie_description}
    Verify Element Text    (//div[@class='inventory_item_desc'])[6]    ${tshirt_red_description}

AllProductPricesOk
    Open Browser    ${login_page}
    Login    ${standard_user}    ${password}
    Verify Element Text    (//div[@class='inventory_item_price'])[1]    ${backpack_price}
    Verify Element Text    (//div[@class='inventory_item_price'])[2]    ${bikelight_price}
    Verify Element Text    (//div[@class='inventory_item_price'])[3]    ${tshirt_price}
    Verify Element Text    (//div[@class='inventory_item_price'])[4]    ${jacket_price}
    Verify Element Text    (//div[@class='inventory_item_price'])[5]    ${onesie_price}
    Verify Element Text    (//div[@class='inventory_item_price'])[6]    ${tshirt_red_price}

AllProductImgsOk
    Open Browser    ${login_page}
    Login    ${standard_user}    ${password}
    Verify Element Attribute    //img[@alt='${backpack_name}']   ${backpack_img}    src
    Verify Element Attribute    //img[@alt='${bikelight_name}']   ${bikelight_img}    src
    Verify Element Attribute    //img[@alt='${tshirt_name}']   ${tshirt_img}    src
    Verify Element Attribute    //img[@alt='${jacket_name}']    ${jacket_img}    src
    Verify Element Attribute    //img[@alt='${onesie_name}']    ${onesie_img}    src
    Verify Element Attribute    //img[@alt='${tshirt_red_name}']    ${tshirt_red_img}    src

AddRemoveCart
    Open Browser     ${login_page}
    Login     ${standard_user}    ${password}
    Add Elements And Verify Count
    Remove Elements And Verify Count