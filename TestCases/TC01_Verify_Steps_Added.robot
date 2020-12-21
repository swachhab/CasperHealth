*** Settings ***
Library    		AppiumLibrary
Library    		Collections
Resource    	../Locators/AndroidLocators.robot
Resource        ../Library/Common_Keywords.robot

Test Setup       Launch Application  	${remote_url}  
Test Teardown    Close Application

*** Variables ***
${remote_url}=		http://0.0.0.0:4723/wd/hub
${steps_val}=       500

*** Test Cases ***
TC01 Verify Steps Added
    [Documentation]    Add Steps And Verify If Added correctly in Home and Weekly Progress

    ${Current_Steps_Count}=   Get Current Step Count
    Add Steps And Save
    ${New_Steps_Count}=   Get Current Step Count
    ${expected_steps}=   Difference   ${New_Steps_Count}   ${Current_Steps_Count}
    Should be equal  ${expected_steps}  ${steps_val}
    Navigate To Therapy Week Section
    ${Weekly_Steps_Count}=    Get Current Step Count
    Navigate To Step Section
    Add Steps And Save
    ${New_Weekly_Steps_Count}=    Get Current Step Count
    ${expected_weekly_steps}=   Difference   ${New_Weekly_Steps_Count}   ${Weekly_Steps_Count}
    Should be equal  ${expected_weekly_steps}  ${steps_val}

*** Keywords ***

Get Current Step Count
    Wait Until Page Contains Element    ${Steps_Text}   30
    Swipe Down
    ${current_count}=    Get Text    ${Steps_Count}
    [Return]  ${current_count}

Add Steps And Save
    Wait And Click On Element    ${Add_Steps_Text}
    Wait Until Page Contains Element    ${Add_Steps_Header}   30
    Input Text   ${Input_Steps}   ${Steps_Val}
    Click Element    ${Save}

Navigate To Therapy Week Section
    Click Element   ${Therapy_Week_Tab}
    Wait Until Page Contains    My therapy week   30

Navigate To Step Section
    Swipe Down
    Wait And Click On Element    ${Steps_Naviagte}