require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "JoinMakeJoin2Rooms" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_join_make_join2_rooms" do
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "Sign up").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "victorialo@berkeley.edu"
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "password"
    @driver.find_element(:id, "user_password_confirmation").clear
    @driver.find_element(:id, "user_password_confirmation").send_keys "password"
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "h@123.com"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Create your own room").click
    @driver.find_element(:id, "room_name").clear
    @driver.find_element(:id, "room_name").send_keys "Fun times"
    @driver.find_element(:id, "room_description").clear
    @driver.find_element(:id, "room_description").send_keys "fun fun"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_date_3i")).select_by(:text, "6")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_time_4i")).select_by(:text, "19")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_time_5i")).select_by(:text, "00")
    @driver.find_element(:id, "room_location").clear
    @driver.find_element(:id, "room_location").send_keys "Berkeley"
    @driver.find_element(:id, "room_category").clear
    @driver.find_element(:id, "room_category").send_keys "Entertainment"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Edit").click
    @driver.find_element(:link, "Back").click
    @driver.find_element(:link, "Browse rooms").click
    @driver.find_element(:link, "Show").click
    @driver.find_element(:link, "Join the room!").click
    @driver.find_element(:link, "My Profile").click
    @driver.find_element(:link, "Edit my profile").click
    @driver.find_element(:id, "user_name").clear
    @driver.find_element(:id, "user_name").send_keys "A"
    @driver.find_element(:id, "user_age").clear
    @driver.find_element(:id, "user_age").send_keys "19"
    @driver.find_element(:id, "user_location").clear
    @driver.find_element(:id, "user_location").send_keys "Berkeley"
    @driver.find_element(:id, "user_hobbies").clear
    @driver.find_element(:id, "user_hobbies").send_keys "ice skating"
    @driver.find_element(:id, "user_about_me").clear
    @driver.find_element(:id, "user_about_me").send_keys "Hi I'm a person. Or maybe I am a robot."
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Home page").click
    @driver.find_element(:link, "Create your own room").click
    @driver.find_element(:id, "room_name").clear
    @driver.find_element(:id, "room_name").send_keys "Boring times"
    @driver.find_element(:id, "room_description").clear
    @driver.find_element(:id, "room_description").send_keys "I'm bored"
    @driver.find_element(:id, "room_private").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_date_3i")).select_by(:text, "6")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_time_4i")).select_by(:text, "23")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_time_5i")).select_by(:text, "10")
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Join the room!").click
    @driver.find_element(:link, "Join the room!").click
    @driver.find_element(:link, "My Profile").click
    @driver.find_element(:link, "Home page").click
    @driver.find_element(:link, "Browse rooms").click
    @driver.find_element(:link, "Home").click
    @driver.find_element(:link, "Logout").click
  end
  
  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    ${receiver}.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
