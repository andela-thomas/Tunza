Feature: Backup and restore
  Background:
    Given I have a running server
    And I provision it

  Scenario: Installing pip
    When I Install pip
    Then it should be succesful
    And pip should be working well

  Scenario: Installing boto sdk
    When I Install Boto sdk
    Then it should be succesful

  Scenario: Creating AWS s3 bucket
    When I create Amazon s3 bucket
    Then it should be succesful

  Scenario: Building Backup Script
    When I build the Backup Script
    Then it should be succesful

  Scenario: Adding Cron Job to run the Backup Script
    When I add the cron Job
    Then it should be succesful

