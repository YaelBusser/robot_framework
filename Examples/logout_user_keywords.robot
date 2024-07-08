*** Keywords ***
Click Logout
    Wait Until Element Is Visible   xpath=//li[contains(@class, 'oxd-userdropdown')]//span[@class='oxd-userdropdown-tab']
    Click Element    xpath=//li[contains(@class, 'oxd-userdropdown')]//span[@class='oxd-userdropdown-tab']
    Wait Until Element Is Visible   xpath=//a[@class='oxd-userdropdown-link' and contains(text(), 'Logout')]
    Click Element    xpath=//a[@class='oxd-userdropdown-link' and contains(text(), 'Logout')]
    Wait Until Element Is Visible  xpath=(//h5[contains(@class, 'orangehrm-login-title')])[1]
    sleep    3s
