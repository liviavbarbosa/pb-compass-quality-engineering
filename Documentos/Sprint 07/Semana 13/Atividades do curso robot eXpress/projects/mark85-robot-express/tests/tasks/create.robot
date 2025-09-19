*** Settings ***
Documentation    Cenários de cadastros de tarefas
Library          JSONLibrary
Resource         ../../resources/base.resource

*** Test Cases ***
Deve permitir o cadastro de uma nova tarefa
    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/tasks.json    
    ...        encoding=utf-8