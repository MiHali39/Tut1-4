*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Sign-In.EMAIL_FIELD} =    id=ap_email
${Sign-In.SIGN-IN_ELEMENT} =    //*[@id="authportal-main-section"]/div[2]/div/div[1]/form/div/div/div/h1

*** Keywords ***
Page Should Contain Email Field
    page should contain element    ${Sign-In.EMAIL_FIELD}

Page Should Contain Sign-In Text
    element text should be    ${Sign-In.SIGN-IN_ELEMENT}    Sign-In