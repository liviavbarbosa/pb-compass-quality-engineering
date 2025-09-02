*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /auth
Library          RequestsLibrary
Resource         ../support/common/common.robot
 
*** Keywords ***
POST Endpoint /auth      
    ${response}    POST On Session    restful-booker    /auth    json=${payload}    expected_status=any
    ${token}=    Evaluate    $response.json().get("token")
    IF    "${token}" != "None"
        Set Global Variable    ${TOKEN}    ${token}
    END
    Set Global Variable    ${response}

Pegar Dados Login Estatico Valido
    ${json}    Importar JSON    credenciais_login.json
    Set Global Variable    ${payload}    ${json["usuario_valido"]}

Pegar Dados Login Estatico com Username Vazio
    ${json}    Importar JSON    credenciais_login.json
    Set Global Variable    ${payload}    ${json["usuario_com_username_vazio"]}

Pegar Dados Login Estatico com Senha Vazia
    ${json}    Importar JSON    credenciais_login.json
    Set Global Variable    ${payload}    ${json["usuario_com_senha_vazia"]}

Pegar Dados Login Estatico com Username Invalido
    ${json}    Importar JSON    credenciais_login.json
    Set Global Variable    ${payload}    ${json["usuario_com_username_invalido"]}

Pegar Dados Login Estatico com Senha Incorreta
    ${json}    Importar JSON    credenciais_login.json
    Set Global Variable    ${payload}    ${json["usuario_com_senha_incorreta"]}