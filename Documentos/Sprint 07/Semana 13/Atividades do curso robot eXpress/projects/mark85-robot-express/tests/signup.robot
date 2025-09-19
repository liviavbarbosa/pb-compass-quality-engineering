*** Settings ***
Documentation    Cenário de testes do cadastro de usuários
Resource         ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve permitir o cadastro um novo usuário válido
    ${name}                     FakerLibrary.Name
    ${password}                 FakerLibrary.Password

    ${user}    Create Dictionary    
    ...        name=${name}
    ...        email=anacarvalho@gmail.com
    ...        password=${password}

    Remove user from database    ${user}[email]

    Go to signup Page
    Submit signup form    ${user}
    Notice should be     Boas vindas ao Mark85, o seu gerenciador de tarefas.


Não deve permitir o cadastro com senha menor do que 6 digitos
    @{password_list}    Create List    1    12    123    1234    12345
    FOR    ${password}    IN    @{password_list}
        Short Password    ${password}
    END


Não deve permitir o cadastro com email duplicado
    ${name}                     FakerLibrary.Name
    ${password}                 FakerLibrary.Password

    ${user}    Create Dictionary    
    ...        name=${name}
    ...        email=anacarvalho@gmail.com
    ...        password=${password}

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Go to signup Page
    Submit signup form    ${user}
    Notice should be     Oops! Já existe uma conta com o e-mail informado.


Deve permitir o cadastro com campos obrigatórios vazios
    ${user}    Create Dictionary    
    ...        name=${EMPTY}
    ...        email=${EMPTY}
    ...        password=${EMPTY}

    Go to signup Page
    Submit signup form    ${user}
    Alert should be       Informe seu nome completo
    Alert should be       Informe seu e-email
    Alert should be       Informe uma senha com pelo menos 6 digitos


Deve permitir o cadastro com e-mail com formatação inválida
    ${name}                     FakerLibrary.Name
    ${password}                 FakerLibrary.Password

    ${user}    Create Dictionary    
    ...        name=${name}
    ...        email=anacarvalho.com.br
    ...        password=${password}

    Go to signup Page
    Submit signup form    ${user}
    Alert should be       Digite um e-mail válido