*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot


*** Variables ***
${URL}    http://www.saucedemo.com
${Browser}    Chrome
${Password}    secret_sauce
${StdUser}    standard_user
${LckdUser}    locked_out_user
${PrUser}    problem_user
${PerGlUser}    performance_glitch_user


*** Test Cases ***
Standart User Test
    open browser   ${URL}    ${Browser}
    Login to Website    ${StdUser}     ${Password}
    sleep    5
    element should contain    xpath://*[@id="header_container"]/div[2]/span    PRODUCTS
    ${Title}=    get title
    log    ${Title}
    close browser windows



