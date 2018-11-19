# before all
require 'bundler/setup'
require 'page-object'
require 'page-object/page_factory'
require 'date'
require 'active_support/time'
require 'active_support'

PageObject.default_element_wait = (15)

World(PageObject::PageFactory)

Before do |scenario|
  open_browser_and_maximize
end

After do |scenario|
  if scenario.failed?
    screenshot_file = "FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
    screenshot_file = File.join('report', screenshot_file)
    @browser.driver.save_screenshot(screenshot_file)
    embed(screenshot_file, 'image/png')
  else
    @browser.close
  end
end

def open_browser_and_maximize
  @browser = Watir::Browser.new :chrome
  width = @browser.execute_script('return screen.width;')
  height = @browser.execute_script('return screen.height;')
  @browser.driver.manage.window.move_to(0, 0)
  @browser.driver.manage.window.resize_to(width, height)
end