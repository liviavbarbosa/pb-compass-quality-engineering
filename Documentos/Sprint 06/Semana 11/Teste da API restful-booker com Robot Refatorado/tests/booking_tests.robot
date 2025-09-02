*** Settings ***
Documentation    Execução dos casos de teste do endpoint /booking
Resource         ../keywords/booking_keywords.robot

Suite Setup    Criar Sessao

*** Test Cases ***
Cenario 01: Criar reserva com sucesso
    [Tags]    POST
    Pegar Dados Reserva Dinamica Valida
    POST Endpoint /booking
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "bookingid"

Cenario 02: Editar reserva com sucesso
    [Tags]    PUT
    Pegar Dados Reserva Dinamica Valida
    Pegar Dados Reserva Dinamica Valida
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}
    Validar Status Code    status_code=200

Cenario 03: Editar parcialmente reserva com sucesso
    [Tags]    PATCH
    Pegar Dados Reserva Dinamica Valida
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}    preco_reserva=7000    deposito_pago=true
    Validar Status Code    status_code=200

Cenario 04: Buscar ids de reservas com sucesso
    [Tags]    GET
    GET Endpoint /booking
    Validar Status Code    status_code=200

Cenario 05: Buscar reserva com sucesso
    [Tags]    GET
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    GET Endpoint /booking/id    ${ID_RESERVA}
    Validar Status Code    status_code=200

Cenario 06: Excluir reserva com sucesso
    [Tags]    DELETE
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    DELETE Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}
    Validar Status Code    status_code=201

Cenario 07: Criar reserva com campos nulos
    [Tags]    POST
    Pegar Dados Reserva Estatica com Campos Nulos
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 08: Criar reserva com campos com tipagem errada
    [Tags]    POST
    Pegar Dados Reserva Estatica com Tipagem Incorreta 
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 09: Criar reserva com campos com valores numéricos inválidos
    [Tags]    POST
    Pegar Dados Reserva Estatica com Valor Numerico Invalido 
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 10: Editar reserva com campos nulos
    [Tags]    PUT
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    Pegar Dados Reserva Estatica com Campos Nulos
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}
    Validar Status Code    status_code=400

Cenario 11: Editar reserva com campos com tipagem errada
    [Tags]    PUT
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    Pegar Dados Reserva Estatica com Tipagem Incorreta
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}
    Validar Status Code    status_code=400

Cenario 12: Editar reserva com campos com valores numéricos inválidos
    [Tags]    PUT
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    Pegar Dados Reserva Estatica com Valor Numerico Invalido
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}
    Validar Status Code    status_code=400

Cenario 13: Editar reserva sem autenticação
    [Tags]    PUT
    Pegar Dados Reserva Dinamica Valida
    PUT Endpoint /booking/id    ${ID_RESERVA}    ${EMPTY}
    Validar Status Code    status_code=403

Cenario 14: Editar parcialmente reserva com campos nulos
    [Tags]    PATCH
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}    nome_cliente=${EMPTY}
    Validar Status Code    status_code=400

Cenario 15: Editar parcialmente reserva com campos com tipagem errada
    [Tags]    PATCH
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}    nome_cliente=125
    Validar Status Code    status_code=400

Cenario 16: Editar parcialmente reserva sem autenticação
    [Tags]    PATCH
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${EMPTY}    nome_cliente=Livia
    Validar Status Code    status_code=403

Cenario 17: Excluir reserva sem autenticação
    [Tags]    DELETE
    DELETE Endpoint /booking/id    ${ID_RESERVA}    ${EMPTY}
    Validar Status Code    status_code=403

Cenario 18: Criar reserva com datas inválidas (checkout antes do checkin)
    [Tags]    POST
    Pegar Dados Reserva Estatica com Datas Invalidas
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 19: Criar reserva com formato de data inválido
    [Tags]    POST
    Pegar Dados Reserva Estatica com Formato Data Invalido
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 20: Criar reserva sem campo bookingdates obrigatório
    [Tags]    POST
    Pegar Dados Reserva Estatica sem Bookingdates
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 21: Criar reserva com campos extras não permitidos
    [Tags]    POST
    Pegar Dados Reserva Estatica com Campos Extras
    POST Endpoint /booking
    Validar Status Code    status_code=200

Cenario 22: Criar reserva com strings muito longas
    [Tags]    POST
    Pegar Dados Reserva Estatica com Strings Muito Longas
    POST Endpoint /booking
    Validar Status Code    status_code=400

Cenario 23: Criar reserva com preço zero
    [Tags]    POST
    Pegar Dados Reserva Estatica com Preco Zero
    POST Endpoint /booking
    Validar Status Code    status_code=200

Cenario 24: Buscar reserva inexistente
    [Tags]    GET
    GET Endpoint /booking/id    99999
    Validar Status Code    status_code=404

Cenario 25: Editar reserva inexistente
    [Tags]    PUT
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    Pegar Dados Reserva Dinamica Valida
    PUT Endpoint /booking/id    99999    ${TOKEN}
    Validar Status Code    status_code=405

Cenario 26: Excluir reserva inexistente
    [Tags]    DELETE
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth
    DELETE Endpoint /booking/id    99999    ${TOKEN}
    Validar Status Code    status_code=405