Feature: Installing Mysql Database
  Background:
    Given I have a running server
    And I provision it

  Scenario: Pre-seed debconf
    When i Pre-Seed file for debconf
    Then it should be succesful

  Scenario: Seed the mysql file
    When i seed the mysql file
    Then it should be succesful

  Scenario: Install Mysql server
    When i install mysql server
    Then it should be succesful

  Scenario: Delete the seed file
    When i delete the seed file
    Then it should be succesful

  Scenario: Set my.cnf file
    When i set my.cnf to /etc folder
    Then it should be succesful

  Scenario: Remove empty password user from localhost
    When i Remove users with empty passwords from localhost
    Then it should be succesful

  Scenario: Remove user with empty in other hosts
    When i Remove ueers with empty passwords
    Then it should be succesful

  Scenario: Remove test database
    When i Remove the test database
    Then it should be succesful


