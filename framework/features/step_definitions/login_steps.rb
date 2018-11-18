When(/^I am on login page$/) do
  visit HomePage
  on(HomePage).login
end

And(/^I login with correct credentials$/) do
  on(LoginPage).sign_in(:user1)
end

Then(/^I am logged in$/) do
  expect(on(HomePage).profile_element.text).to be get_account_data(:user1)[:password]
end