class HomePage
  include PageObject

  page_url ENV['PAGE_URL'] || 'https://es.rakuten.tv/'

  link(:login, href: '/sessions/sign_in')
  link(:register, href: '/registrations/new')
  div(:profile, css: '.nav__items__user__anchor.nav__items__user__anchor--unique span')
  span(:settings, css: '.icon__preferences')

  def open_settings
    move_to(self.profile_element)
    self.settings_element.click
  end

  private

  def move_to(element)
    @browser.driver.action.move_to(element.element.wd).perform
  end
end