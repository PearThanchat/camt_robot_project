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
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=10s
