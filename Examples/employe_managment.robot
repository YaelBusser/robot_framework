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
