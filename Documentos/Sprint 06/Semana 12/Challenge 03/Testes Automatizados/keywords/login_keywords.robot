*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /login
Library          RequestsLibrary
Resource         ../support/common/common.robot
 
*** Keywords ***
POST Endpoint /login      
    ${response}    POST On Session    serverest    /login    json=${payload}    expected_status=any
    ${authorization}=    Evaluate    $response.json().get("authorization")
    IF    "${authorization}" != "None"
        Set Global Variable    ${TOKEN}    ${authorization}
    END
    Set Global Variable    ${response}

Pegar Dados Login Estatico Usuario Comum Valido
    ${json}    Importar JSON    usuarios_validos.json
    Set Global Variable    ${payload}    ${json["usuario_comum"]}

Pegar Dados Login Estatico Usuario Administrador Valido
    ${json}    Importar JSON    usuarios_validos.json
    Set Global Variable    ${payload}    ${json["usuario_adm"]}