require 'selenium-webdriver'

class FreelancerProfilePage


  FREELANCER_PROFILE_CSS = 'a.freelancer-tile-name'
  PROFILE_HEADER_CSS = '.fe-profile-header'
  PROFILE_CONTAINER_CSS = '.overlay-container'
  PROFILE_TITLE_CSS= 'h3'
  PROFILE_DESCRIPTION_CSS = 'o-profile-overview'
  PROFILE_SKILLS_CSS = 'cfe-profile-skills-integration a.o-tag-skill'

  def get_profile_header
    $web_driver.find_element(css: PROFILE_HEADER_CSS)
  end

  def get_profile_container
    $web_driver.find_element(css:PROFILE_CONTAINER_CSS)
  end

  def get_profile_skills
    $web_driver.find_elements(css:PROFILE_SKILLS_CSS)
  end

  def get_profile_description
    $web_driver.find_element(css:PROFILE_DESCRIPTION_CSS)
  end

  def get_profile_title
    $web_driver.find_element(css:PROFILE_TITLE_CSS)
  end

  def get_freelancer_title_name
    $web_driver.find_element(css:FREELANCER_PROFILE_CSS)
  end

end
