*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /booking
Library          RequestsLibrary
Resource         common.robot
Resource         data/dynamics.robot
Resource         login_keywords.robot

*** Keywords ***
POST Endpoint /booking
    &{header}    Create Dictionary    Content-Type=application/json
    ...           Accept=application/json

    ${response}    POST On Session    restful-booker    /booking    json=&{payload}    expected_status=any    
    Set Global Variable    ${ID_RESERVA}    ${response.json()["bookingid"]}
    Set Global Variable    ${response}
    Log To Console    ${response.json()}

PUT Endpoint /booking/id
    [Arguments]    ${id_reserva}    ${token}
    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${token}

    ${response}    PUT On Session    restful-booker    /booking/${id_reserva}    json=&{payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log To Console    ${response.json()}

PATCH Endpoint /booking/id
    [Arguments]    ${id_reserva}    ${token}    &{dados_modificar}
    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${token}
    ${response}    PATCH On Session    restful-booker    /booking/${id_reserva}    json=&{dados_modificar}    headers=${header}    expected_status=any
    Set Global Variable    ${response}

GET Endpoint /booking
    ${response}    GET On Session    restful-booker    /booking
    Set Global Variable    ${response}

GET Endpoint /booking/id    
    [Arguments]    ${id_reserva}
    ${response}    GET On Session    restful-booker    /booking/${id_reserva}    expected_status=any
    Set Global Variable    ${id_reserva}

DELETE Endpoint /booking/id
    [Arguments]    ${id_reserva}    ${token}
    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${token}

    ${response}    DELETE On Session    restful-booker    /booking/${id_reserva}    headers=${header}    expected_status=any
    Set Global Variable    ${response}

Cadastrar Reserva Valida
    ${payload}    Criar Dados Reserva Valida
    Set Global Variable    ${payload}
    POST Endpoint /booking

Cadastrar Reserva com Campos Nulos
    ${json}    Importar JSON    reservas_invalidas.json
    ${payload}    Set Variable    ${json["reserva_com_campos_faltando"]}
    POST Endpoint /booking

Cadastrar Reserva com Tipagem Incorreta
    ${json}    Importar JSON    reservas_invalidas.json
    ${payload}    Set Variable    ${json["reserva_com_tipagem_incorreta"]}
    POST Endpoint /booking

Cadastrar Reserva com Valor Numerico Invalido
    ${json}    Importar JSON    reservas_invalidas.json
    ${payload}    Set Variable    ${json["reserva_com_valor_numerico_invalido"]}
    POST Endpoint /booking

Editar Reserva Valida
    ${payload}    Criar Dados Reserva Valida
    Set Global Variable    ${payload}
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}   

Editar Reserva com Campos Nulos
    ${json}    Importar JSON    reservas_invalidas.json
    ${payload}    Set Variable    ${json["reserva_com_campos_faltando"]}
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}

Editar Reserva com Tipagem Incorreta
    ${json}    Importar JSON    reservas_invalidas.json
    ${payload}    Set Variable    ${json["reserva_com_tipagem_incorreta"]}
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}

Editar Reserva com Valor Numerico Invalido
    ${json}    Importar JSON    reservas_invalidas.json
    ${payload}    Set Variable    ${json["reserva_com_valor_numerico_invalido"]}
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}

Editar Reserva sem Autenticação
    ${payload}    Criar Dados Reserva Valida
    Set Global Variable    ${payload}
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${EMPTY}