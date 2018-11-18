class DepositPage
  include PageObject

  text_field(:holder_name, xpath: "//input[@name='name']")
  text_field(:card_number, xpath: "//input[@name='number']")
  text_field(:cvv, xpath: "//input[@name='cvv']")
  select(:exp_month, css: '.i-select.i-select--month')
  select(:card_number, css: '.i-select.i-select--year')
  button(:submit, xpath: "//button[@type='submit']")

  def select_exp_month(month)
    self.exp_month = month
  end

  def select_exp_year(year)
    self.exp_year = year
  end

end
