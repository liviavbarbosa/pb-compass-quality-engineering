*** Settings ***
Documentation    Ações comuns dos cenários de teste

Library          libs/database.py
Library          Browser
Library          FakerLibrary

Resource         env.resource
Resource         pages/components/Header.resource
Resource         pages/components/Alert.resource
Resource         pages/components/Notice.resource
Resource         pages/SignupPage.resource
Resource         pages/LoginPage.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page       ${BASE_URL}

Short password
    [Arguments]    ${short_password}
    ${name}        FakerLibrary.Name
    ${user}        Create Dictionary    
    ...            name=${name}
    ...            email=liviateste@gmail.com
    ...            password=${short_password}
    Go to signup page
    Submit signup form           ${user}   
    Alert should be              Informe uma senha com pelo menos 6 digitos