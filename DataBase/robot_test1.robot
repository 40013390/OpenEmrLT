*** Settings ***
Library    Collections
Library    OperatingSystem    
Library    String    
*** Variables ***
${URL}    balaji
@{COLORS}    red    yellow    green    orange    #creation of list
&[TRAINERDETAIL]    name=balaji    place=chennai    #creation of dictionary
*** Test Cases ***
TC1_ValidCredential
    #dictory printing
    Log To Console    &[TRAINERDETAIL][name]   
    
    ${name}    Set Variable    balaji
    Log To Console    ${name}    
    
    Log To Console    ${COLORS} [0]    
    #for loopwith using list @[listname]
    FOR    ${Color}    IN    @{COLORS} 
        Log To Console    ${Color}
    END
    #locally creating list
    @{fruits}    Create List    apple    banana    grapes
    Append To List    blue
    
    ${count}    Get Length    ${COLORS}
    Log To Console    ${count}       
    #Log To Console    @{fruits}
       
    #creating dictionary locally
    #${trainer}    Create Dictionary    name=suriya    place=chennai 
    


    Log To Console    ${}+${}    
    Replace String    string    search_for    replace_with      