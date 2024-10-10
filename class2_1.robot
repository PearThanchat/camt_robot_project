*** Settings ***
Library  SeleniumLibrary
Library  String
Library  BuiltIn

*** Test Cases ***
Login Test
    Open Browser chrome    https://www.saucedemo.com/v1/index.html    chrome
    Input Username    standard_user
    Input password    secret_sauce
    Click Login
    Verify Login

Add to Cart Test
    Click Add       

Logout Test
    Click Logout 
    Verify Logout

*** Keywords ***
Open Browser chrome
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}        
Input Username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}   

Input password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click Login
    Click Button    //*[@id="login-button"]

Verify Login
    Wait Until Element Is Visible    //div[contains(text(),"Products")]   timeout=10s

Click Add  
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button 

Click Logout  
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button
    Sleep   2s
    Click Element   id:logout_sidebar_link

Verify Logout
    Wait Until Element Is Visible    //*[contains(text(),"Accepted usernames are:")]    timeout=2s

