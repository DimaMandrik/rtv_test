When(/^I am on add credit card page$/) do
  on(HomePage).open_settings
  on(SettingsPage).deposit_tab
end

And(/^I add MasterCard credit card$/) do
  on(DepositPage) do |page|
    mc1 = get_account_data(:visa1)
    page.holder_name = mc1[:holder]
    page.card_number = mc1[:number]
    page.select_exp_month = mc1[:exp_month]
    page.select_exp_year = mc1[:exp_year]
    page.cvv = mc1[:cvv]
    page.submit
  end
end