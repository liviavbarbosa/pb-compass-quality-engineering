*** Settings ***
Documentation    Elementos e ações da página de cadastro
Library          Browser
Resource         ../env.resource

*** Keywords ***
Go to signup Page
    Go To    ${BASE_URL}/signup
    # Checkpoint -> pontos de validação para o testador saber se está passando pelo fluxo correto
    Wait For Elements State    xpath=//h1    visible    5
    Get Text                   xpath=//h1    equal      Faça seu cadastro

Submit signup form 
    [Arguments]    ${user}
    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

    # Para achar o botão sem uma propriedade id, podemos fazer a combinação do CSS (button[type=submit]) com um recurso do robot (>> text=Cadastrar)
    # Click        button[type=submit] >> text=Cadastrar 
    Click        id=buttonSignup 