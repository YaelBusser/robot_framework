*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Resource    user_management_keywords.robot

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}        chrome
${ADMIN_USERNAME} Admin
${ADMIN_PASSWORD} admin123
${EMPLOYEE_NAME}  Linda Anderson
${USER_NAME}      Robotframework
${USER_PASSWORD}  secure_password
${ROLE}           ESS
${NEW_ROLE}       Admin
${STATUS}         Enabled

*** Test Cases ***
User Management in OrangeHRM
    [Tags]    user_management
    # Step 1: Aller sur le site de login d'OrangeHRM
    Given the visitor go to "${URL}" on browser "${BROWSER}"
    # Step 2: Connecter avec les informations d'administrateur
    When the visitor logs in with username "${ADMIN_USERNAME}" and password "${ADMIN_PASSWORD}"
    # Step 3: Ajouter un nouvel utilisateur
    And the visitor adds a new user with employee name "${EMPLOYEE_NAME}", username "${USER_NAME}", password "${USER_PASSWORD}", role "${ROLE}", and status "${STATUS}"
    # Step 4: Vérifier que l'utilisateur nouvellement ajouté est dans la liste des utilisateurs
    Then the visitor should see the user "${USER_NAME}" in the user list
    # Step 5: Modifier le rôle de l'utilisateur nouvellement ajouté
    When the visitor edits the user "${USER_NAME}" to role "${NEW_ROLE}"
    # Step 6: Vérifier que l'utilisateur modifié a le nouveau rôle
    Then the visitor should see the user "${USER_NAME}" with role "${NEW_ROLE}" in the user list
    # Step 7: Supprimer l'utilisateur modifié
    When the visitor deletes the user "${USER_NAME}"
    # Step 8: Vérifier que l'utilisateur supprimé n'est plus dans la liste des utilisateurs
    Then the visitor should not see the user "${USER_NAME}" in the user list
    # Step 9: Se déconnecter
    And the visitor logs out

*** Keywords ***
the visitor go to "${url}" on browser "${browser}"
    Open Browser  ${url}  ${browser}

the visitor logs in with username "${username}" and password "${password}"
    Input Text  name=username  ${username}
    Input Text  name=password  ${password}
    Click Button  xpath=//button[@type='submit']
    Wait Until Element Is Visible  xpath=//span[text()='Dashboard']

the visitor adds a new user with employee name "${employee_name}", username "${username}", password "${password}", role "${role}", and status "${status}"
    Click Link  xpath=//span[text()='Admin']
    Click Button  xpath=//button[text()='Add']
    Select From List By Value  name=systemUser[userType]  ${role}
    Input Text  name=systemUser[employeeName][empName]  ${employee_name}
    Input Text  name=systemUser[userName]  ${username}
    Select From List By Value  name=systemUser[status]  ${status}
    Input Text  name=systemUser[password]  ${password}
    Input Text  name=systemUser[confirmPassword]  ${password}
    Click Button  xpath=//button[text()='Save']
    Wait Until Element Is Visible  xpath=//div[contains(text(), 'Successfully Saved')]

the visitor should see the user "${username}" in the user list
    Input Text  name=searchSystemUser[userName]  ${username}
    Click Button  xpath=//button[text()='Search']
    Element Should Contain  xpath=//a[text()='${username}']  ${username}

the visitor edits the user "${username}" to role "${role}"
    Input Text  name=searchSystemUser[userName]  ${username}
    Click Button  xpath=//button[text()='Search']
    Click Link  xpath=//a[text()='${username}']
    Select From List By Value  name=systemUser[userType]  ${role}
    Click Button  xpath=//button[text()='Save']
    Wait Until Element Is Visible  xpath=//div[contains(text(), 'Successfully Saved')]

the visitor should see the user "${username}" with role "${role}" in the user list
    Input Text  name=searchSystemUser[userName]  ${username}
    Click Button  xpath=//button[text()='Search']
    Element Should Contain  xpath=//a[text()='${username}']  ${username}
    Element Should Contain  xpath=//td[text()='${role}']  ${role}

the visitor deletes the user "${username}"
    Input Text  name=searchSystemUser[userName]  ${username}
    Click Button  xpath=//button[text()='Search']
    Click Checkbox  xpath=//input[@type='checkbox']
    Click Button  xpath=//button[text()='Delete']
    Click Button  xpath=//button[text()='OK']
    Wait Until Element Is Visible  xpath=//div[contains(text(), 'Successfully Deleted')]

the visitor should not see the user "${username}" in the user list
    Input Text  name=searchSystemUser[userName]  ${username}
    Click Button  xpath=//button[text()='Search']
    Element Should Not Contain  xpath=//a[text()='${username}']  ${username}

the visitor logs out
    Click Link  xpath=//a[text()='Logout']
    Wait Until Element Is Visible  xpath=//h5[text()='Login']
    Close Browser
