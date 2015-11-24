require "rails_helper"
require "pp"

feature "All Features Test" do
	scenario "check if it direct to new login page for hardlink to new pin path" do
    visit pins_new_path  
    expect(current_path).to eq "/login"
  end

	scenario("check if u can access new user link from home") do
    visit root_path
    click_link('Signupbutton')
    expect(page).to have_content "SIGN UP"
  end    

 scenario "create valid new user" do 
   user = FactoryGirl.build_stubbed(:user, email: "ki.ey.kouch@berkeley.edu")
   visit "/signup"     
   fill_in "user_username", with: user.username
   fill_in "user_password", with: user.password
   fill_in "user_email", with: user.email   
   click_button "Create an account"
   expect(current_path).to eq "/"
 end

 scenario "invalid email new user" do
   user = FactoryGirl.build_stubbed(:user) 
   visit root_path
   visit "/signup"
      
   fill_in "user_username", with: user.username
   fill_in "user_password", with: user.password
   fill_in "user_email", with: user.email   
   click_button "Create an account"    

   expect(current_path).to eq "/signup"
 end

 scenario "valid login" do
   user = FactoryGirl.create(:user, email: "ki.ey.kouch@berkeley.edu")
   visit "/login"
   fill_in "session_email", :with => user.email
   fill_in "session_password", :with => user.password
   click_button "Continue"
   expect(page).to have_content("Welcome to Pinterview")
 end
end
