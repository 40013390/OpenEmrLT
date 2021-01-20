*** Settings ***
Documentation    This file deals with all operation on dashboard Page
    
Resource    ../common_functionality.resource

*** Variables ***

${NAME_LOCATOR}    //div[text()='Patient/Client'] 
${PATIENT_LOCATOR}    //div[text()='Patients']
${LOGOUTCLICK_LOCATOR}    //li[text()='Logout']
${LOGOUT_LOCATOR}    //*[@id='username']

*** Keywords ***
Dashboard Page Should Contain
    [Arguments]    ${pagetext}
    Page Should Contain    ${pagetext}
    
MouseOver On PatientClient
    Mouse Over    ${NAME_LOCATOR}
    
MouseOver On BillySmith
    Mouse Over    ${LOGOUT_LOCATOR}    

ClickPatient
    Click Element    ${PATIENT_LOCATOR} 
    
Click Logout
    Click Element    ${LOGOUTCLICK_LOCATOR}


    