*** Settings ***
Documentation        Suite de testes da home page

Library        Browser

*** Test Cases ***
Home page de estar online
    New Browser    browser=chromium    headless=False
    New Page    https://walkdog.vercel.app

    Get Text    h1    equal    Cuidado e diversão em cada passo
    
    Take Screenshot