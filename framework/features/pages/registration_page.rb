class RegistrationPage
  include PageObject

  text_field(:email_address, xpath: "//input[@name='email']")
  text_field(:email_confirm, xpath: "//input[@name='emailConfirmation']")
  text_field(:password, xpath: "//input[@name='password']")
  button(:sign_up, css: 'div.form__submit')

  def sign_up
    @email = "#{Time.now.strftime '%Y%m%d-%H%M%S'}@wuaki.tv"
    self.email_address = @email
    self.email_confirm = @email
    self.password = SecureRandom.alphanumeric(8)
    click_sign_up
  end

  def click_sign_up
    self.sign_up
  end
end