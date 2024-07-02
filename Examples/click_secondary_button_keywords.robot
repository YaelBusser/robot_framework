*** Keywords ***
Click Secondary Button By Index
    [Arguments]  ${index}
    Click Element  xpath=(//button[contains(@class, 'oxd-button--secondary')])[${index}]
