class ContentInfoPage
  include PageObject

  div(:detail_actions_purchase, css: '.detail__actions__purchase')
  divs(:buttons, css: '.button.button--combined.button--full')
  div(:submit, css: 'div.form__submit')

  def click_buy
    if self.buttons_elements.length == 2
      self.buttons_elements[1].click
    elsif self.buttons_elements.length == 3
      self.buttons_elements[2].click
    end
  end

  def click_rent
    if self.buttons_elements.length == 3
      self.buttons_elements[1].click
    end
  end

  def click(action)
    case action
    when :buy
      self.click_buy
    when :rent
      self.click_rent
    else
      raise ArgumentError, 'incorrect parameter'
    end
  end
end
