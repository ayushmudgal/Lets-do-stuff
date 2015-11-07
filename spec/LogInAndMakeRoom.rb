require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "LogInAndMakeRoom" do

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
  
  it "test_log_in_and_make_room" do
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "Sign in").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "password"
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "letrainfalldown@gmail.com"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Create your own room").click
    @driver.find_element(:id, "room_name").clear
    @driver.find_element(:id, "room_name").send_keys "Mediocre times"
    @driver.find_element(:id, "room_description").clear
    @driver.find_element(:id, "room_description").send_keys "I'm meh."
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "room_time_4i")).select_by(:text, "07")
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Back").click
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
