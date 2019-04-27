require 'selenium-webdriver'
require './src/main/core/Webdriver'
require './src/test/step_defination/Home'
require './src/test/step_defination/SearchResult'
require './src/test/step_defination/FreelancerProfile'

class ScenarioTest


  def test_all_scenario


    # creating core_webdriver object
    web_driver = Webdriver.new

    # calling function of webdriver class
    web_driver.driver_initialize
    web_driver.clearing_all_browser_cookies
    web_driver.redirect_to_website

    # creating step definition home object to use
    home = Home.new

    # calling function to use home functions
    home.search_keyword_freelancer
    home.click_search_icon

    # creating search result object
    search_result = SearchResult.new

    # calling their function
    search_result.fetching_freelancer_data
    search_result.compare_freelancers_with_keyword

    # creating freelancer profile object
    freelancer_profile = FreelancerProfile.new

    # calling their function to
    freelancer_profile.generate_rand_freelancer
    freelancer_profile.click_on_freelancer_profile
    freelancer_profile.fetch_profile_data
    freelancer_profile.compare_profile_data

    #Finally call driver quit function to quit the browser
    web_driver.driver_quit

  end

  test = ScenarioTest.new
  test.test_all_scenario

end