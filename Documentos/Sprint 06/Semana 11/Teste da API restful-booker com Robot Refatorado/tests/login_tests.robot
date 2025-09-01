*** Settings ***
Documentation    Execução dos casos de teste do endpoint /auth
Resource         ../resources/login_keywords.robot

*** Test Cases ***
Cenario 01: Fazer login com sucesso
    [Tags]    POST
    Criar Sessao
    Realizar Login com Credenciais Validas
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "token"

Cenario 02: Fazer login com username vazio
    [Tags]    POST
    Criar Sessao
    Realizar Login com Username Vazio
    Validar Status Code    status_code=400

Cenario 03: Fazer login com senha vazia
    [Tags]    POST
    Criar Sessao
    Realizar Login com Senha Vazia
    Validar Status Code    status_code=400

Cenario 04: Fazer login com username invalido
    [Tags]    POST
    Criar Sessao
    Realizar Login com Username Invalido
    Validar Status Code    status_code=400

Cenario 05: Fazer login com senha incorreta
    [Tags]    POST
    Criar Sessao
    Realizar Login com Senha Incorreta
    Validar Status Code    status_code=400