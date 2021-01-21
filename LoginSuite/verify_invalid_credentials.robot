*** Settings ***
Documentation    This file is test for invalid Credential Testing

Library    DataDriver    file=../TestData/OpenEMRTemplate.xlsx    sheet_name=Verify_Invalid_Credentials_Temp  

Resource    ../Resource/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource

Resource    ../Resource/Pages/DashboardPage.resource
Resource    ../Resource/Pages/PatientFinderPage.resource
Resource    ../Resource/Pages/SearchOrAddPatient.resource
Test Setup    Launch Browser
Test Teardown    End Browser

Test Template    Verify_Invalid_Credentials_Template 


*** Test Cases ***

#TC1    admin123    pass    English (Indian)    Invalid username or password
#TC2    physician123    physician    English (Indian)    Invalid username or password
TC3    
    
*** Keywords ***
Verify_Invalid_Credentials_Template
    
    ${width}    ${height}    Get Window Size    
    Log To Console    ${width}    
    Log To Console    ${height}    
    
    Set Window Size    800     600   
    
    ${width}    ${height}    Get Window Size    
    Log To Console    ${width}    
    Log To Console    ${height}   
    
    [Arguments]    ${username}    ${password}    ${language}    ${expectedvalue}
    Enter Username    ${username}    
    Enter Password    ${password}     
    Select Language    ${language}     
    Click Login  
    Verify Error Message    Invalid username or password
    MouseOver On BillySmith
    Click Logout
       
    
  