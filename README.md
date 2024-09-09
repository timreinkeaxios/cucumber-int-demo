Demonstrate problem with cucumber retry and fail-fast
- With retry, sending Ctrl+C fails the current attempt then retries the scenario. It does exit after passing / retries exhausted for that specific scenario
- With both fail-fast and retry, sending Ctrl+C fails the current attempt like above.  If a retry succeeds, fail fast resets want_to_quit, so the suite keeps running even after the scenario is done!

```
bundle exec cucumber --fail-fast --retry 2 
# then send Ctrl+C once
$ bundle exec cucumber --retry 2 --fail-fast
Feature: Example feature

  Scenario: Sleep and pass # features/example.feature:3
^C
Exiting... Interrupt again to exit immediately.
    When I sleep           # features/step_definitions/example_steps.rb:1
      exit (SystemExit)
      ./features/step_definitions/example_steps.rb:2:in `sleep'
      ./features/step_definitions/example_steps.rb:2:in `"I sleep"'
      features/example.feature:4:in `I sleep'
    Then I pass            # features/step_definitions/example_steps.rb:8

  Scenario: Sleep and pass # features/example.feature:3
    When I sleep           # features/step_definitions/example_steps.rb:1
    Then I pass            # features/step_definitions/example_steps.rb:8

  Scenario: Do nothing and pass # features/example.feature:7
    When I do nothing           # features/step_definitions/example_steps.rb:5
    Then I pass                 # features/step_definitions/example_steps.rb:8



2 scenarios (1 flaky, 1 passed)
6 steps (1 failed, 1 skipped, 4 passed)
0m13.026s
```

```
bundle exec cucumber --retry 2 
# then send Ctrl+C once
```