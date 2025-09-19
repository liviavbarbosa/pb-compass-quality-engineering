*** Settings ***
Documentation    Cenários de cadastros de tarefas
Resource         ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve permitir o cadastro de uma nova tarefa
    ${data}    Get fixture    tasks    create

    Reset user                   ${data}[user]
    Do login                     ${data}[user]

    Go to task form
    Submit task form             ${data}[task]
    Task should be registered    ${data}[task][name]


Não deve permitir o cadastro de uma tarefa com nome duplicado
    ${data}    Get fixture    tasks    duplicate

    Reset user                    ${data}[user]
    Create a new task from API    ${data}
    Do login                      ${data}[user]

    Go to task form
    Submit task form              ${data}[task]

    Notice should be              Oops! Tarefa duplicada.


Não deve permitir o cadastro de uma nova tarefa quando atinge o limite de tags
    ${data}    Get fixture    tasks    tags_limit

    Reset user                   ${data}[user]
    Do login                     ${data}[user]

    Go to task form
    Submit task form             ${data}[task]

    Notice should be             Oops! Limite de tags atingido.