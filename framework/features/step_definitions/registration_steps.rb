When(/^I am on registration page$/) do
  visit HomePage
  on(HomePage).register
end

And(/^I sign up with correct credentials$/) do
  on(RegistrationPage).sign_up
end

Then(/^I am registered$/) do
  expect(on(HomePage).profile_element.text).to be @email[/[^@]+/]
end