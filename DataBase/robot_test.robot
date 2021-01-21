*** Settings ***
Library    DatabaseLibrary
Suite Setup    Connect To Database    pymysql    dbName=dbfree_db    dbUsername=dbfree_db    dbPassword=12345678
...    dbHost=db4free.net    dbPort=3306
Suite Teardown    Disconnect From Database

*** Test Cases ***
TC1_DB
    Check If Exists In Database    SELECT * FROM country WHERE name='Bhutan'    
    Check If Not Exists In Database    SELECT * FROM country WHERE name='aruba12'     
    
    ${rowcount}    Row Count    SELECT * FROM country    
    Log To Console    ${rowcount}    
    
    Row Count Is 0    SELECT * FROM city
    Row Count Is Equal To X    SELECT * FROM country    239    
    #Row Count Is Greater Than X    SELECT * FROM country   2
    #Row Count Is Less Than X    SELECT * FROM city    2           
    
    
TC2_update
    Execute Sql String    update country set name='auraba3'  where name='aurba2'
    Check If Exists In Database    SELECT * FROM country WHERE name='auruba3'  
    
TC3_CheckData
    ${output}    Query    SELECT * FROM country
    Log To Console    ${output}
    Log To Console    ${output}[0]
    Log To Console    ${output}[0][2]          
    
#TC4_Scripts
#    Execute Sql Script    sqlScriptFileName    