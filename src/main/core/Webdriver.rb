require 'selenium-webdriver'

class Webdriver

  # this Keyword global variable sets the <keyword> all around the application
  $keyword = "helloWorld"

  # initialize driver for firefox
  def driver_initialize
   puts "Step 1: Opening firefox browser"
   options = Selenium::WebDriver::Firefox::Options.new()
   $web_driver = Selenium::WebDriver.for(:firefox, options: options)
 end

  # this funtion will redirect website to upwork url
  def redirect_to_website
   puts "Step 3: Re-directed to upwork website"
   $web_driver.get("https://www.upwork.com")
   sleep 5
 end

  # this function will clear all browser cookies
 def clearing_all_browser_cookies
   puts "Step 2: Deleting All Cookies"
   $web_driver.manage.delete_all_cookies if($web_driver.manage.respond_to? :delete_all_cookies)
   puts "All Cookies are deleted"
 end

  # quit driver and close firefox browser
 def driver_quit
   puts "Step 12: Closing Firefox browser"
   $web_driver.quit
 end

end
