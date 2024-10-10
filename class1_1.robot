*** Settings ***
Library  OperatingSystem
Library  Collections
Library  String

*** Test Cases ***
example Variables
    [Tags]    test1
    ${MY}    Set Variable    Hello World
    example    ${MY}
    example login user

example keyword
    [Tags]    test2
    ${MY}    Set Variable    Hello World
    example    ${MY}
    example login user

*** Keywords ***
example
    [Arguments]    ${data}
    log    ${data}    console=TRUE

example login user 
    Log    robot framework    console=TRUE




    