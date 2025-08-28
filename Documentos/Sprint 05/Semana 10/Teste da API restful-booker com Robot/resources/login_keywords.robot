*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /auth
Library          RequestsLibrary
Resource         base_keywords.robot

*** Keywords ***
POST Endpoint /auth
    [Arguments]    ${USERNAME}    ${PASSWORD}
    &{payload}    Create Dictionary    
    ...           username=${USERNAME}
    ...           password=${PASSWORD}
    ${response}    POST On Session    restful-booker    /auth    json=&{payload}
    Set Global Variable    ${TOKEN}    ${response.json()["token"]}
    Set Global Variable    ${response}