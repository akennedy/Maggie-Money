Feature: Sign out
  To protect my account from unauthorized access
  A signed in user
  Should be able to sign out

    Scenario: User signs out
      Given I am a user with username "maggie" an email "maggie@maggiemoney.com" and password "please"
      When I sign in as "maggie@maggiemoney.com/please"
      Then I should be signed in
      And I sign out
      Then I should see "Signed out"
      When I return next time
      Then I should be signed out
