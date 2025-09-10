*** Settings ***
Documentation    Execução dos casos de teste do endpoint /login
Resource         ../keywords/login_keywords.robot
Resource         ../support/fixtures/dynamics.robot

Suite Setup    Criar Sessao

*** Test Cases ***
CT001: Login de usuário comum com credenciais válidas
    [Tags]    POST
    Pegar Dados Login Estatico Usuario Comum Valido
    POST Endpoint /login    
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "authorization"
    Validar se a Resposta Contem a Mensagem "Login realizado com sucesso"

CT001: Login de usuário administrador com credenciais válidas
    [Tags]    POST
    Pegar Dados Login Estatico Usuario Administrador Valido
    POST Endpoint /login    
    Validar Status Code    status_code=200
    Validar se a Resposta Contem "authorization"
    Validar se a Resposta Contem a Mensagem "Login realizado com sucesso"

CT002: Login de usuário não cadastrado
    [Tags]    POST
    Criar Dados Login Invalido
    POST Endpoint /login    
    Validar Status Code    status_code=401
    Validar se a Resposta nao Contem "authorization"
    Validar se a Resposta Contem a Mensagem "Email e/ou senha inválidos"