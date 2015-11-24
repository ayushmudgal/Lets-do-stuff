require "rails_helper"
require "pp"

feature "All Features Test" do
	
 scenario "Create Good New User" do 
   visit "/users/sign_up"     
   fill_in "Name", with: "Ayush"
   fill_in "Password", with: "12345678", match: :prefer_exact
   fill_in "Password confirmation", with: "12345678", match: :prefer_exact
   fill_in "Email", with: "ayushincnca@gmail.com"
   click_button "Sign up"
   expect(current_path).to eq "/"
 end

 scenario "invalid email new user" do
   user = FactoryGirl.build_stubbed(:user) 
   visit root_path
   visit "users/sign_up"
      
   fill_in "Name", with: user.name
   fill_in "Password", with: user.password, match: :prefer_exact
   fill_in "user_email", with: "ayushincnca@berkeley.edu"   
   click_button "Sign up"    
   expect(current_path).to eq "/users"
 end

 scenario "invalid sign in" do
   visit root_path 
   visit "/users/sign_in"
   fill_in "Email", with: "ayushincnca@gmail.com"
   fill_in "Password", with: "1234"
   click_button "Log in"
   expect(page).to have_content("Log in")
 end
end
