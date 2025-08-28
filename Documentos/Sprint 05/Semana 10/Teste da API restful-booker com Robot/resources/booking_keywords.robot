*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste do Endpoint /booking
Library          RequestsLibrary
Resource         base_keywords.robot
Resource         login_keywords.robot

*** Keywords ***
POST Endpoint /booking
    [Arguments]    ${nome_cliente}    ${sobrenome_cliente}    ${preco_reserva}    ${deposito_pago}    ${checkin}    ${checkout}    ${necessidades_adicionais}
    
    &{datas_reserva}    Create Dictionary    checkin=${checkin}    checkout=${checkout}

    &{payload}    Create Dictionary    
    ...           firstname=${nome_cliente}
    ...           lastname=${sobrenome_cliente}    
    ...           totalprice=${preco_reserva}
    ...           depositpaid=${deposito_pago}
    ...           bookingdates=&{datas_reserva}
    ...           additionalneeds=${necessidades_adicionais}      

    &{header}    Create Dictionary    Content-Type=application/json
    ...           Accept=application/json

    ${response}    POST On Session    restful-booker    /booking    json=&{payload}    
    Set Global Variable    ${ID_RESERVA}    ${response.json()["bookingid"]}
    Set Global Variable    ${response}
    Set Global Variable    &{payload}

PUT Endpoint /booking/id
    [Arguments]    ${nome_cliente}    ${sobrenome_cliente}    ${preco_reserva}    ${deposito_pago}    ${checkin}    ${checkout}    ${necessidades_adicionais}
    
    &{datas_reserva}    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    
    &{payload}    Create Dictionary    
    ...           firstname=${nome_cliente}
    ...           lastname=${sobrenome_cliente}    
    ...           totalprice=${preco_reserva}
    ...           depositpaid=${deposito_pago}
    ...           bookingdates=&{datas_reserva}
    ...           additionalneeds=${necessidades_adicionais}

    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${TOKEN}

    ${response}    PUT On Session    restful-booker    /booking/${ID_RESERVA}    json=&{payload}    headers=${header}
    Set Global Variable    ${response}

PATCH Endpoint /booking/id
    [Arguments]    &{dados_modificar}
    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${TOKEN}

    ${response}    PATCH On Session    restful-booker    /booking/${ID_RESERVA}    json=&{dados_modificar}    headers=${header}
    Set Global Variable    ${response}

GET Endpoint /booking
    ${response}    GET On Session    restful-booker    /booking
    Set Global Variable    ${response}

GET Endpoint /booking/id
    ${response}    GET On Session    restful-booker    /booking/${ID_RESERVA}
    Set Global Variable    ${response}

DELETE Endpoint /booking/id
    &{header}    Create Dictionary
    ...           Content-Type=application/json
    ...           Accept=application/json
    ...           Cookie=token=${TOKEN}

    ${response}    DELETE On Session    restful-booker    /booking/${ID_RESERVA}    headers=${header}
    Set Global Variable    ${response}