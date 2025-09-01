*** Settings ***
Documentation    Keywords e variáveis para a geração de inputs utilizados nos casos de teste
Library          FakerLibrary

*** Keywords ***
Criar Dados Reserva Valida
    ${firstname}          FakerLibrary.First Name
    ${lastname}           FakerLibrary.Last Name
    ${totalprice}         FakerLibrary.Random Int
    ${depositpaid}        FakerLibrary.Boolean
    ${checkin}            FakerLibrary.Date 
    ${checkout}           FakerLibrary.Date
    ${additionalneeds}    FakerLibrary.Word

    &{bookingdates}    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    &{payload}         Create Dictionary    
    ...                firstname=${firstname}
    ...                lastname=${lastname}
    ...                totalprice=${totalprice}
    ...                depositpaid=${depositpaid}
    ...                bookingdates=${bookingdates}
    ...                additionalneeds=${additionalneeds}
    RETURN    &{payload}