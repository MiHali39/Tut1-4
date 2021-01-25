*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${SEARCHRESULTS.ITEM} =    xpath://*[@id="search"]//span[3]/div/div/div
${SEARCHRESULTS.TEXT_RESULT}=  //*[@id="search"]/span/div/span/h1/div/div[1]/div/div/span[1]

*** Keywords ***
Search Result Expectation
    [Arguments]    ${search_result}
    wait until page contains    results for "${search_result}"

Click on Result
    [Arguments]    ${result_text}
    click link  ${result_text}

# Just a test to count Results and Ads
Count results
    ${count}=   Get Element Count   ${SEARCHRESULTS.ITEM}
    ${text_results}=    get text    ${SEARCHRESULTS.TEXT_RESULT}
    ${text_results}=   String.remove string      ${text_results}   results for
    ${results}=    Convert To Number    ${text_results}
    log    ${text_results} ITEMS
    log    ${count - ${results}} ADS