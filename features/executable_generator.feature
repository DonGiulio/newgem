Feature: Generate an executable/CLI scaffold

  As a RubyGem developer
  I want a scaffold for executable/CLI scripts
  So that I know the structure for constructing CLIs and can create them quickly

  Scenario: Run executable generator with name of executable
    Given an existing newgem scaffold [called 'my_project']
    When 'executable' generator is invoked with arguments 'my_app'
    Then folder 'bin/my_app' is created
    And file 'bin/my_app' is created
    And file 'lib/my_app/cli.rb' is created
    And file 'test/test_my_app_cli.rb' is created
  
  Scenario: Run CLI app from executable generator to show help
    Given an existing newgem scaffold [called 'my_project']
    Given 'executable' generator is invoked with arguments 'my_app'
    When run executable 'bin/my_app' with arguments '-h'
    Then help options '-h' and '--help' are displayed
    Then help options '-p' and '--path' are displayed

  Scenario: Run CLI app from executable generator should not fail
    Given an existing newgem scaffold [called 'my_project']
    Given 'executable' generator is invoked with arguments 'my_app'
    When run executable 'bin/my_app' with arguments ''
    Then output matches /lib\/my_app\/cli.rb/
  
  Scenario: Run unit tests after executable generator should all pass
    Given an existing newgem scaffold [called 'my_project']
    Given 'executable' generator is invoked with arguments 'my_app'
    When run unit tests for test file 'test/test_my_app_cli.rb'
    Then all 1 tests pass
  