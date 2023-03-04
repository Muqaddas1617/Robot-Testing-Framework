
*** Settings ***
Documentation   Verify User Login Functionality
Library         SeleniumLibrary
Suite Setup     Open Browser    ${url}    ${browser}
Suite Teardown  Close Browser

*** Variables ***
${url}          https://practicetestautomation.com/practice-test-login/
${browser}      Chrome

*** Test Cases ***
Login Test
    [Documentation]     This test case verifies the user login functionality.
    [Tags]              login
    Open Login Page
    Enter Valid Credentials
    Verify User Dashboard Page
    Logout User
    Verify Logout Success
    Verify User Login Page

*** Keywords ***
Open Login Page
    Go To   ${url}

Enter Valid Credentials
    Input Text      id=username    student
    Input Password  id=password    Password123
    Click Element   xpath=//button[@id='submit']

Verify User Dashboard Page
    Wait Until Page Contains Element   xpath=//h1[normalize-space()='Logged In Successfully']
    Page Should Contain Element         xpath=//h1[normalize-space()='Logged In Successfully']

Logout User
    Click Link      xpath= //a[normalize-space()='Log out']

Verify Logout Success
    Wait Until Page Contains Element   xpath=//h2[normalize-space()='Test login']
    Page Should Contain Element         xpath=//h2[normalize-space()='Test login']

Verify User Login Page
    Page Should Contain Element         xpath=//h2[normalize-space()='Test login']
    Page Should Contain Element         xpath=//input[@id='username']

