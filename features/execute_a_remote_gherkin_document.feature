Feature: Execute a remote gherkin document

  Scenario: Execute gherkin remotely
    Given a server running on port "5999"
    And the http plugin is installed
    And a remote gherkin document at "/test.feature":
      """
      Feature: test

        Scenario:
          Given passing
      """
    When I run `cucumber http://localhost:5999/test.feature --dry-run -q`
    Then it should pass with:
      """
      Feature: test

        Scenario: 
          Given passing
      """

