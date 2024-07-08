*** Settings ***
Resource    side_bar_keywords.robot
Resource    click_secondary_button_keywords.robot
Resource    employe_managment_variables.robot
Resource    logout_user_keywords.robot

*** Keywords ***
the user click on PIM
     Click Main Menu Item By Index  2

the user should see the PIM title
    Wait Until Element Is Visible  //span[text()="PIM"]
    Sleep  1s

Click Add Button
    Click Secondary Button By Index  2
    Sleep  1s

the user should see the Add Employee
    Wait Until Element Is Visible  //h6[text()="Add Employee"]

Click Switch
    Click Element  xpath=(//label)[3]

the user should see the label Username
    Wait Until Element Is Visible  //label[text()="Username"]

the user fills first name for employee
    Wait Until Element Is Visible  //input[@placeholder="First Name"]
    Input Text  //input[@placeholder="First Name"]  ${firstNameEmploye}

the user fills middle name for employee
    Wait Until Element Is Visible  //input[@placeholder="Middle Name"]
    Input Text  //input[@placeholder="Middle Name"]  ${middleNameEmploye}

the user fills last name for employee
    Wait Until Element Is Visible  //input[@placeholder="Last Name"]
    Input Text  //input[@placeholder="Last Name"]  ${lastNameEmploye}

the user fills username for employee
    Wait Until Element Is Visible  (//input)[8]
    Input Text  (//input)[8]  ${usernameEmploye}

the user fills the password for employee
    Wait Until Element Is Visible  (//input)[11]
    Input Text  (//input)[11]  ${passwordEmploye}

the user fills the confirm password for employee
    Wait Until Element Is Visible  (//input)[12]
    Input Text  (//input)[12]  ${passwordEmploye}
    Sleep    3s

the user click on save button
    Click Secondary Button By Index  1
    Sleep  3s

the user enters employee name
    Wait Until Element Is Visible  (//input)[2]
    Input Text  (//input)[2]  ${firstNameEmploye} ${middleNameEmploye} ${lastNameEmploye}
    Sleep  3s

the user click on search button
    Click Secondary Button By Index  1
    Sleep  3s

the user click on edit button
    Wait Until Element Is Visible  (//button)[8]
    Click Element  xpath=(//button)[8]
    Sleep    3s

the user edit nickname for employee
    Wait Until Element Is Visible  (//input)[5]
    Input Text  (//input)[5]  ${nicknameEmploye}

the user click on save button for edit nickname
    Click Secondary Button By Index  1
    Sleep  3s

the user click on delete button
    Click Element  xpath=(//button)[7]
    Sleep  3s

the user confirm delete user employe
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'oxd-button--label-danger') and contains(., 'Yes, Delete')]
    Click Button    xpath=//button[contains(@class, 'oxd-button--label-danger') and contains(., 'Yes, Delete')]
    Sleep    10s

the user logout
    Click Logout
