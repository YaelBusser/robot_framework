*** Settings ***
Resource    side_bar_keywords.robot


*** Keywords ***
the user click on PIM
     Click Main Menu Item By Index  2

the user should see the PIM title
    Wait Until Element Is Visible  //span[text()="PIM"]
    Sleep  3s  # Utilise le mot-clé Sleep de la bibliothèque BuiltIn
