When(/^I click on the movie/) do
  on(HomePage).movies_elements[0].click
end

And(/^I click watch now button$/) do
  on(ContentInfoPage).detail_actions_purchase.click
end

And(/^I click Buy$/) do
  on(ContentInfoPage).click_buy
end

And(/^I confirm$/) do
  on(ContentInfoPage).submit_element.click
end

And(/^I click (.*)$/) do |action|
  on(ContentInfoPage).click(action.to_sym)
end

Then(/^I have the movie marked as (.*) in my video store$/) do |action|
  on(HomePage).open_video_store
  # need to check that movie is added to the correct section - rent or buy, but I don't have a credit card at the moment:)
  # on(LibraryPage).check_movie(action)
end