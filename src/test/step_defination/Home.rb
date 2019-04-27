require 'selenium-webdriver'
require './src/main/page/HomePage'

class Home

  # this funtion will search the keyword provide in the global var $keyword
  def search_keyword_freelancer
    puts "Step 4: Searching keyword"
    sleep 3
    homepage = HomePage.new
    homepage.get_search_bar.send_keys($keyword)
  end

  # this funtion will click on magnifying glass button (search button)
  def click_search_icon
    puts "Step 5: Click on magnifying glass button"
    homepage = HomePage.new
    homepage.get_search_icon.click
    puts "Keyword searched successfully"
  end


end