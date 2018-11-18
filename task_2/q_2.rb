# Here you can find a fragment of the registration form. We want you to find
# the possible errors and suggest improvements to the code.
# It's important to consider that Wuaki is expanding into different markets all
# over the world. We would like to see an example of code refactoring.

# probably it is not <Registration> feature
feature 'Registrations', js: true do
  context 'with a logged user' do

# 1) From my perspective it would be better to have <login> method to reuse it everywhere, e.g:
# #  Also it's better to have credentials in .yaml, .json file (in case of updates - just update into the file, but not in all test specs)
    def login(email = nil, password = nil)
      timestamp = Time.now.strftime '%Y%m%d-%H%M%S'
      email ||= "#{timestamp}@wuaki.tv"
      password ||= "rakutv123456"
      visit '/'
      click_link 'Entrar'
      expect(current_url).to eq(sign_in_url)
      fill_in_sign_in_form email
      fill_in_sign_in_form password
      click_button 'Entrar'
    end

# 2) From my perspective it would be better to have only one expected result per scenario:
#   - if we want to check something - it should be a separate scenario
#   - if it is just pre-step - go without <expect> or with implicit timeouts
#  <have_content> method should process arrays if you want to check several elements
    it 'allows the user to sign in with success' do
      login
      expect(page).to have_content ['Mi videoteca', 'Quiero ver']
    end

    it 'opens Datos bancarios page' do
      login
      click_link 'Configuración'
      click_link 'Datos bancarios'
      expect(page).to have_content 'Tarjeta de crédito'
    end

# 3) PageObject should be used everywhere
# 4) explicit timeouts should be replaced by implicit
    it 'user performs a deposit' do
      fill_in_bank_details_form
      within('#edit_user') {find('#user_submit').click}
      page.wait_until_present 'Los datos han sido guardados correctamente'
    end

    it 'rents a TVOD movie' do
      visit new_releases_url
      click_on_first :movie
      click_on_first_purchase_option
      page.wait_until_present 'first_purchase_option'
      within('#purchase_submit_action') {click_button 'Alquilar'}
      page.wait_until_present 'Expira en'
      expect(page).to have_content 'Expira en'
    end

    it 'is cancelled from selection' do
      login
      visit settings_url
      find('#main .sub-nav').click_link 'Selection'
      click_link 'Vas a darte de baja de Selection, ¿estás seguro?'
      click_link 'Sí, confirmar.'
      expect(page).to have_content 'Tu subscripción ha sido cancelada con éxito'
    end
  end
end