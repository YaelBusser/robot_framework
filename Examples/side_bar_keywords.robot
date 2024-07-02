*** Keywords ***
Click Main Menu Item By Index
    [Arguments]  ${index}
    Click Element  xpath=(//li[@class='oxd-main-menu-item-wrapper'])[${index}]
