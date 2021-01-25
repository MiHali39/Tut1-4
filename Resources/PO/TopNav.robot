*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TopNav.SEARCH_BAR_TEXT_AREA} =   id=twotabsearchtextbox
${TopNav.SEARCH_BAR_RESULT} =    //*[@id="nav-search-submit-text"]/input

*** Keywords ***
Enter SearchTerm
    [Arguments]    ${search_text}
    input text    ${TopNav.SEARCH_BAR_TEXT_AREA}    ${search_text}

Click SearchButton
    click button    ${TopNav.SEARCH_BAR_RESULT}