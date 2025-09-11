*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /usuarios
Library          RequestsLibrary
Resource         ../support/common/common.robot
 
*** Keywords ***
POST Endpoint /usuarios      
    &{header}    Create Dictionary    
    ...          Content-Type=application/json
    ...          Accept=application/json

    ${response}    POST On Session    serverest    /usuarios    json=${payload}    headers=${header}    expected_status=any 
    ${id}=    Evaluate    $response.json().get("_id")
    IF    "${id}" != "None"
        Set Global Variable    ${ID_USUARIO}    ${id}
    END
    Set Global Variable    ${response}

PUT Endpoint /usuarios/id
    [Arguments]    ${id_usuario}   
    &{header}    Create Dictionary    
    ...          Content-Type=application/json
    ...          Accept=application/json

    ${response}    PUT On Session    serverest    /usuarios/${id_usuario}    json=${payload}    headers=${header}    expected_status=any    
    Set Global Variable    ${response}

GET Endpoint /usuarios    
    [Arguments]    ${token}
    &{header}    Create Dictionary    
    ...          Content-Type=application/json
    ...          Accept=application/json
    ...          Authorization=${token}
    ${response}    GET On Session    serverest    /usuarios    headers=${header}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios/id
    [Arguments]    ${id_usuario}   
    &{header}    Create Dictionary    
    ...          Content-Type=application/json
    ...          Accept=application/json

    ${response}    DELETE On Session    serverest    /usuarios/${id_usuario}    headers=${header}    expected_status=any    
    Set Global Variable    ${response}

Pegar Dados Usuario com Email ja Utilizado Estatico
    ${json}    Importar JSON    usuarios_invalidos.json
    Set Global Variable    ${payload}    ${json["usuario_com_email_ja_utilizado"]}

Criar Dados Usuario
    ${json}    Importar JSON    usuarios.json
    Set Global Variable    ${payload}    ${json["usuario_com_email_ja_utilizado"]}