*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /auth
Library          RequestsLibrary
Resource         common.robot

*** Keywords ***
POST Endpoint /auth
    ${response}    POST On Session    restful-booker    /auth    json=&{payload}    expected_status=any
    ${token}=    Evaluate    $response.json().get("token")
    IF    "${token}" != "None"
        Set Global Variable    ${TOKEN}    ${token}
    END
    Set Global Variable    ${response}

Realizar Login com Credenciais Validas
    ${json}    Importar JSON    credencias_login.json
    ${payload}    Set Global Variable    ${json["usuario_valido"]}
    POST Endpoint /auth

Realizar Login com Username Vazio
    ${json}    Importar JSON    credencias_login.json
    ${payload}    Set Variable    ${json["usuario_com_username_vazio"]}
    POST Endpoint /auth

Realizar Login com Senha Vazia
    ${json}    Importar JSON    credencias_login.json
    ${payload}    Set Variable    ${json["usuario_com_senha_vazia"]}
    POST Endpoint /auth

Realizar Login com Username Invalido
    ${json}    Importar JSON    credencias_login.json
    ${payload}    Set Variable    ${json["usuario_com_username_invalido"]}
    POST Endpoint /auth

Realizar Login com Senha Incorreta
    ${json}    Importar JSON    credencias_login.json
    ${payload}    Set Variable    ${json["usuario_com_senha_incorreta"]}
    POST Endpoint /auth