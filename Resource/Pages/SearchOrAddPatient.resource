*** Settings ***
Documentation    In this page we had all operations like searching and adding patient
    
Resource    ../common_functionality.resource

*** Variables ***
${PAT_LOCATOR}    pat
${PREFIX_LOCATOR}    form_title
${FRISTN_LOCATOR}    form_fname
${LASTN_LOCATOR}    form_lname
${DOB_LOCATOR}    form_DOB
${GENDER_LOCATOR}    form_sex
${CREATE_LOCATION}    create
${MODAL_LOCATOR}    modalframe
${NEWPATIENT_LOCATOR}    xpath=//input[@value='Confirm Create New Patient']
${BIRTHDAYMGS_LOCATOR}    //div[@class='closeDlgIframe'] 
${PATIENTPRINT_LOCATOR}    //h2[contains(text(),'Record Dashboard')]

*** Keywords ***
Switch To Pat Frame
    Select Frame    ${PAT_LOCATOR}
    
Select Prefix
     [Arguments]    ${prefix}    
     Select From List By Label    ${PREFIX_LOCATOR}    ${prefix}
EnterFirstName
    [Arguments]    ${firstname}
    Input Text    ${FRISTN_LOCATOR}    ${firstname}
    
EnterLastName
    [Arguments]    ${lastname}
    Input Text    ${LASTN_LOCATOR}    ${lastname}
EnterDOB
    [Arguments]    ${dob}    
    Input Text    ${DOB_LOCATOR}    ${dob} 
Enter Gender
    [Arguments]    ${gender}
    Select From list By Label    ${GENDER_LOCATOR}    ${gender}
Click On Create
    Click Button    ${CREATE_LOCATION}   
           
Switch To Modal Frame
    Select Frame    ${MODAL_LOCATOR}
    
Confirm and Create Newpatient
    Click Element    ${NEWPATIENT_LOCATOR} 
    
Validate and Handle Alert Message 
    [Arguments]    ${alerttxt}
    ${alerttxt}    Handle Alert    timeout=30s
    #Alert Should Be Present    ${alerttxt}    ${alerttxt} 
       
Handle Happy Birthday Message
    Run Keyword And Ignore Error        Click Element    ${BIRTHDAYMGS_LOCATOR}    
    
Verify Add Patient Details
    [Arguments]    ${verifyPatient}
    Element Should Contain    ${PATIENTPRINT_LOCATOR}        ${verifyPatient}    
    
   




     

