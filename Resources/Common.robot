*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Begin web test
    open browser    about:blank    ${BROWSER}
    maximize browser window

End web test
    close browser