*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste
Library          RequestsLibrary
Library          OperatingSystem
Library          JSONLibrary
Library          Collections
Resource         ../../keywords/login_keywords.robot
Resource         ../../support/variables/serverest_variables.robot

*** Keywords ***
Criar Sessao
    Create Session    serverest    ${URL_BASE}

Importar JSON 
    [Arguments]    ${nome_arquivo}
    ${data}        Load Json From File    ${EXECDIR}/Documentos/Sprint 06/Semana 12/Challenge 03/Testes Automatizados/support/fixtures/static/${nome_arquivo}
    RETURN       ${data}

Validar Status Code 
    [Arguments]                    ${status_code}
    Should Be True    ${response.status_code}==${status_code}
    
Validar se a Resposta Contem "${palavra}"
    Should Contain    ${response.json()}    ${palavra}

Validar se a Resposta nao Contem "${palavra}"
    Should Not Contain    ${response.json()}    ${palavra}

Validar se a Resposta Contem a Mensagem "${mensagem}"
    Should Contain    ${response.json()["message"]}     ${mensagem}