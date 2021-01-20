*** Settings ***
Documentation    This file is for validating valid credentials

Resource    ../Resource/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource
Resource    ../Resource/Pages/PatientFinderPage.resource
Resource    ../Resource/Pages/SearchOrAddPatient.resource

Test Setup    Launch Browser
Test Teardown    End Browser

*** Test Cases ***
Verify_Valid_Credentials_Test
    #LOGIN PAGE
    Enter Username    admin    
    Enter Password    pass    
    Select Language    English (Indian)
    Click Login  
    #DASHBOAR PAGE
    Dashboard Page Should Contain    Flow Board    
    MouseOver On PatientClient
    ClickPatient
    #PATIENT FINDER PAGE
    #Add
    Switch To Fin Frame
    Add Patient
    Unselect Frame
    
    #SEARCH OR ADD PATIENT
    Sleep    5s
    Switch To Pat Frame
    Select Prefix    Mr.
    EnterFirstName    Suriya
    EnterLastName    ShivaKumar
    EnterDOB    2021-01-19
    Enter Gender    Male
    Click On Create
    Unselect Frame
    
    Switch To Modal Frame
    Sleep    3s    
    Confirm and Create Newpatient
    Unselect Frame
    Validate and Handle Alert Message    New Due Clinical Reminders
    Handle Happy Birthday Message
    Switch To Pat Frame
    Verify Add Patient Details    Medical Record Dashboard - Suriya ShivaKumar 
    Unselect Frame
    MouseOver On BillySmith
    Click Logout
    