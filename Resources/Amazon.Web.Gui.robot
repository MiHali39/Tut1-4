*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/TopNav.robot
Resource    ../Resources/PO/SearchResults.robot
Resource    ../Resources/PO/Product.robot
Resource    ../Resources/PO/Sign-In.robot

*** Keywords ***
Search for Products
    [Arguments]   ${search}
    LandingPage.Load
    LandingPage.Verify Page Loaded

    TopNav.Enter SearchTerm     ${search}
    TopNav.Click SearchButton
    SearchResults.Search Result Expectation   ${search}

Count results
    SearchResults.Count results

Select product from search results
    SearchResults.Click on Result   partial link:Black, 8.10 x 18.20 x 16.30 (CDJ2000NXS2)
    wait until page contains    Back to results

Verify pricing
    Product.Verify pricing

Add product to cart
    Product.Add product to cart
    Product.Wait for checkout pop-up

Begin checkout
    Product.Click checkout button
    Sign-In.Page Should contain Email Field
    Sign-In.Page Should Contain Sign-In Text