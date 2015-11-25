require "rails_helper"
require "pp"

feature "Categories and Room Test" do
	
 scenario "Valid Create a New Room Route" do 
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   category = create(:category, name: "Wii")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   click_link "Wii"
   click_link "Create New Room"
   expect(current_path).to eq "/rooms/new"
 end

 scenario "Creating an invalid Room" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   category = create(:category, name: "Wii")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   click_link "Wii"
   click_link "Create New Room"
   fill_in "Name", with: "New Room New Room"
   click_button "Create Room"
   expect(page).to have_content("New Room")
 end

 scenario "Create a Valid Room" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   category = create(:category, name: "Wii")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   click_link "Wii"
   click_link "Create New Room"
   fill_in "Name", with: "New Room New Room"
   fill_in "Description", with: "I heart this room"
   fill_in "Zip", with: "12345"
   click_button "Create Room"
   route = "/rooms/" + Room.last.id.to_s
   expect(current_path).to eq route 
 end

  scenario "Successfully Leave and Join the Room" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   category = create(:category, name: "Wii")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   click_link "Wii"
   click_link "Create New Room"
   fill_in "Name", with: "New Room New Room"
   fill_in "Description", with: "I heart this room"
   fill_in "Zip", with: "12345"
   click_button "Create Room"
   click_link "Leave room!"
   expect(page).to have_content("Join room!")
   click_link "Join room!"
   expect(page).to have_content("Leave room!")
   route = "/rooms/" + Room.last.id.to_s
   expect(current_path).to eq route 
 end

 scenario "Edit available to the creator" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   category = create(:category, name: "Wii")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   click_link "Wii"
   click_link "Create New Room"
   fill_in "Name", with: "New Room New Room"
   fill_in "Description", with: "I heart this room"
   fill_in "Zip", with: "12345"
   click_button "Create Room"
   route = "/rooms/" + Room.last.id.to_s
   expect(page).to have_content("Edit")
   expect(page).to have_content("Delete")
end

scenario "Edit and Delete not available to non-creators" do
   visit root_path 
   visit "/users/sign_in"
   user = create(:user, email: "ayushincnca@gmail.com", password: "hellohello")
   category = create(:category, name: "Wii")
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Log in"
   click_link "Wii"
   click_link "Create New Room"
   fill_in "Name", with: "New Room New Room"
   fill_in "Description", with: "I heart this room"
   fill_in "Zip", with: "12345"
   click_button "Create Room"
   route = "/rooms/" + Room.last.id.to_s
   expect(page).to have_content("Logout")
   click_link "Logout"
   click_link "Sign In"
   newuser = create(:user, email: "newuser@gmail.com", password: "hellohello")
   fill_in "Email", with: newuser.email
   fill_in "Password", with: newuser.password
   click_button "Log in"
   click_link "Wii"
   expect(page).not_to have_content("Edit")
   expect(page).not_to have_content("Delete")
end 


end
