class RegistrationPage
  include PageObject

  text_field(:email_address, xpath: "//input[@name='email'][@type='email']")
  text_field(:email_confirm, xpath: "//input[@name='emailConfirmation']")
  text_fields(:password, css: "form.form input[name='password']")
  button(:sign_up, css: 'div.form__submit button')

  def sign_up
    @email = "#{Time.now.strftime '%Y%m%d-%H%M%S'}@wuaki.tv"
    self.email_address = @email
    self.email_confirm = @email
    self.password_elements[1].send_keys(get_account_data(:user1)[:password])
    check_checkbox
    self.sign_up
  end

  def check_checkbox
    self.execute_script("document.getElementById('terms_check_register').click()")
  end

end