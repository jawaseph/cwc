require 'spec_helper'

# describe "StaticPages" do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end

describe "Static pages" do

	let(:base_title) { "Coffee with a Creeper" }

  	describe "Home page" do
		context "my context", :type => :feature do	
		    it "should have the content 'Coffee with a Creeper'" do
		      visit root_path
		      expect(page).to have_content( 'Coffee with a Creeper')
		    end

		    # it "should have the title 'Home'" do
		    #   visit '/static_pages/home'
		    #   expect(page).to have_title( "#{base_title} | Home")
		    # end
		end	
	end



  	describe "About page" do
	  	context "my context", :type => :feature do
		    it "should have the content 'About Us'" do
		      visit about_path
		      expect(page).to have_content('About Us')
		    end

		    it "should have the title 'About Us'" do
		      visit about_path
		      expect(page).to have_title("#{base_title} | About Us")
		    end
		end
  	end



	describe "Home page" do
	context "my context", :type => :feature do	
    it "should have the content 'Coffee with a Creeper'" do
      visit root_path
      expect(page).to have_content('Coffee with a Creeper')
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Coffee with a Creeper")
    end

    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
	end
  end
  	
end