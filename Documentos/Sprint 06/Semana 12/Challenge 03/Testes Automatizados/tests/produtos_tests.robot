*** Settings ***
Documentation    Execução dos casos de teste do endpoint /produtos
Resource         ../keywords/produtos_keywords.robot
Resource         ../support/fixtures/dynamics.robot

Suite Setup    Criar Sessao

*** Test Cases ***
CT033: Cadastro de produto com dados válidos
    Pegar Dados Login Estatico Usuario Administrador Valido
    POST Endpoint /login
    Criar Dados Produto Valido
    POST Endpoint /produtos    ${TOKEN}
    Validar Status Code    status_code=201
    Validar se a Resposta Contem "_id"
    Validar se a Resposta Contem a Mensagem "Cadastro realizado com sucesso"

CT034: Cadastro de produto como usuário não autenticado
    Criar Dados Produto Valido
    POST Endpoint /produtos    ${EMPTY}
    Validar Status Code    status_code=401
    Validar se a Resposta nao Contem "_id"
    Validar se a Resposta Contem a Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

CT035: Cadastro de produto como usuário não administrador
    Pegar Dados Login Estatico Usuario Comum Valido
    POST Endpoint /login
    Criar Dados Produto Valido
    POST Endpoint /produtos    ${TOKEN}
    Validar Status Code    status_code=403
    Validar se a Resposta nao Contem "_id"
    Validar se a Resposta Contem a Mensagem "Rota exclusiva para administradores"

CT038: Edição de produto com dados válidos
    Pegar Dados Login Estatico Usuario Administrador Valido
    POST Endpoint /login
    Criar Dados Produto Valido
    PUT Endpoint /produtos/id    ${TOKEN}    ${ID_PRODUTO}
    Validar Status Code    status_code=200
    Validar se a Resposta Contem a Mensagem "Registro alterado com sucesso"

CT040: Edição de produto como usuário não autenticado
    Criar Dados Produto Valido
    PUT Endpoint /produtos/id    ${EMPTY}    ${ID_PRODUTO}
    Validar Status Code    status_code=401
    Validar se a Resposta Contem a Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

CT041: Edição de produto como usuário não administrador
    Pegar Dados Login Estatico Usuario Comum Valido
    POST Endpoint /login
    Criar Dados Produto Valido
    PUT Endpoint /produtos/id    ${TOKEN}    ${ID_PRODUTO}
    Validar Status Code    status_code=403
    Validar se a Resposta Contem a Mensagem "Rota exclusiva para administradores"

CT052: Exclusão de produto com parâmetro de _id válido
    Pegar Dados Login Estatico Usuario Administrador Valido
    POST Endpoint /login
    DELETE Endpoint /produtos/id    ${TOKEN}    ${ID_PRODUTO}
    Validar Status Code    status_code=200
    Validar se a Resposta Contem a Mensagem "Registro excluído com sucesso"

CT056: Exclusão de produto como usuário não autenticado
    DELETE Endpoint /produtos/id    ${EMPTY}    ${ID_PRODUTO}
    Validar Status Code    status_code=401
    Validar se a Resposta Contem a Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

CT057: Exclusão de produto como usuário não autenticado
    Pegar Dados Login Estatico Usuario Comum Valido
    POST Endpoint /login
    DELETE Endpoint /produtos/id    ${TOKEN}    ${ID_PRODUTO}
    Validar Status Code    status_code=403
    Validar se a Resposta Contem a Mensagem "Rota exclusiva para administradores"