Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Factory.create( :user, :email => email, :password => password, :password_confirmation => password)
end

Given /^I am a new, authenticated user$/ do
  email     = 'testing@man.net'
  password  = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^(?:|I )am logged in as (.+)$/ do |account_type|
  account = Factory.create( account_type )
  visit new_user_session_path
  fill_in "Username or Email",  :with => account.username
  fill_in "Password",           :with => 'password'
  click_button "Sign in"
end
