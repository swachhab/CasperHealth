*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    String

*** Variables ***
${platformname}=        android
${devicename}=          Samsung
${apppackage}=          com.casparhealth.android.patient
${appactivity}=         com.casparhealth.android.patient.splash.SplashActivity
${appwaitactivity}=     com.casparhealth.android.patient.splash.SplashActivity
${automationname}=      appium
${no_reset}=            true
${error_message}=       element not found -

*** Keywords ***
Wait And Click On Element
    [Documentation]    Wait till 30 sec and click if element found
    [Arguments]    ${Element_xpath}
    Wait Until Page Contains Element    ${Element_xpath}    30s    ${error_message} ${Element_xpath}
    Click Element    ${Element_xpath}

Swipe Down
    Swipe    200    1200   200    400    2000

Launch Application
    [Documentation]   Launching App ${remote_url}
    [Arguments]   ${remote_url}
    ${app}=   Open Application  ${remote_url}  platformName=${platformname}  deviceName=${devicename}   appPackage=${apppackage}   appActivity=${appactivity}    appwaitactivity=${appwaitactivity}    automationName=${automationname}     noReset=${no_reset}
    Set Suite Variable   ${App_var}   ${app}

Difference
    [Arguments]   ${text1}    ${text2}
    ${val1}=   Convert To Integer      ${text1}
    ${val2}=   Convert To Integer      ${text2}
    ${diff}=   Evaluate  ${val1} - ${val2}
    ${diff}=   Convert To String   ${diff}
    [Return]  ${diff}