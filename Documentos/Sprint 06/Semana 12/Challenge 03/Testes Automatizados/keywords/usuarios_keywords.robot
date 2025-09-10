*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /usuarios
Library          RequestsLibrary
Resource         ../support/common/common.robot
 
*** Keywords ***
POST Endpoint /usuarios      
    &{header}    Create Dictionary    Content-Type=application/json

    ${response}    POST On Session    serverest    /usuarios    json=${payload}    expected_status=any    
    Set Global Variable    ${response}

Pegar Dados Usuario com Email ja Utilizado Estatico
    ${json}    Importar JSON    usuarios_invalidos.json
    Set Global Variable    ${payload}    ${json["usuario_com_email_ja_utilizado"]}