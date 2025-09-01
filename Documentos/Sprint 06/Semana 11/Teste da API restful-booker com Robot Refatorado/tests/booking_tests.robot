*** Settings ***
Documentation    Execução dos casos de teste do endpoint /booking
Resource         ../resources/booking_keywords.robot

*** Test Cases ***
Cenario 01: Criar reserva com sucesso
    [Tags]    POST
    Criar Sessao
    Cadastrar Reserva Valida
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "bookingid"

Cenario 02: Editar reserva com sucesso
    [Tags]    PUT
    Criar Sessao
    Realizar Login com Credenciais Validas
    Editar Reserva Valida
    Validar Status Code    status_code=200

Cenario 03: Editar parcialmente reserva com sucesso
    [Tags]    PATCH
    Criar Sessao
    Realizar Login com Credenciais Validas
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}    preco_reserva=7000    deposito_pago=true
    Validar Status Code    status_code=200

Cenario 04: Buscar ids de reservas com sucesso
    [Tags]    GET
    Criar Sessao
    GET Endpoint /booking
    Validar Status Code    status_code=200

Cenario 05: Buscar reserva com sucesso
    [Tags]    GET
    Criar Sessao
    Realizar Login com Credenciais Validas
    GET Endpoint /booking/id    ${ID_RESERVA}
    Validar Status Code    status_code=200

Cenario 06: Excluir reserva com sucesso
    [Tags]    DELETE
    Criar Sessao
    Realizar Login com Credenciais Validas
    DELETE Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}
    Validar Status Code    status_code=201

Cenario 07: Criar reserva com campos nulos
    [Tags]    POST
    Criar Sessao
    Cadastrar Reserva com Campos Nulos
    Validar Status Code    status_code=400

Cenario 08: Criar reserva com campos com tipagem errada
    [Tags]    POST
    Criar Sessao
    Cadastrar Reserva com Tipagem Incorreta
    Validar Status Code    status_code=400

Cenario 09: Criar reserva com campos com valores numéricos inválidos
    [Tags]    POST
    Criar Sessao
    Cadastrar Reserva com Valor Numerico Invalido
    Validar Status Code    status_code=400

Cenario 10: Editar reserva com campos nulos
    [Tags]    PUT
    Criar Sessao
    Realizar Login com Credenciais Validas
    Editar Reserva com Campos Nulos
    Validar Status Code    status_code=400

Cenario 11: Editar reserva com campos com tipagem errada
    [Tags]    PUT
    Criar Sessao
    Realizar Login com Credenciais Validas
    Editar Reserva com Tipagem Incorreta
    Validar Status Code    status_code=400

Cenario 12: Editar reserva com campos com valores numéricos inválidos
    [Tags]    PUT
    Criar Sessao
    Realizar Login com Credenciais Validas
    Editar Reserva com Valor Numerico Invalido
    Validar Status Code    status_code=400

Cenario 13: Editar reserva sem autenticação
    [Tags]    PUT
    Criar Sessao
    Editar Reserva sem Autenticação
    Validar Status Code    status_code=403

Cenario 14: Editar parcialmente reserva com campos nulos
    [Tags]    PATCH
    Criar Sessao
    Realizar Login com Credenciais Validas
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}    nome_cliente=${EMPTY}
    Validar Status Code    status_code=400

Cenario 15: Editar parcialmente reserva com campos com tipagem errada
    [Tags]    PATCH
    Criar Sessao
    Realizar Login com Credenciais Validas
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${TOKEN}    nome_cliente=125
    Validar Status Code    status_code=400

Cenario 16: Editar parcialmente reserva sem autenticação
    [Tags]    PATCH
    Criar Sessao
    PATCH Endpoint /booking/id    ${ID_RESERVA}    ${EMPTY}    nome_cliente=Livia
    Validar Status Code    status_code=403

Cenario 17: Excluir reserva sem autenticação
    [Tags]    DELETE
    Criar Sessao
    DELETE Endpoint /booking/id    ${ID_RESERVA}    ${EMPTY}
    Validar Status Code    status_code=403