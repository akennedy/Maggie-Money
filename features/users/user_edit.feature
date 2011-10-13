Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    Scenario: I sign in and edit my account
      Given I am a user with username "maggie" an email "maggie@maggiemoney.com" and password "please"
      When I sign in as "maggie@maggiemoney.com/please"
      Then I should be signed in
      When I follow "My Account"
      And I fill in "Email" with "margaret@maggiemoney.com"
      And I fill in "Current password" with "please"
      And I press "Update"
      Then I should see "You updated your account successfully."
