*** Settings ***
Documentation    Thos file handles all the operations related to login page

Resource    ../common_functionality.resource


*** Variables ***
${USERNAME_LOCATOR}    authUser
${PASSWORD_LOCATOR}    clearPass
${LANGUAGE_LOCATOR}    name=languageChoice
${LOGIN_LOCATOR}    xpath=//button[@type='submit']    
${ERROR_LOCATOR}    //*[contains(text(),'Invalid')]
*** Keywords ***
Enter Username
    	[Arguments]    ${username}    
    	Input Text    ${USERNAME_LOCATOR}    ${username}  

Enter Password
        [Arguments]    ${password}
        Input text    ${PASSWORD_LOCATOR}    ${password}

Select Language
    [Arguments]    ${language}
    Select From List By Label    ${LANGUAGE_LOCATOR}     ${language}
    
Click Login
    Click Element    ${LOGIN_LOCATOR}
    
Verify Error Message
    [Arguments]    ${errormgs}
    Element Should Contain    ${ERROR_LOCATOR}    ${errormgs}
    

    
         
        