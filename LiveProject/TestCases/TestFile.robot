*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/UltimaRepo.robot
Resource    ../Entity/checkSearchBarUltime.robot
Test Teardown    Close All Browsers


*** Variables ***
${browser}    edge
${url}        https://ultimaworks.ltm.com/home


*** Test Cases ***
loginTest
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver

    Call Method    ${options}    add_argument    --headless\=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size\=1920,1080

    Open Browser    ${url}    ${browser}    options=${options}

    ${actualValue}=    checkGrade

    SearchUltima    iFulfil

    ${expectedValue}=    checkGradeIfulfil    10861207    P2

    Should Be Equal    ${actualValue}    ${expectedValue}
