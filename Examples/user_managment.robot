*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Resource    connexion_keywords.robot
Resource    connexion_variables.robot
Resource    user_managment_keywords.robot
Resource    user_managment_variables.robot

*** Test Cases ***
User Management
    [Tags]    user_managment
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

    And the user clicks on the Admin button
    Then the user clicks on the Add button
    And the user selects ESS from the dropdown
    And the user types '${EMPLOYEE_NAME}' and selects the first autocomplete suggestion
    And the user selects ${STATUS} from the Status dropdown
    Then the user types '${NEW_USERNAME}' in the username input
    Then the user types '${NEW_PASSWORD}' in the password & confirm password input
    Then the user saves the new user
    the user types '${NEW_USERNAME}' in the search input
    the user search for the new user
    the user delete the new user
    the user logout
