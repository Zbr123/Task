require 'selenium-webdriver'

class SearchResultPage

  FREELANCERS_CSS = 'section.air-card-hover'
  TITLE_CSS = 'h4.freelancer-tile-title'
  ALL_INTERNAL_CSS ='.row .col-xs-12'
  DESCRIPTION_CSS = '.d-lg-block'
  SKILLS_CSS = '.row a.o-tag-skill'
  NAME_CSS ='a.freelancer-tile-name'

  def get_freelancer
    $web_driver.find_elements(css: FREELANCERS_CSS)
  end

  def get_title
    $web_driver.find_element(css: TITLE_CSS)
  end

  def get_internal
    $web_driver.find_element(css: ALL_INTERNAL_CSS)
  end

  def get_description
    $web_driver.find_element(css: DESCRIPTION_CSS)
  end

  def get_skills
    $web_driver.find_element(css: SKILLS_CSS)
  end

  def get_name
    $web_driver.find_element(css: NAME_CSS)
  end

end
