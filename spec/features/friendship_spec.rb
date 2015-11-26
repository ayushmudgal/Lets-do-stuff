require "rails_helper"
require "pp"

feature "Friendship Tests" do
	
 scenario "Test Sending a Request" do 
 		user = create(:user, name: "Ayush", email: "ayushincnca@gmail.com", password: "hellohello")
 		user2 = create(:user, name: "Bob", email: "ayush@gmail.com", password: "hellohello")
 		visit "users/sign_in"
 		fill_in "Email", with: user.email
   	fill_in "Password", with: user.password
   	click_button "Log in"
   	visit "users/" + user2.id.to_s
   	click_link "Add Friend?"
   	expect(page).to have_content("Friend Request Sent")
      visit "/friends?user_id=100"
 end

 scenario "Test Accepting a Request" do 
 		user = create(:user, name: "Ayush", email: "ayushincnca@gmail.com", password: "hellohello")
 		user2 = create(:user, name: "Bob", email: "ayush@gmail.com", password: "hellohello")
 		visit "users/sign_in"
 		fill_in "Email", with: user.email
   	fill_in "Password", with: user.password
   	click_button "Log in"
   	visit "users/" + user2.id.to_s
   	click_link "Add Friend?"
   	expect(page).to have_content("Friend Request Sent")
   	click_link "Logout"
   	visit "users/sign_in"
 		fill_in "Email", with: user2.email
   	fill_in "Password", with: user2.password
   	click_button "Log in"
   	visit "users/" + user.id.to_s
   	expect(page).to have_content("Confirm friend?")
   	expect(page).to have_content("Delete Request")
   	click_link "Confirm friend?"
   	expect(page).to have_content("Already Friends")
 end

 scenario "Test Accepting a Request" do 
 		user = create(:user, name: "Ayush", email: "ayushincnca@gmail.com", password: "hellohello")
 		user2 = create(:user, name: "Bob", email: "ayush@gmail.com", password: "hellohello")
 		visit "users/sign_in"
 		fill_in "Email", with: user.email
   	fill_in "Password", with: user.password
   	click_button "Log in"
   	visit "users/" + user2.id.to_s
   	click_link "Add Friend?"
   	expect(page).to have_content("Friend Request Sent")
   	click_link "Logout"
   	visit "users/sign_in"
 		fill_in "Email", with: user2.email
   	fill_in "Password", with: user2.password
   	click_button "Log in"
   	visit "users/" + user.id.to_s
   	expect(page).to have_content("Confirm friend?")
   	expect(page).to have_content("Delete Request")
   	click_link "Delete Request"
   	expect(page).to have_content("Add Friend?")
   end

end