require 'selenium-webdriver'
require './src/main/page/SearchResultPage'

class SearchResult

  # this function fetch all data from the page
  def fetching_freelancer_data
    puts "Step 6: Fetching all freelancer data from the page"
    sleep 5

    $freelancers_card = $web_driver.find_elements(css: "section.air-card-hover")
    $freelancers_card_data = $freelancers_card.collect{|t|

      # it will get the text the locator and store in the function
      title = t.find_element(css: "h4.freelancer-tile-title").text
      all_internal = t.find_element(css: ".row .col-xs-12").text
      description = t.find_elements(css: ".d-lg-block").last.text
      skills = t.find_elements(css: ".row a.o-tag-skill").collect{|y| y.text}
      name = t.find_elements(css: "a.freelancer-tile-name").last.text

      {
          title: title,
          all_internal: all_internal,
          description: description,
          skills: skills,
          link: t.find_elements(css: "a.freelancer-tile-name").last.attribute("href"),
          name: name
      }
    }
    puts "All data fetch successfully"
  end

  #this function campare freelancer with keyword provided.
  def compare_freelancers_with_keyword

    puts "Step 7: Comparing Freelancer with Keyword value"
    $freelancers_card_data.each_with_index do |f, i|
      puts "freelancer #{i} (#{f[:name]})"
      fields.each do |fi|
        if f[fi].to_s.match(/#{$keyword}/i)
          puts "\t#{fi} matches #{$keyword}"
        else
          puts "\t#{fi} does not match #{$keyword}"
        end
      end
      puts
    end
    puts "All results printed successfully"
  end

  def fields
    [:description, :title, :skills]
  end

end
