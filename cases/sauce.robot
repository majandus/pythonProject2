*** Settings ***
Library    SeleniumLibrary
Resource    ..//resources/resources2.robot



*** Variables ***
# Browser Settings
${URL}     http://www.saucedemo.com
${Browser}    Chrome


# Login Info
${StandardUser}    standard_user
${LockedOutUser}    locked_out_user
${ProblemUser}    problem_user
${PermomanceGlitchUser}    perfomance_glitch_user

${Password}    secret_sauce

*** Test Cases ***
Standard User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${StandardUser}    ${Password}
    pick product    xpath://*[@id="item_4_title_link"]/div    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
    sleep    3
    Change Sorting    hilo
    sleep    3
    Checkout Shopping Cart    R   T    !234    1    32.39
    Logout attempt
#32.39

Locked User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${LockedOutUser}    ${Password}
    pick product    xpath://*[@id="item_4_title_link"]/div    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
    sleep    3
    Change Sorting    hilo
    sleep    3
    Checkout Shopping Cart    R   T    !234    1    32.39
    Logout attempt
#32.39

Problem User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${ProblemUser}    ${Password}
    pick product    xpath://*[@id="item_4_title_link"]/div    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
    sleep    3
    Change Sorting    hilo
    sleep    3
    Checkout Shopping Cart    R   T    !234    1    32.39
    Logout attempt
#32.39

Performance User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${PermomanceGlitchUser}    ${Password}
    pick product    xpath://*[@id="item_4_title_link"]/div    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
    sleep    3
    Change Sorting    hilo
    sleep    3
    Checkout Shopping Cart    R   T    !234    1    32.39
    Logout attempt
#32.39