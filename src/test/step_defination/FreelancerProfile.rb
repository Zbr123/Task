require 'selenium-webdriver'
require './src/main/page/FreelancerProfilePage'

class FreelancerProfile

  # this function generate random freelancer
  def generate_rand_freelancer
    puts "Step 8: Generating random freelancer"
    length = $freelancers_card.length
    freelancer_or_not = []
    $freelancers_card_data.each_with_index do |x, index|
      if x[:link].match(/profiles/)
        freelancer_or_not << [index, x]
      end
    end
    allowed_indexes = freelancer_or_not.collect{|x, y| x}
    @index = allowed_indexes.shuffle.first
    $freelancer = $freelancers_card[@index]
    puts "Random freelancer generated"

  end

  def profile_tile123
    freelance_profile_page = FreelancerProfilePage.new
    freelance_profile_page.get_freelancer_title_name.last
  end

  #this function will click on the freelancer
  def click_on_freelancer_profile
    puts "Step 9: Click on Freelancer Profile"
    $freelancer.find_elements(css: "a.freelancer-tile-name").last.click
    puts "Freelancer Profile clicked successfully"

  end

  def get_profile
    freelance_profile_page = FreelancerProfilePage.new
    @profile=freelance_profile_page.get_profile_header
  end

   #this function will fetch all profile data of selected freelancer
  def fetch_profile_data
    puts "Step 10: Extracting freelancer profile data"
    freelance_profile_page = FreelancerProfilePage.new
    data = freelance_profile_page.get_profile_header
    data2 = data.find_element(css: ".overlay-container")
    title = data2.find_element(css: "h3").text
    description = data2.find_elements(css: "o-profile-overview").first.text
    skills = freelance_profile_page.get_profile_skills.collect{|t| t.text}

    @profile_data = {
        title: title,
        description: description,
        skills: skills
    }
    puts "Profile data extracted successfully"
  end

  #this function will compare freelancer data
  def compare_profile_data
    puts "Step 11: Comparing Freelancer Profile data"
    parent = $freelancers_card_data[@index]
    child = @profile_data
    puts "for freelancer #{parent[:name]}, comparing results page fields with internal page fields:"
    [:description, :title, :skills].each do |field|
      verify_details(parent, child, field, parent[:name])
    end
    puts "All results are printed successfully"

  end

  #this function verify details
  def verify_details(parent, child, field, name)
    if parent[field] == child[field]
      puts "\t#{field.to_s} matches for #{name} on both results page and internal page"
    else
      puts "\t#{field.to_s} does not match for #{name} on results page vs internal page"
    end
  end

end
