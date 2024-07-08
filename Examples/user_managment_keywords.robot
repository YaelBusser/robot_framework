*** Settings ***
Resource    side_bar_keywords.robot
Resource    click_secondary_button_keywords.robot
Resource    logout_user_keywords.robot

*** Keywords ***
the user clicks on the Admin button
    Wait Until Element Is Visible  //span[text()="Admin"]
    Click Main Menu Item By Index    1
    Sleep    2s

the user clicks on the Add button
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'oxd-button--secondary')][.//i[contains(@class, 'bi-plus')]]
    Click Button    xpath=//button[contains(@class, 'oxd-button--secondary')][.//i[contains(@class, 'bi-plus')]]
    Sleep    2s

the user selects ESS from the dropdown
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'oxd-select-text--active')]
    Click Element    xpath=//div[contains(@class, 'oxd-select-text--active')]
    Wait Until Element Is Visible    xpath=//div[@role='listbox']
    Click Element    xpath=//div[@role='option' and normalize-space()='${USER_ROLE}']
    Sleep    1s

the user types '${EMPLOYEE_NAME}' and selects the first autocomplete suggestion
    Wait Until Element Is Visible    xpath=//input[@placeholder='Type for hints...']
    Input Text    xpath=//input[@placeholder='Type for hints...']    ${EMPLOYEE_NAME}
    Sleep    2s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'oxd-autocomplete-dropdown')]//div[contains(@class, 'oxd-autocomplete-option')]
    Sleep    2s
    Click Element    xpath=(//div[contains(@class, 'oxd-autocomplete-dropdown')]//div[contains(@class, 'oxd-autocomplete-option')])[1]
    Sleep    2s

the user selects ${STATUS} from the Status dropdown
    Wait Until Element Is Visible    xpath=//label[text()='Status']/ancestor::div[contains(@class, 'oxd-input-group')]//div[contains(@class, 'oxd-select-text')]
    Click Element    xpath=//label[text()='Status']/ancestor::div[contains(@class, 'oxd-input-group')]//div[contains(@class, 'oxd-select-text')]
    Wait Until Element Is Visible    xpath=//div[@role='listbox']
    Click Element    xpath=//div[@role='option' and normalize-space()='${STATUS}']
    Sleep    3s

the user types '${NEW_USERNAME}' in the username input
    Wait Until Element Is Visible    xpath=//input[@autocomplete='off']
    Input Text    xpath=//input[@autocomplete='off']    ${NEW_USERNAME}
    Sleep    3s

the user types '${NEW_PASSWORD}' in the password & confirm password input
    Wait Until Element Is Visible    xpath=(//input[@type='password'])[1]
    Input Text    xpath=(//input[@type='password'])[1]    ${NEW_PASSWORD}
    Wait Until Element Is Visible    xpath=(//input[@type='password'])[2]
    Input Text    xpath=(//input[@type='password'])[2]    ${NEW_PASSWORD}
    Sleep    3s

the user saves the new user
    Click Button    xpath=//button[text()=' Save ']
    Sleep    10s
the user types '${NEW_USERNAME}' in the search input
    Wait Until Element Is Visible    xpath=//label[text()='Username']/following::input[1]
    Input Text    xpath=//label[text()='Username']/following::input[1]    ${NEW_USERNAME}
the user search for the new user
    Wait Until Element Is Visible    xpath=//button[@type='submit' and contains(@class, 'oxd-button--secondary') ]
    Click Button    xpath=//button[@type='submit' and contains(@class, 'oxd-button--secondary')]

the user delete the new user
    Wait Until Element Is Visible    xpath=//button[.//i[contains(@class, 'bi-trash')]]
    Click Button    xpath=//button[.//i[contains(@class, 'bi-trash')]]
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'oxd-button--label-danger') and contains(., 'Yes, Delete')]
    Click Button    xpath=//button[contains(@class, 'oxd-button--label-danger') and contains(., 'Yes, Delete')]
    Sleep    10s
the user logout
    Click Logout
