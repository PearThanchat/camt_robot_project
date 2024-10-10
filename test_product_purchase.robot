*** Settings ***
Resource    import.resource
Library    OperatingSystem
Variables    ../camt_robot_project/data.yaml

*** Test Cases ***
Successful Product Purchase
    [Documentation]   ทดสอบการสั่งซื้อสินค้าสำเร็จและตรวจสอบราคาสินค้า
    Open Browser To Home Page    ${url}    ${browser} 
    Login Successful    ${username.standard_user}    ${password}

# Accessing the first product in the list
    ${product_index}=    Set Variable    4  
    ${select_product}=    Get From List    ${products}    ${product_index}
    ${product_name}=    Get From Dictionary    ${select_product}    name
    ${product_price}=    Get From Dictionary    ${select_product}    price

   Add Product To Cart    ${product_index} 
    Go To Cart
    Verify Product Detials   ${product_name}    ${product_price}
    Checkout From Cart  
    Finish Checkout 




