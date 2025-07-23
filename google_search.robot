*** Settings ***
Library    SeleniumLibrary          # Provides browser automation capabilities
Library    OperatingSystem          # Enables file-related operations like deleting or appending
Library    Collections              # Useful for handling lists and iterations

*** Variables ***
${URL}           https://www.google.com        # Google homepage URL
${SEARCH_TERM}   robotframework                # Term to be searched
${SCREENSHOT}    screenshot1.png               # Filename for the captured screenshot
${RESULT}        results.txt                   # Output file to store the result links

*** Test Cases ***
Google Search robotframework
    Open Browser    ${URL}    chrome           # Open Chrome browser with Google homepage
    Maximize Browser Window                    # Maximize browser window for consistent behavior
    Sleep    1s                                 # Wait briefly for the page to load completely

    Input Text      name=q    ${SEARCH_TERM}   # Enter the search term into Google's search box
    Sleep    1s                                 # Short delay before clicking the search button

    Click Button    xpath=(//input[@name="btnK"])[1]    # Click the "Google Search" button
    Sleep    1s                                         # Wait for the search results to begin loading

    Wait Until Page Contains Element    xpath=//h3    timeout=50s    # Ensure results are visible before proceeding

    Sleep    3s                                 # Additional buffer to handle any loading delays or CAPTCHA
    ${results}=    Get WebElements    //a[@class="zReHs"]    # Locate all result links with specified class

    Log To Console    \n--- Result Set ---    # Print header for result list in the console
    Remove File    ${RESULT}                  # Clear previous result file if it exists

    FOR    ${i}    ${el}    IN ENUMERATE    @{results}  # Loop through each search result link
        ${href}=    Get Element Attribute    ${el}    href    # Get the URL from the href attribute
        ${length}=      Get Length      ${href}           # Calculate length to verify it's not empty
        Run Keyword If    ${length} > 0    Log To Console    ${i + 1}. ${href}   # Display valid links in console
        Run Keyword If    ${length} > 0    Append To File   ${RESULT}    ${i + 1}. ${href}\n    # Save valid links to file
    END

    Capture Page Screenshot    ${SCREENSHOT}              # Take a screenshot of the results page
    Log To Console    Screenshot saved to: ${SCREENSHOT}  # Confirm screenshot capture
    Close Browser                                          # Close the browser at the end of the test
