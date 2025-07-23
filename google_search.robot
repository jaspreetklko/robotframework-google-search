*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${URL}           https://www.google.com
${SEARCH_TERM}   robotframework
${SCREENSHOT}    screenshot1.png

*** Test Cases ***
Google Search With Filtered Results
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s

    Input Text      name=q    ${SEARCH_TERM}
    Sleep    1s

    Click Button    xpath=(//input[@name="btnK"])[1]
    Sleep    3s

    Wait Until Page Contains Element    xpath=//h3    timeout=50s

    Sleep    3s
    ${results}=    Get WebElements    //h3[@class="LC20lb MBeuO DKV0Md"]

    Log To Console    \n--- Filtered Results (containing 'robot framework') --- ${results}

    FOR    ${i}    ${el}    IN ENUMERATE    @{results}
        ${text}=    Get Text    ${el}
        ${length}=      Get Length      ${text}
        Run Keyword If    ${length} > 0    Log To Console    ${text}
        Run Keyword If    ${length} > 0    Append To File   results.txt    ${text}\n
    END


    Capture Page Screenshot    ${SCREENSHOT}
    Log To Console    Screenshot saved to: ${SCREENSHOT}
    Close Browser
