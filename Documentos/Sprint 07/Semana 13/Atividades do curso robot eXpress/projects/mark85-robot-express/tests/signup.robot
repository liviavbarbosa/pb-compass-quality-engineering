*** Settings ***
Documentation    Cenário de testes do cadastro de usuários
Library          FakerLibrary
Resource         ../resources/base.robot

*** Test Cases ***
Deve poder cadastrar um novo usuário válido
    ${name}                     FakerLibrary.Name
    ${email}    Set Variable    liviateste@gmail.com
    ${password}                 FakerLibrary.Password

    Remove user from database    ${email}

    Start Session

    Go To    http://localhost:3000/signup

    # Checkpoint -> pontos de validação para o testador saber se está passando pelo fluxo correto
    Wait For Elements State    xpath=//h1    visible    5
    Get Text                   xpath=//h1    equal      Faça seu cadastro

    Fill Text    id=name        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    Click        id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com email duplicado
    ${name}                     FakerLibrary.Name
    ${email}    Set Variable    liviateste2@gmail.com
    ${password}                 FakerLibrary.Password

    Remove user from database    ${email}
    Insert user from database    ${name}    ${email}    ${password}

    Start Session

    Go To    http://localhost:3000/signup

    Wait For Elements State    xpath=//h1    visible    5
    Get Text                   xpath=//h1    equal      Faça seu cadastro

    Fill Text    id=name        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    Click        id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Oops! Já existe uma conta com o e-mail informado.