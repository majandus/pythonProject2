*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${WebsiteLink}    ${BrowserName}
    log    Starting test with ${WebsiteLink} and ${BrowserName} browser
    open browser    ${WebsiteLink}    ${BrowserName}
    maximize browser window
    ${Title}    get title
    log    ${Title}


Close browser window
    log    Finishing testing
    close browser

Login Attempt
    [Arguments]      ${Login}    ${Pass}
    input text    id:user-name    ${login}
    input text    id:password    ${Pass}
    click button    id:login-button
    page should not contain    xpath://*[@id="login_button_container"]/div/form/div[3]/h3

Logout attempt
    click button    id:react-burger-menu-btn
    wait until element is visible     id:logout_sidebar_link
    click link      id:logout_sidebar_link

Pick Product
  [Arguments]    ${ProductNameId}    ${AddProductId}
  ${ProductName}    get text    ${ProductNameId}
  log    ${ProductName}
  click button    ${AddProductId}

Change Sorting
    [Arguments]    ${SortingValue}
    select from list by value    xpath://*[@id="header_container"]/div[2]/div[2]/span/select   ${SortingValue}


Checkout Shopping Cart
  [Arguments]    ${Name}    ${Surname}    ${ZIP}    ${Count}    ${CheckSum}

  element should contain    xpath://*[@id="shopping_cart_container"]/a/span    ${Count}
  click link   xpath: //*[@id="shopping_cart_container"]/a
  set screenshot directory    Screenshots
  capture element screenshot    xpath://*[@id="cart_contents_container"]/div
  click button    id:checkout
  input text    id:first-name    ${Name}
  input text    id:last-name     ${Surname}
  input text    id:postal-code    ${ZIP}
  click button    id:continue
  capture element screenshot    xpath://*[@id="checkout_summary_container"]/div/div[2]
  element should contain    xpath://*[@id="checkout_summary_container"]/div/div[2]    ${CheckSum}
  click button    id:finish
    click button    id:back-to-products