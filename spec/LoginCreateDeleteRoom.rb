require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "LoginCreateDeleteARoom" do

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
  
  it "test_login_create_delete_a_room" do
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "Sign in").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "password"
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "d@123.com"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Create your own room").click
    @driver.find_element(:id, "room_name").clear
    @driver.find_element(:id, "room_name").send_keys "Tea & Cookies"
    @driver.find_element(:id, "room_description").clear
    @driver.find_element(:id, "room_description").send_keys "yum"
    @driver.find_element(:id, "room_private").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_date_3i")).select_by(:text, "8")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_time_4i")).select_by(:text, "06")
    @driver.find_element(:id, "room_location").clear
    @driver.find_element(:id, "room_location").send_keys "England"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "My Profile").click
    @driver.find_element(:link, "Home page").click
    @driver.find_element(:link, "Browse rooms").click
    @driver.find_element(:xpath, "(//a[contains(text(),'Destroy')])[6]").click
    close_alert_and_get_its_text().should =~ /^Are you sure[\s\S]$/
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
