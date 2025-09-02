*** Settings ***
Documentation    Execução dos casos de teste do endpoint /auth
Resource         ../keywords/login_keywords.robot

Suite Setup    Criar Sessao

*** Test Cases ***
Cenario 01: Fazer login com sucesso
    [Tags]    POST
    Pegar Dados Login Estatico Valido
    POST Endpoint /auth    
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "token"

Cenario 02: Fazer login com username vazio
    [Tags]    POST
    Pegar Dados Login Estatico com Username Vazio
    POST Endpoint /auth
    Validar Status Code    status_code=400

Cenario 03: Fazer login com senha vazia
    [Tags]    POST
    Pegar Dados Login Estatico com Senha Vazia
    POST Endpoint /auth
    Validar Status Code    status_code=400

Cenario 04: Fazer login com username invalido
    [Tags]    POST
    Pegar Dados Login Estatico com Username Invalido
    POST Endpoint /auth
    Validar Status Code    status_code=400

Cenario 05: Fazer login com senha incorreta
    [Tags]    POST
    Pegar Dados Login Estatico com Senha Incorreta
    POST Endpoint /auth
    Validar Status Code    status_code=400