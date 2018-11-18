class LoginPage
  include PageObject

  text_field(:email_address, xpath: "//input[@name='email']")
  text_field(:password, xpath: "//input[@name='password']")
  button(:login, css: 'div.form__submit')

  def sign_in(account)
    creds = get_account_data(account)
    self.email_address = creds[:email]
    self.password = creds[:password]
    click_login
  end

  def click_login
    self.login
  end
end