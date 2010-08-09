require "stories_helper"

class SiteTest < Test::Unit::TestCase  
  
  story "As a developer I want to see the homepage so I know Monk is correctly installed" do
    scenario "A visitor goes to the homepage" do
      visit "/"
      assert_contain "Bitch Kitty Racing"
    end 
       
    scenario "A visitor goes to the January page" do
      visit "/months/january"
      assert_contain "January"
    end  
        
    scenario "A visitor should see a 404 for a page that does not exist" do
      visit "/folder/testing"
      assert_contain "Sorry, the page /folder/testing could not be found"
    end
  end    

end
