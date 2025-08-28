*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /ping
Library          RequestsLibrary
Resource         base_keywords.robot

*** Keywords ***
GET Endpoint /ping
    ${response}    GET On Session    restful-booker    /ping
    Set Global Variable    ${response}