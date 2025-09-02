*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste
Library          RequestsLibrary
Library          OperatingSystem
Library          JSONLibrary
Resource         ../variables/restful-booker_variables.robot
Resource         ../../keywords/login_keywords.robot

*** Keywords ***
Criar Sessao
    Create Session    restful-booker    ${URL_BASE}

Validar Status Code 
    [Arguments]                    ${status_code}
    Should Be True    ${response.status_code}==${status_code}

Validar se a Resposta Contem "${palavra}"
    Should Contain    ${response.json()}    ${palavra}

Importar JSON 
    [Arguments]    ${nome_arquivo}
    ${data}        Load Json From File    ${EXECDIR}/Documentos/Sprint 06/Semana 11/Teste da API restful-booker com Robot Refatorado/support/fixtures/static/${nome_arquivo}
    RETURN       ${data}