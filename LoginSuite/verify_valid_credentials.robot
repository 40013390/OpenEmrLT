*** Settings ***
Documentation    This file is for validating valid credentials
Library    DataDriver    file=../TestData/OpenEMR.xlsx    sheetname=Verify_Valid_Credentials_Temp  
Resource    ../Resource/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource
Resource    ../Resource/Pages/PatientFinderPage.resource
Resource    ../Resource/Pages/SearchOrAddPatient.resource
Test Setup    Launch Browser
Test Teardown    End Browser

Test Template    Verify_Valid_Credentials_Template   

*** Test Cases ***
TC1

#TC1    admin    pass    English (Indian)    Flow Board
#TC2    physician    physician    English (Indian)    Flow Board
#TC3    accountant    accountant    English (Indian)    Flow Board                   

*** Keywords ***
Verify_Valid_Credentials_Template
    #LOGIN PAGE
    [Arguments]    ${username}    ${password}    ${language}    ${expectedvalue}    
    Enter Username    ${username}    
    Enter Password    ${password}    
    Select Language    ${language}
    Click Login  
    #DASHBOAR PAGE
    Dashboard Page Should Contain   ${expectedvalue}  
    MouseOver On BillySmith
    Click Logout
    
        
