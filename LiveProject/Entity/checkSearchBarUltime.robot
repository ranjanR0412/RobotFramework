*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/UltimaRepo.robot
Resource    ../Resources/ifulfilRepo.robot

*** Variables ***
${browser}    edge
${url}    https://ultimaworks.ltm.com/home

*** Keywords ***
SearchUltima
    [Arguments]    ${value}
    Sleep    2s
    Wait Until Element Is Visible    ${searchBar}
    Click Element    ${searchBar}
    Sleep    5s
    Input Text    ${searchBar}    ${value}
    Sleep    2s
    Clear Element Text    ${placeHolderUltime}
    Sleep    2s
    Input Text    ${inputTextUltimaSearchBar}    ${value}
    Sleep    4s
    ${locator}=    Format String    ${searchBoxOptions}    ${value}
    Click Element    ${locator}

checkGrade
    Sleep    2s
    Wait Until Element Is Visible    ${userIcon}    10s
    Click Element    ${userIcon}
    Wait Until Element Is Visible    ${designation}
    ${jobGrade}=    Get Text    ${designation}
    @{parts}=    Split String    ${jobGrade}    ,
    ${grade}=    Strip String    ${parts}[0]
    Click Element    ${closeBtn}
    RETURN    ${grade}

checkGradeIfulfil
    [Arguments]    ${psNo}    ${grade}
    Switch Window    NEW

    Sleep    2s
    ${isVisible}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${closeAnotherBrowser}    5s

    IF    ${isVisible}
        Click Element    ${closeAnotherBrowser}
    ELSE
        Log    Close button is not present. Continuing test.
    END

    Sleep    2s
    Click Element    ${searchBarIfulfil}
    Input Text    ${dropdownOptions}    ${psNo}
    Press Keys    ${dropdownOptions}    ENTER
    Sleep    2s
    ${gradeLocator}=    Format String    ${gradeVisible}    ${psNo}
    Log To Console    ${gradeLocator}
    Click Element    ${gradeLocator}
    Sleep    3s
    ${gradeValue}=    Format String    ${gradeSearching}    ${grade}
    Log To Console    ${gradeValue}
    Wait Until Element Is Visible    ${gradeValue}    10s
    ${expectedGrade}=    Get Text    ${gradeValue}
    RETURN    ${expectedGrade}