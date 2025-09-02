*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /booking
Library          RequestsLibrary
Resource         ../support/common/common.robot
Resource         ../support/fixtures/dynamics.robot
Resource         login_keywords.robot

*** Keywords ***
POST Endpoint /booking
    &{header}    Create Dictionary    Content-Type=application/json
    ...           Accept=application/json

    ${response}    POST On Session    restful-booker    /booking    json=${payload}    expected_status=any    
    Set Global Variable    ${ID_RESERVA}    ${response.json()["bookingid"]}
    Set Global Variable    ${response}

PUT Endpoint /booking/id
    [Arguments]    ${id_reserva}    ${token}
    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${token}

    ${response}    PUT On Session    restful-booker    /booking/${id_reserva}    json=${payload}   headers=${header}    expected_status=any
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

Pegar Dados Reserva Dinamica Valida
    ${payload}    Criar Dados Reserva Valida
    Set Global Variable    ${payload}

Pegar Dados Reserva Estatica com Campos Nulos
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_campos_faltando"]}

Pegar Dados Reserva Estatica com Tipagem Incorreta 
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_tipagem_incorreta"]}

Pegar Dados Reserva Estatica com Valor Numerico Invalido 
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_valor_numerico_invalido"]}

Pegar Dados Reserva Estatica com Datas Invalidas
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_datas_invalidas"]}

Pegar Dados Reserva Estatica com Formato Data Invalido
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_formato_data_invalido"]}

Pegar Dados Reserva Estatica sem Bookingdates
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_sem_bookingdates"]}

Pegar Dados Reserva Estatica com Campos Extras
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_campos_extras"]}

Pegar Dados Reserva Estatica com Strings Muito Longas
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_strings_muito_longas"]}

Pegar Dados Reserva Estatica com Preco Zero
    ${json}    Importar JSON    reservas_invalidas.json
    Set Global Variable    ${payload}    ${json["reserva_com_preco_zero"]}