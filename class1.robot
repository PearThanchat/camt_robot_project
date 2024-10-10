*** Settings ***
Library  OperatingSystem
Library  Collections
Library  String

*** Variables ***
${MY}    Hello World

#List
@{COLORS}    Red  Green  Blue

&{USER1}   Name=Pearl    Age=25    Phone=1234567890

*** Test Cases ***
Example Variables
    log    ${USER1}[Phone]    console=TRUE

    