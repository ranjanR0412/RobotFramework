*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/UltimaRepo.robot
Resource    ../Entity/checkSearchBarUltime.robot

*** Variables ***
${browser}    edge
${url}    https://ultimaworks.ltm.com/home

*** Test Cases ***
loginTest
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${actualValue}    checkGrade
    SearchUltima    iFulfil
    ${expectedValue}    checkGradeIfulfil    10861207    P2
    Should Be Equal    ${actualValue}    ${expectedValue}
    Close All Browsers

