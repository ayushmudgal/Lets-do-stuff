require "rails_helper"
require "pp"

feature "Sign Up/Sign In Test" do
	
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
   expect(page).to have_content("Log In")
 end

  scenario "Valid sign in" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   expect(page).to have_content("Let's Do Stuff!")
 end

 scenario "Edit a User" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   anotheruser = create(:user, email: "ayush@gmail.com", password: "hellohello")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   expect(page).to have_content("Let's Do Stuff!")
   visit "users/" + user.id.to_s + "/edit"
   expect(current_path).to eq "/users/" + user.id.to_s + "/edit"  
   fill_in "Name", with: "newname"
   click_button "Update User"
   expect(page).to have_content("newname")
   visit "/users/" + anotheruser.id.to_s + "/edit"
   expect(current_path).to eq "/" 
 end
end
