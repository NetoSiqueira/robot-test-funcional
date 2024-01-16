*** Settings ***
Documentation        Ações, Steps e elementos da funcionalidade de cadastro

Library        Browser

*** Keywords ***

Go to signup page
    
    Click        css=a[href="/signup"]

    Wait For Elements State    form > h1    visible        5000
    Get Text    form > h1    equal    Faça seu cadastro
    
Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text        css=input[name=name]                    ${dog_walker}[name]
    Fill Text        css=input[name=email]                   ${dog_walker}[email]
    Fill Text        css=input[name=cpf]                     ${dog_walker}[cpf]
    Fill Text        css=input[name=cep]                     ${dog_walker}[cep]
    Click            css=input[value="Buscar CEP"]

    Get Property    css=input[name=addressStreet]          value    equal    ${dog_walker}[rua]
    Get Property    css=input[name=addressDistrict]        value    equal    ${dog_walker}[bairro]
    Get Property    css=input[name=addressCityUf]          value    equal    ${dog_walker}[cidade]

    Fill Text        css=input[name=addressNumber]           ${dog_walker}[numero]
    Fill Text        css=input[name=addressDetails]          ${dog_walker}[complemento]
    
    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh] 
    Take Screenshot    fullPage=True

Additional service Click
    [Arguments]    ${service}
    Click    xpath=//span[text()="${service}"]/..
    Take Screenshot    fullPage=True
Submit signup form
    Click            css=.button-register
    
Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State       css=#swal2-html-container    visible    3
    Get Text                      css=#swal2-html-container    equal    ${expected_text}

Alert should be
    [Arguments]    ${resultado}
    Get Text        css=div:nth-child(2) > span.alert-error    equal    ${resultado}

Alert mandatory text
    [Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${number}    ${cnh}
    Get Text    css=.alert-error >> text=Informe o seu nome completo                   equal    ${name}
    Get Text    css=.alert-error >> text=Informe o seu melhor email                    equal    ${email}
    Get Text    css=.alert-error >> text=Informe o seu CPF                             equal    ${cpf}
    Get Text    css=.alert-error >> text=Informe o seu CEP                             equal    ${cep}
    Get Text    css=.alert-error >> text=Informe um número maior que zero              equal    ${number}
    Get Text    css=.alert-error >> text=Adcione um documento com foto (RG ou CHN)     equal    ${cnh}
    

    