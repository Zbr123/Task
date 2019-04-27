require 'selenium-webdriver'

class HomePage

  SEARCH_BAR_CSS = '#layout .navbar-form input.ng-empty'
  SEARCH_ICON_CSS = '#layout .m-sm-left.m-0-right'

  def get_search_bar
  sleep 5
  $web_driver.find_element(css: SEARCH_BAR_CSS)
  end

  def get_search_icon
  $web_driver.find_element(css:SEARCH_ICON_CSS)
  end
end
