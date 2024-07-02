*** Settings ***
Resource    side_bar_keywords.robot
Resource    click_secondary_button_keywords.robot

*** Keywords ***
the user click on PIM
     Click Main Menu Item By Index  2

the user should see the PIM title
    Wait Until Element Is Visible  //span[text()="PIM"]
    Sleep  3s

Click Add Button
    Click Add Button By Index  2
    Sleep  3s
