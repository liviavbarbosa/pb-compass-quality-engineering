*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /produtos
Library          RequestsLibrary
Resource         ../support/common/common.robot
 
*** Keywords ***
POST Endpoint /produtos
    [Arguments]    ${token}    
    &{header}      Create Dictionary    
    ...            Content-Type=application/json
    ...            Accept=application/json
    ...            Authorization=${token}

    ${response}    POST On Session    serverest    /produtos    json=${payload}    headers=${header}    expected_status=any 
    ${id}=    Evaluate    $response.json().get("_id")
    IF    "${id}" != "None"
        Set Global Variable    ${ID_PRODUTO}    ${id}
    END
    Set Global Variable    ${response}

PUT Endpoint /produtos/id
    [Arguments]    ${token}    ${id_produto}   
    &{header}      Create Dictionary    
    ...            Content-Type=application/json
    ...            Accept=application/json
    ...            Authorization=${token}

    ${response}    PUT On Session    serverest    /produtos/${id_produto}    json=${payload}    headers=${header}    expected_status=any 
    Set Global Variable    ${response}

DELETE Endpoint /produtos/id
    [Arguments]    ${token}    ${id_produto}   
    &{header}      Create Dictionary    
    ...            Content-Type=application/json
    ...            Accept=application/json
    ...            Authorization=${token}

    ${response}    DELETE On Session    serverest    /produtos/${id_produto}    headers=${header}    expected_status=any 
    Set Global Variable    ${response}