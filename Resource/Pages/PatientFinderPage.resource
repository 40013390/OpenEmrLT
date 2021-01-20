*** Settings ***
Documentation    In this page we had all operations related to patient
    
Resource    ../common_functionality.resource

*** Variables ***
${FIN_LOCATOR}    fin
${PATIENTCLICK_LOCATOR}    create_patient_btn1

*** Keywords ***
Switch To Fin Frame
    Select Frame    ${FIN_LOCATOR}
    
Add Patient
    Click Element    ${PATIENTCLICK_LOCATOR}
    

    


