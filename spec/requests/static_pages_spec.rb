require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      expect(full_title("foo")).to match(/foo/)
    end

    it "should include the base title" do
      expect(full_title("foo")).to match(/^Ruby on Rails Tutorial Sample App/)
    end

    it "should not include a bar for the home page" do
      expect(full_title("")).not_to match(/\|/)
    end
  end
end

describe "Static pages" do
subject {page}

shared_examples_for "all static pages" do
	it {should have_selector('h1', text: heading) }
	it {should have_title(full_title(page_title)) }
end

it "should have the right links" do
	visit root_path
	click_link "About"
	expect(page).to have_title(full_title('About Us'))
	click_link "Help"
	expect(page).to have_title(full_title('Help'))
	click_link "Home"
	expect(page).to have_title(full_title(''))
end

let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  describe "Home page" do
   before {visit root_path}
     let(:heading) {'Sample App'}
	 let(:page_title) {''}
	 
	 it_should_behave_like "all static pages"
	 it {should_not have_title('| Home')}
	  #it "should have the h1 'Sample App'" do
      #visit root_path
      #it{should have_content('Sample App')}
      #it{ should have_title("Ruby on Rails Tutorial Sample App")}
    end

  describe "Help page" do
    before {visit help_path}
    let(:heading) {'Help'}
	let(:page_title){'Help'}
	it_should_behave_like "all static pages"
	#it {should have_content('Help')}
	#it { should have_title("#{base_title} | Help")}
	#it {should have_title(full_title('Help'))}
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
   #it {should have_content('contact page')}
   it { should have_selector('h1', text: 'Contact') }
   it {should have_title("#{base_title} | Contact")}

end

end #end of main static pages do

