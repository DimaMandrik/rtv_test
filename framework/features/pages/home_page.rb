class HomePage
  include PageObject

  page_url ENV['PAGE_URL'] || 'https://es.rakuten.tv/'

  link(:login, xpath: "//div[@class='nav__items__user nav__items__user--notlogged']/a[@href='/sessions/sign_in']")
  link(:register, href: '/registrations/new')
  span(:profile, css: '.nav__items__user__anchor.nav__items__user__anchor--unique span')
  span(:library, css: 'span.icon__library')
  span(:settings, css: 'span.icon__preferences')
  divs(:movies, css: '.scrollable__items .list__item.list__item--movies')

  def open_video_store
    move_to(self.profile_element)
    self.library_element.click
  end

  def open_settings
    move_to(self.profile_element)
    self.settings_element.click
  end

  private

  def move_to(element)
    @browser.driver.action.move_to(element.element.wd).perform
  end
end