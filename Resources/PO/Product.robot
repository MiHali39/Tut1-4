*** Settings ***
Library    SeleniumLibrary
Library    String

#robot -d results Resources/PO/Product.robot

*** Variables ***
${PRODUCT.ADD_TO_CART} =   id=add-to-cart-button
${PRODUCT.PRICE_ELEMENT} =    //*[@id="priceblock_ourprice"]
${PRODUCT.MINIMAL_PRICE} =  1600
${PRODUCT.CHECKOUT_BUTTON} =    //*[@id="attach-sidesheet-checkout-button"]/span/input

#*** Test Cases ***
#If statement check
#   verify pricing

*** Keywords ***
Add product to cart
    click button    ${PRODUCT.ADD_TO_CART}

#Testing an IF statement
Verify pricing
    ${price}=    get text    ${PRODUCT.PRICE_ELEMENT}
    ${price}=    remove string        ${price}   ,    $
    ${price}=    Convert To Number    ${price}
    log    ${price}
    run keyword if    ${price} > ${PRODUCT.MINIMAL_PRICE}   Keyword 1
    ...    ELSE    Keyword 2

Wait for checkout pop-up
    wait until element is visible   ${PRODUCT.CHECKOUT_BUTTON}

Click checkout button
    click button    ${PRODUCT.CHECKOUT_BUTTON}

Keyword 1
    log    test succeeded

Keyword 2
    log    test failed