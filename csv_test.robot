*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    CSVLibrary
Library    SeleniumLibrary
Variables    /Users/11474715/Library/CloudStorage/OneDrive-BankofAyudhyaPublicCompanyLimited/Documents/robot/data.yaml

*** Test Cases ***
Get csv testing
    ${csv_file}    set Variable    ${CURDIR}/test_data_robot_csv.csv
    ${DATA_CSV}     Read Csv File To Associative    ${CSV_FILE}
    # Log to console    ${DATA_CSV}
    FOR    ${row}    IN    @{DATA_CSV}
        Open Browser Chrome    ${url}   ${browser}
        Maximize browser window
        Input Username    ${row}[\ufeffusername]
        Input Password    ${row}[password]
        Click Login
        Verify Text Products
        Click Add to Cart
        Click to Logout
        Click Element Logout
        # Log to console    ${row}[\ufeffusername]
        # Log to console    ${row}[password]
    END


*** Keywords ***
Open Browser Chrome
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}  

Input Username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}    
Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click Login
    Click Button    //*[@id="login-button"]

Verify Text Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=10s 
    # Wait Until Element Is Visible    //div[contains(text(),"Sauce Labs Backpack")]    timeout=10s

Click Add to Cart
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button

Click to Logout
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button
    Sleep    2s

Click Element Logout
    Click Element   id:logout_sidebar_link
    Sleep    2s

Verify Text 
    Wait Until Element Is Visible    //h4[contains(text(),"Accepted usernames are:")]    timeout=10s 
     

