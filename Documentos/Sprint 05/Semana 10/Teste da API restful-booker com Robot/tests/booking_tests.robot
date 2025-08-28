*** Settings ***
Documentation    Execução dos casos de teste do endpoint /booking
Resource         ../resources/booking_keywords.robot

*** Test Cases ***
Cenario 01: Criar reserva com sucesso
    [Tags]    POST
    Criar Sessao
    POST Endpoint /booking
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "bookingid"

Cenario 02: Editar reserva com sucesso
    [Tags]    PUT
    Criar Sessao
    POST Endpoint /auth
    PUT Endpoint /booking/id
    Validar Status Code    status_code=200

Cenario 03: Editar parcialmente reserva com sucesso
    [Tags]    PATCH
    Criar Sessao
    POST Endpoint /auth
    PATCH Endpoint /booking/id
    Validar Status Code    status_code=200

Cenario 04: Buscar ids de reservas com sucesso
    [Tags]    GET
    Criar Sessao
    GET Endpoint /booking
    Validar Status Code    status_code=200

Cenario 05: Buscar reserva com sucesso
    [Tags]    GET
    Criar Sessao
    POST Endpoint /auth
    GET Endpoint /booking/id
    Validar Status Code    status_code=200

Cenario 06: Excluir reserva com sucesso
    [Tags]    DELETE
    Criar Sessao
    POST Endpoint /auth
    DELETE Endpoint /booking/id
    Validar Status Code    status_code=201