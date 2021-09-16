*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Login to webite
    [Arguments]     ${Link}    ${ChosenBrowser}
    log    Starting test
    open browser    ${Link}    ${ChosenBrowser}
    maximize browser window

Close Browser Windows
    log    Test is finished
    close browser

Login to Website
    [Arguments]    ${UserName}    ${UserPass}
    input text      id:user-name    ${UserName}
    input text      xpath://*[@id="password"]    ${UserPass}
    click button    name:login-button


Return Value Kwd
    ${ProductDescriptiom}    get text    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    [Return]  ${ProductDescriptiom}
