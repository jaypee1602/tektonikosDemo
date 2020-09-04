*** Settings ***
Resource          ../Resources/Tektonikos.robot
Suite Setup       Suite setup


*** Test Cases ***
Landingspagina
    Check landing page

Oplossingen
    Click oplossingen
    Check cervino review
    Check applicatie intergratie
    Click media opslag

Maatwerk website
    Click maatwerk website
    Check text maatwerk website

Artikelen
    Click artikelen
    Check wij zijn verhuisd
    Check laatste artikel

Waarom
    Waarom tektonikos

Contact
    Click Contact


*** Keywords ***
Check landing page
    Open chrome browser
    Maximize Browser Window
    Go to    ${tektonikosUrl}
    Wait Until Element Is Visible    ${logo}
    Wait Until Element Is Visible    ${content}
    Sleep  2s

Click oplossingen
    Click Element    ${oplossingen}
    Check cervino review

Check cervino review
    Wait Until Element Is Visible    ${content}
    Click Element    ${content}
    Execute JavaScript     window.scrollTo(0,1000)
    Sleep  2s
    Wait Until Element Is Visible    ${cervinoReview}

Check applicatie intergratie
    Execute JavaScript     window.scrollTo(0,0)
    Sleep  2s
    Wait Until Element Is Visible    ${oplossing}
    Mouse Over    ${oplossing}
    Wait Until Element Is Visible    ${appIntergratie}
    Mouse over    ${appIntergratie}
    Wait Until Element Is Visible    ${mediaOpslag}

Click media opslag
    Click Element    ${mediaOpslag}
    Wait Until Page Contains    ${mediaOpslagTxt}
    Execute JavaScript     window.scrollTo(0,1000)
    Wait Until Element Is Visible    ${voorwaarden}
    Wait Until Element Is Visible    ${privacy}
    Execute JavaScript     window.scrollTo(0,0)

Click maatwerk website
    Execute JavaScript     window.scrollTo(0,0)
    Sleep  1s
    Mouse over    ${oplossing}
    Wait Until Element Is Visible    ${maatwerk}
    Click Element   ${maatwerk}

Check text maatwerk website
    Execute JavaScript     window.scrollTo(0,500)
    Sleep  1s
    Wait Until Page Contains    ${maatwerkTxt}

Click artikelen
    Execute JavaScript     window.scrollTo(0,0)
    Wait Until Element Is Visible    ${artikelen}
    Click Element    ${artikelen}

Check wij zijn verhuisd
    Wait Until Element Is Visible    ${verhuisd}
    Click Element    ${verhuisd}
    Execute JavaScript     window.scrollTo(0,200)
    Sleep  1s
    Wait Until Element Is Visible    ${gebouw}
    Sleep  1s

Check laatste artikel
    Wait Until Element Is Visible    ${artikelen}
    Click Element   ${artikelen}
    Execute JavaScript     window.scrollTo(0,1100)
    Sleep  1s
    Wait Until Element Is Visible    ${django}

Waarom tektonikos
    Mouse Over    ${overOns}
    Wait Until Element Is Visible    ${waarom}
    Click Element    ${waarom}
    Execute JavaScript     window.scrollTo(0,1000)
    Sleep  2s
    Wait Until Page Contains    Uniek
    Select frame    ${video}
    Unselect frame

Click Contact
    Execute JavaScript     window.scrollTo(0,0)
    Click Element    ${contact}
    Execute JavaScript     window.scrollTo(0,1000)
    Sleep  2s
    Wait Until Element Is Visible    ${telInput}
    Input Text    ${telInput}   Mag ik alsjeblieft bij jullie komen werken? :)
    Sleep  5s
    Textfield Should Contain    ${telInput}   gersgs
