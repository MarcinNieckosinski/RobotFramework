*** Variables ***
${shopping_cart_badge}    class=shopping_cart_badge
${sort_select}    //select[@data-test='product_sort_container']

${backpack_name}    Sauce Labs Backpack
${backpack_description}    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${backpack_price}    $29.99
${backpack_img}    https://www.saucedemo.com/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg

${bikelight_name}    Sauce Labs Bike Light
${bikelight_description}    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.
${bikelight_price}    $9.99
${bikelight_img}    https://www.saucedemo.com/static/media/bike-light-1200x1500.37c843b0.jpg

${tshirt_name}    Sauce Labs Bolt T-Shirt
${tshirt_description}    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.
${tshirt_price}    $15.99
${tshirt_img}    https://www.saucedemo.com/static/media/bolt-shirt-1200x1500.c2599ac5.jpg

${jacket_name}    Sauce Labs Fleece Jacket
${jacket_description}    It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.
${jacket_price}    $49.99
${jacket_img}    https://www.saucedemo.com/static/media/sauce-pullover-1200x1500.51d7ffaf.jpg

${onesie_name}    Sauce Labs Onesie
${onesie_description}    Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.
${onesie_price}    $7.99
${onesie_img}    https://www.saucedemo.com/static/media/red-onesie-1200x1500.2ec615b2.jpg

${tshirt_red_name}    Test.allTheThings() T-Shirt (Red)
${tshirt_red_description}    This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.
${tshirt_red_price}    $15.99
${tshirt_red_img}    https://www.saucedemo.com/static/media/red-tatt-1200x1500.30dadef4.jpg

@{add_to_cart_list}    add-to-cart-sauce-labs-backpack    add-to-cart-sauce-labs-bike-light    add-to-cart-sauce-labs-bolt-t-shirt    add-to-cart-sauce-labs-fleece-jacket    add-to-cart-sauce-labs-onesie    add-to-cart-test.allthethings()-t-shirt-(red)
@{remove_from_cart_list}    remove-sauce-labs-backpack    remove-sauce-labs-bike-light    remove-sauce-labs-bolt-t-shirt    remove-sauce-labs-fleece-jacket    remove-sauce-labs-onesie    remove-test.allthethings()-t-shirt-(red)

*** Keywords ***
Verify Element Text
    [Arguments]    ${element_locator}    ${expected_value}
    ${actual_value}    Get Text    ${element_locator}
    Should Be Equal    ${actual_value}    ${expected_value}

Verify Element Text Not Equal
    [Arguments]    ${element_locator}    ${expected_value}    ${attribute}
    ${actual_value}    Get Text    ${element_locator}    ${attribute}
    Should Not Be Equal    ${actual_value}    ${expected_value}

Verify Element Attribute
    [Arguments]    ${element_locator}    ${expected_value}    ${attrib}
    ${actual_value}    Get Element Attribute    ${element_locator}    ${attrib}
    Should Be Equal    ${actual_value}    ${expected_value}

Verify Shopping Cart Equal
    [Arguments]    ${quantity}
    ${shopping_cart_value}    Get Text    ${shopping_cart_badge}
    Should Be Equal    ${shopping_cart_value}    ${quantity}

Add Elements And Verify Count
    ${counter}    Set Variable    0
    ${increment}    Set Variable    1
    FOR    ${add_element}     IN     @{add_to_cart_list}
        Click Button    ${add_element}
        ${counter}    Evaluate    ${counter} + ${increment}
        ${string_counter}    Convert To String    ${counter}
        Verify Shopping Cart Equal    ${string_counter}
    END

Remove Elements And Verify Count
    ${counter}    Set Variable    6
    ${decrement}    Set Variable    1
    FOR    ${remove_element}    IN    @{remove_from_cart_list}
        Click Button    ${remove_element}
        ${counter}    Evaluate    ${counter} - ${decrement}
        ${string_counter}    Convert To String    ${counter}
        IF    $remove_element != 'remove-test.allthethings()-t-shirt-(red)'
            Verify Shopping Cart Equal    ${string_counter}
        ELSE
            Element Should Not Be Visible    ${shopping_cart_badge}
        END
    END