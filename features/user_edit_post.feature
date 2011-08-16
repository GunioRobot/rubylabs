 
Feature: edit user post
  As a user
  I want login
  So that I can edit my post

Scenario: edit user post
  Given I am not loged in
  When  I log in
  Then the page should say "you are not authenticated"
