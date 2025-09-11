*** Settings ***
Documentation    Keywords e variáveis para a geração de inputs utilizados nos cenários de teste
Library          FakerLibrary
Library          String

*** Keywords ***
Criar Dados Login Invalido
    ${email}          FakerLibrary.Email
    ${password}       FakerLibrary.Password

    ${payload}         Create Dictionary    
    ...                email=${email}
    ...                password=${password}
    Set Global Variable    ${payload}    

Criar Dados Usuario Valido
    ${nome}             FakerLibrary.First Name
    ${email}            FakerLibrary.Email
    ${password}         FakerLibrary.Password
    ${administrador}    FakerLibrary.Boolean

    ${administrador}    Convert To String    ${administrador}

    ${payload}         Create Dictionary    
    ...                nome=${nome}
    ...                email=${email}
    ...                password=${password}
    ...                administrador=${administrador.lower()}
    Set Global Variable    ${payload}

Criar Dados Produto Valido
    ${nome}             FakerLibrary.Word
    ${preco}            FakerLibrary.Random Int
    ${descricao}        FakerLibrary.Text
    ${quantidade}       FakerLibrary.Random Int

    ${payload}         Create Dictionary    
    ...                nome=${nome}
    ...                preco=${preco}
    ...                descricao=${descricao}
    ...                quantidade=${quantidade}
    Set Global Variable    ${payload}

Gerar ID Aleatorio
    ${id_aleatorio}    Generate Random String    16
    RETURN    ${id_aleatorio}    