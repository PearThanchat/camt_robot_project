*** Settings ***
Library  SeleniumLibrary
Library  String
Library  BuiltIn
Library  Collections
Library  OperatingSystem
Test Template  Login success

*** Test Cases ***
Example for standard_user  standard_user    secret_sauce
Example for problem_user  problem_user    secret_sauce
Example problem_user  performance_glitch_user    secret_sauce


*** Keywords ***
Login success
    [Arguments]    ${username}    ${password}
    Open Browser    https://www.saucedemo.com/v1/index.html    chrome
    Input Text    //*[@id="user-name"]    ${username}
    Input Text    //*[@id="password"]    ${password}
    Click Button    //*[@id="login-button"]
    Wait Until Element Is Visible    locator=//div[contains(text(),"Products")]    timeout=10s