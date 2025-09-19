*** Settings ***
Documentation    Cenários de teste de remoção de tarefas
Resource         ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve permitir remover uma tarefa indesejada
    ${data}    Get fixture    tasks    delete

    Reset user                    ${data}[user]
    Create a new task from API    ${data}
    Do login                      ${data}[user]

    Remove task                   ${data}[task][name]
    Task should not exist         ${data}[task][name]