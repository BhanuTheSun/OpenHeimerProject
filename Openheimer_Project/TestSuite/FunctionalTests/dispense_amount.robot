*** Settings ***
Library     SeleniumLibrary
Resource    ../../Variables/Landingpage.robot
Test Teardown  close browser
Suite Teardown  Close All Browsers

*** Test Cases ***
TC01_functionality_of_Browse_button
    GoTo_Landing_Page
    element should be enabled   ${browse_locator}
    Choose File    ${browse_locator}       ${workingclassheroes_csv_file}

TC03_functionality_of_UploadCSVfile
    GoTo_Landing_Page
    Choose File    ${browse_locator}       ${workingclassheroes_csv_file}
    element should be enabled   ${upload_csv_file_locator}
    click element   ${upload_csv_file_locator}

TC04_functionality_of_Refresh_Tax_Relief_Table
    GoTo_Landing_Page
    element should be enabled   ${Refresh_tax_relief_button}
    click element               ${Refresh_tax_relief_button}

TC15_text_on_button_DispenseNow
    [Documentation]     Validate the text on button must be exactly “Dispense Now”
    GoTo_Landing_Page
    Element Text Should Be      ${dispence_button}    Dispense Now

TC16_click_dispence_directs_to_page_with_text_Cashdispensed
    [Documentation]     This Test Case verifies a click on "Dispense Now" button directs to a page
                        ...  with a text that says “Cash dispensed”
    GoTo_Landing_Page
    Click Link      ${dispence_url_name}
    Page Should Contain     ${result_text}

TC14_validate_button_is_redcolor
    [Documentation]     Validate the button on the screen must be red-colored
    GoTo_Landing_Page
    ${bgcolor}    Execute Javascript        return document.defaultView.getComputedStyle(document.getElementsByClassName("btn btn-danger btn-block"),null)['background-color']
    Log To Console      Backgroud Color ${bgcolor}


*** keywords ***
GoTo_Landing_Page
    Open Browser        ${url}      ${browser}
    Maximize Browser Window
    set selenium speed      2seconds
    Wait Until Page Contains    ${welcome_text}


