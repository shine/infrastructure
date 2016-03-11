Feature: Spawn cloud instance for sam-we.com
Scenario: Spawn cloud instance
  When I run spawn.rb
  Then A cloud instance tagged samwecom should appear

Scenario: Prevent spawning a duplicate instance
  Given A cloud instance tagged samwecom exists
  When I run spawn.rb
  Then a duplicate instance tagged samwecom should not appear





