*** Settings ***
Documentation    Execução dos casos de teste do endpoint /usuarios
Resource         ../keywords/usuarios_keywords.robot
Resource         ../support/fixtures/dynamics.robot

Suite Setup    Criar Sessao

*** Test Cases ***
CT005: Cadastro de usuário com dados válidos
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code    status_code=201
    Validar se a Resposta Contem "_id"
    Validar se a Resposta Contem a Mensagem "Cadastro realizado com sucesso"

CT007: Cadastro de usuário com e-mail já utilizado por outro usuário
    Pegar Dados Usuario com Email ja Utilizado Estatico
    POST Endpoint /usuarios
    Validar Status Code    status_code=400
    Validar se a Resposta nao Contem "_id"
    Validar se a Resposta Contem a Mensagem "Este email já está sendo usado"