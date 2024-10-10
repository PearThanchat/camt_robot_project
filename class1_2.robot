*** Settings ***
Library  OperatingSystem
Library  Collections
Library  String
Test Template    example

*** Test Cases ***
example keyword1                        
    [Tags]    test_data_driven1                    
    [Documentation]    Login สำเร็จโดยใช้ Username แบบธรรมดา
    test_user    test_password    

example keyword2                                         
    [Tags]    test2_data_driven2            
    [Documentation]    Login สำเร็จโดยใช้ Username แบบโหลดหน้าเพจช้า
    test_user_2    test_password_2    M  

*** Keywords ***
example
    [Arguments]    ${username}    ${password}    ${gender}=F
    log    ${username}    console=TRUE
    log    ${password}    console=TRUE
    log    ${gender}    console=TRUE

