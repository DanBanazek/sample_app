require 'spec_helper'



describe "Static pages" do
subject {page}

let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  describe "Home page" do
   before {visit root_path}
     #it "should have the h1 'Sample App'" do
      #visit root_path
      it{should have_content('Sample App')}
      it{ should have_title("Ruby on Rails Tutorial Sample App")}
    end

  describe "Help page" do
    before {visit help_path}
    it {should have_content('Help')}
	#it { should have_title("#{base_title} | Help")}
	it {should have_title(full_title('Help'))}
  end

  describe "About page" do
	before {visit about_path}
    it {should have_content('About Us')}
	it {should have_title("#{base_title} | About Us")}
	#it "should have the content 'About Us'" do
      #visit about_path     
	#	expect(page).to have_content('About Us')
    #end

    #it "should have the title 'About Us'" do
    #  #visit about_path      
	 # expect(page).to have_title("#{base_title} | About Us")
    #end
  end
  
  describe "Contact page" do
   before {visit contact_path}
   it {should have_content('contact page')}
   it {should have_title("#{base_title} | Contact")}

end

end #end of main static pages do

