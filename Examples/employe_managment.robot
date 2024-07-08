*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Resource    connexion_keywords.robot
Resource    connexion_variables.robot
Resource    employe_managment_keywords.robot
Resource    employe_managment_variables.robot

*** Test Cases ***
User Management
    [Tags]    employe_managment
    # Step 1 : Aller sur le site https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Given the visitor go to "${URL}" on browser "chrome"
    # Step 2 : Remplir le champ Username
    When the visitor fills the username with "${USERNAME}"
    # Step 3 : Remplir le champ Password
    And the visitor fills the password with "${PASSWORD}"
    # Step 4 : Se connecter
    And the visitor clicks on the login button
    # Step 5 : Vérifier que la connexion est réussie
    Then the user should see the dashboard
    And the user click on PIM
    Then the user should see the PIM title
    And Click Add Button
    Then the user should see the Add Employee
    And Click Switch
    Then the user should see the label Username
    And the user fills first name for employee
    And the user fills middle name for employee
    And the user fills last name for employee
    And the user fills username for employee
    And the user fills the password for employee
    And the user fills the confirm password for employee
    Then the user click on save button
    And the user click on PIM
    Then the user should see the PIM title
    And the user enters employee name
    And the user click on search button
    And the user click on edit button
    Then the user edit nickname for employee
    And the user click on save button for edit nickname
    And the user click on PIM
    Then the user should see the PIM title
    And the user enters employee name
    And the user click on search button
    And the user click on delete button
    Then the user confirm delete user employe
    And the user logout
