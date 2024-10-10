*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Variables    ../camt_robot_project/data.yaml

*** Keywords ***
Open Browser To Home Page
    [Documentation]  เปิดหน้าแรกของเว็บไซต์
    [Arguments]    ${url}   ${browser}
    Open Browser    ${url}   ${browser}

Login Successful
    [Documentation]  ทำการล็อกอินเข้าสู่ระบบ
    [Arguments]    ${username}    ${password}
    Input Text    //*[@id="user-name"]    ${username} 
    Input Text    //*[@id="password"]    ${password}
    Click Button    //*[@id="login-button"]
    Wait Until Element Is Visible    locator=//div[contains(text(),"Products")]    timeout=10s

Verify Product Detials
    [Documentation]  ตรวจสอบรายละเอียดสินค้า
    [Arguments]    ${product_name}    ${product_price}
    ${product_name_on_page}=  Get Text    //*[@class="inventory_item_name"]
    Should Be Equal    ${product_name_on_page}    ${product_name}
    ${product_price_on_page}=  Get Text    //*[@class="inventory_item_price"]
     ## Remove the dollar sign from the expected price and convert to float
    ${expected_price_cleaned}=  Set Variable    ${product_price}[1:]  # Remove the first character (the dollar sign)
    ${expected_price_numeric}=  Evaluate    float('${expected_price_cleaned}')
    # Compare the numeric prices
    Should Be Equal As Numbers    ${product_price_on_page}    ${expected_price_numeric}

Add Product To Cart
    [Documentation]  เพิ่มสินค้าลงในตะกร้า
    [Arguments]    ${product_index}

    # Convert the index to an integer
    ${product_index_int}=    Evaluate    int(${product_index})
   ${button_locator}=  Set Variable    //*[@id="inventory_container"]/div/div[5]/div[3]/button
    Click Button    ${button_locator}
    
    Wait Until Element Is Visible     //*[@id="shopping_cart_container"]/a/span    timeout=10s
    


Go To Cart
    [Documentation]  ไปยังหน้าตะกร้าสินค้า
    Click Element    //*[@id="shopping_cart_container"]/a
    Wait Until Element Is Visible     locator=//div[contains(text(),"Your Cart")]    timeout=10s

Checkout From Cart  
    [Documentation]  ทำการสั่งซื้อสินค้า
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]
    Wait Until Element Is Visible     locator=//div[contains(text(),"Checkout: Your Information")]    timeout=10s
    Input Text    //*[@id="first-name"]   Pear
    Input Text    //*[@id="last-name"]    Happy
    Input Text    //*[@id="postal-code"]    50250
    Click button    //*[@id="checkout_info_container"]/div/form/div[2]/input
    Wait Until Element Is Visible    locator=//div[contains(text(),"Checkout: Overview")]    timeout=10s

Finish Checkout
    [Documentation]   ทำการยืนยันการสั่งซื้อสินค้า
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
    Wait Until Element Is Visible    locator=//div[contains(text(),"Finish")]   timeout=10s


