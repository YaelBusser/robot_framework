*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}        chrome

*** Keywords ***
I am on the OrangeHRM login page
    Open Browser  ${URL}  ${BROWSER}

I log in with username "${username}" and password "${password}"
    Input Text  name=username  ${username}
    Input Text  name=password  ${password}
    Click Button  css=.orangehrm-login-button
    Sleep  10s
