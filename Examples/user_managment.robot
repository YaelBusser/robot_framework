*** Settings ***
Resource    user_management_keywords.robot
Variables   variables.robot

*** Test Cases ***
User Management Test
    [Tags]    user_management
    Given I am on the OrangeHRM login page
    When I log in with username "${ADMIN_USERNAME}" and password "${ADMIN_PASSWORD}"
    And I wait for 10 seconds
    # Ajoutez ici les autres étapes du scénario de gestion des utilisateurs selon vos besoins
    And I log out

*** Keywords ***
I wait for 10 seconds
    Sleep    10s
