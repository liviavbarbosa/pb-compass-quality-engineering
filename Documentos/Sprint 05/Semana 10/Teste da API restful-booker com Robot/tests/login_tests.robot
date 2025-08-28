*** Settings ***
Documentation    Execução dos casos de teste do endpoint /auth
Resource         ../resources/login_keywords.robot

*** Test Cases ***
Cenario 01: Fazer login com sucesso
    [Tags]    POST
    Criar Sessao
    POST Endpoint /auth
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "token"