*** Settings ***
Documentation    Execução dos casos de teste do endpoint /ping
Resource         ../resources/ping_keywords.robot

*** Test Cases ***
Cenario 01: Verificar se API está ativa e funcionando
    [Tags]    GET
    Criar Sessao
    GET Endpoint /ping
    Validar Status Code    status_code=201