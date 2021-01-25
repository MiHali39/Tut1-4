*** Settings ***
Documentation    Basic info about the suite
Library    Collections

Resource    ../Resources/Amazon.Web.Gui.robot
Resource    ../Resources/Common.robot


# robot -d results test/amazon.robot

Test Setup    Common.Begin web test
Test Teardown    Common.End web test

*** Variables ***
${BROWSER} =    chrome
${START_URL} =  https://www.amazon.com/
${SEARCH_TERM} =    cdj2000nxs2

#Small tests data
${GOOGLE_SITE} =    search
&{GOOGLE_URL}    search=https://www.google.nl    images=https://www.google.nl/imghp?hl=en&ogbl    translate=https://translate.google.nl/?hl=en&tab=iT    maps=https://www.google.nl/maps
@{GOOGLE_URL_LIST}    https://www.google.nl    https://www.google.nl/imghp?hl=en&ogbl    https://translate.google.nl/?hl=en&tab=iT    https://www.google.nl/maps

*** Test Cases ***
User must sign in to check out
    [Documentation]    Tut1-4 This is some basic info about this test
    [Tags]    Smoke
    Amazon.Web.Gui.Search for Products    ${SEARCH_TERM}
    Amazon.Web.Gui.Select product from search results
    Amazon.Web.Gui.Verify pricing
    Amazon.Web.Gui.Add product to cart
    Amazon.Web.Gui.Begin checkout

Count amount of ads in search results
    [Documentation]    Count amount of ads in search result
    [Tags]     Ads
    Amazon.Web.Gui.Search for Products    ${SEARCH_TERM}
    Amazon.Web.Gui.Count results

#
#Dictionary testing (Should create seperate file for this, but it is just a small test)
Open google sites via list
    [Documentation]    Testing googles sites via dictonary
    [Tags]    Google
    FOR    ${site}    IN    @{GOOGLE_URL_LIST}
            log  ${site}
            go to    ${site}
            sleep    1s
    END

Open googles sites via dictionary
    [Documentation]    Using dictionary in for loop
    [Tags]    Google
    @{sites} =    get dictionary values    ${GOOGLE_URL}
    FOR    ${site}    IN    @{sites}
            go to    ${site}
    END

# robot -i Google1 -v google_site:maps  -d results test/amazon.robot
Open google site
    [Documentation]    Opening a google sites via dictionary & variable
    [Tags]    Google1
    go to    ${GOOGLE_URL.${GOOGLE_SITE}}
    sleep    1s

