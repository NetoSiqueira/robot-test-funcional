*** Settings ***
Documentation        Suite de testes, cadastro de dog walker

Resource        ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***

Deve poder cadastrar um novo dog walker
    [Tags]    smoke
    
    ${dog_walker}    Create Dictionary    
    ...    name=teste robot    
    ...    email=teste@teste.com    
    ...    cpf=00000014141   
    ...    cep=63905040    
    ...    numero=1000    
    ...    complemento=Apt 205    
    ...    rua=Rua Amadeu Ferreira de Sousa 
    ...    bairro=Baviera    
    ...    cidade=Quixadá/CE    
    ...    cnh=toretto.jpg

   
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    

Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv

    ${dog_walker}    Create Dictionary    
    ...    name=teste robot    
    ...    email=teste@teste.com    
    ...    cpf=000000141aa   
    ...    cep=63905040    
    ...    numero=1000    
    ...    complemento=Apt 205    
    ...    rua=Rua Amadeu Ferreira de Sousa 
    ...    bairro=Baviera    
    ...    cidade=Quixadá/CE    
    ...    cnh=toretto.jpg    


   
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido
    

Não deve cadastrar se os campos obrigatorios nao forem preenchidos
    [Tags]    required  
  
    Go to signup page
    Submit signup form
    Alert mandatory text    Informe o seu nome completo   
    ...     Informe o seu melhor email    
    ...    Informe o seu CPF   
    ...    Informe o seu CEP    
    ...    Informe um número maior que zero    
    ...    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]     aservice

    ${dog_walker}    Create Dictionary    
    ...    name=teste robot    
    ...    email=teste@teste.com    
    ...    cpf=00000014141   
    ...    cep=63905040    
    ...    numero=1000    
    ...    complemento=Apt 205    
    ...    rua=Rua Amadeu Ferreira de Sousa 
    ...    bairro=Baviera    
    ...    cidade=Quixadá/CE    
    ...    cnh=toretto.jpg

   
    Go to signup page
    Fill signup form    ${dog_walker}
    Additional service Click    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.   

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]     aservice_adestrar

    ${dog_walker}    Create Dictionary    
    ...    name=teste robot    
    ...    email=teste@teste.com    
    ...    cpf=00000014141   
    ...    cep=63905040    
    ...    numero=1000    
    ...    complemento=Apt 205    
    ...    rua=Rua Amadeu Ferreira de Sousa 
    ...    bairro=Baviera    
    ...    cidade=Quixadá/CE    
    ...    cnh=toretto.jpg

   
    Go to signup page
    Fill signup form    ${dog_walker}
    Additional service Click    Adestrar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato. 