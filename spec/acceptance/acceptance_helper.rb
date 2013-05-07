require 'spec_helper'
module WebHelpers
  def click_css(selector)
    page.find(selector).click
  end
end

RSpec.configure do |config|
  Capybara.javascript_driver = :webkit
  config.include WebHelpers
end
