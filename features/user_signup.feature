Feature: user singup
  As a user
  I want to signup
  So that I can contribute to the blog

Scenario: signup
  Given I am not signed up yet
  When I signup to website
  Then the page should say "You are loged in"
