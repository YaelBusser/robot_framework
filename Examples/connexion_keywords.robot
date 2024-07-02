*** Keywords ***
the visitor go to "${url}" on browser "${browser}"
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible  //input[@placeholder="Username"]

the visitor fills the username with "${username}"
    Wait Until Element Is Visible  //input[@placeholder="Username"]
    Input Text  //input[@placeholder="Username"]  ${username}

the visitor fills the password with "${password}"
    Wait Until Element Is Visible  //input[@placeholder="Password"]
    Input Text  //input[@placeholder="Password"]  ${password}

the visitor clicks on the login button
    Wait Until Element Is Visible  //button[@type="submit"]
    Click Button  //button[@type="submit"]

the user should see the dashboard
    Wait Until Element Is Visible  //span[text()="Dashboard"]
    Sleep  3s  # Utilise le mot-clé Sleep de la bibliothèque BuiltIn
