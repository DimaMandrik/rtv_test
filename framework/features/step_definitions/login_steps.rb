When(/^I am on login page$/) do
  visit HomePage
  on(HomePage).login_element.when_present.click
end

And(/^I login with correct credentials$/) do
  on(LoginPage).sign_in(:user1)
end

Then(/^I am logged in$/) do
  expected_username = get_account_data(:user1)[:email][/[^@]+/]
  expect(on(HomePage).profile_element.text).to eq expected_username
end