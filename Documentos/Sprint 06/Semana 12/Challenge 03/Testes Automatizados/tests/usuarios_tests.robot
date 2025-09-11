*** Settings ***
Documentation    Execução dos casos de teste do endpoint /usuarios
Resource         ../keywords/usuarios_keywords.robot
Resource         ../support/fixtures/dynamics.robot
Resource         ../keywords/login_keywords.robot

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

CT013: Edição de usuário com dados válidos
    Criar Dados Usuario Valido
    PUT Endpoint /usuarios/id    ${ID_USUARIO}
    Validar Status Code    status_code=200
    Validar se a Resposta Contem a Mensagem "Registro alterado com sucesso"

CT015: Edição de usuário com e-mail já utilizado
    Pegar Dados Usuario com Email ja Utilizado Estatico
    PUT Endpoint /usuarios/id    ${ID_USUARIO}
    Validar Status Code    status_code=400
    Validar se a Resposta Contem a Mensagem "Este email já está sendo usado"

CT025: Busca de usuários como usuário não administrador
    Pegar Dados Login Estatico Usuario Administrador Valido
    POST Endpoint /login
    GET Endpoint /usuarios    ${TOKEN}
    Validar Status Code    status_code=403
    Validar se a Resposta Contem a Mensagem "Rota exclusiva para administradores"

CT029: Exclusão de usuário com parâmetro de _id válido
    DELETE Endpoint /usuarios/id    ${ID_USUARIO}
    Validar Status Code    status_code=200
    Validar se a Resposta Contem a Mensagem "Registro excluído com sucesso"

CT030: Exclusão de usuário com carrinho
    DELETE Endpoint /usuarios/id    0uxuPY0cbmQhpEz1
    Validar Status Code    status_code=400
    Validar se a Resposta Contem a Mensagem "Não é permitido excluir usuário com carrinho cadastrado"

CT072: Edição de usuário não cadastrado com e-mail já existente
    Pegar Dados Usuario com Email ja Utilizado Estatico
    PUT Endpoint /usuarios/id    Gerar ID Aleatorio
    Validar Status Code    status_code=400
    Validar se a Resposta nao Contem "_id"
    Validar se a Resposta Contem a Mensagem "Este email já está sendo usado"