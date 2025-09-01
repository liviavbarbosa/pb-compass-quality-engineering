*** Settings ***
Documentation    Keywords necessárias para executar os cenários de teste
Library          RequestsLibrary
Library    OperatingSystem
Resource         login_keywords.robot

*** Keywords ***
*** Variables ***
${URL_BASE}    https://restful-booker.herokuapp.com

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
    ${arquivo}     Get File    ${EXECDIR}/Sprint 06/Semana 11/Teste da API restful-booker com Robot Refatorado/resources/data/${nome_arquivo}
    ${data}        Evaluate    json.loads('''${arquivo}''')    json
    RETURN       ${data}