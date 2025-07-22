*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}           https://www.google.com
${SEARCH_TERM}   robotframework
${SCREENSHOT}    screenshot1.png

*** Test Cases ***
Google Search With Button Click
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s

    Input Text      name=q    ${SEARCH_TERM}
    Sleep    1s

    # ✅ Click the "Google Search" button
    Click Button    xpath=(//input[@name="btnK"])[1]
    Sleep    3s

    Wait Until Page Contains Element    xpath=//h3    timeout=50s
    ${results}=    Get WebElements    xpath=//h3

    Log To Console    \n--- Top Search Results ---\n

    FOR    ${i}    ${el}    IN ENUMERATE    @{results}[0:5]
        ${text}=    Get Text    ${el}
        Log To Console    ${i + 1}. ${text}
    END

    Capture Page Screenshot    ${SCREENSHOT}
    Log To Console    Screenshot saved to: ${SCREENSHOT}
    Close Browser
