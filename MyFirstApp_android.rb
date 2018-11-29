# this test show you how to use scroll and locate element by xpath
# it open the system settings ui, and click the 'About phone' item to find android version
# create by testerhome.com
# author: seveniruby
#
# run using:
# bundle exec ruby xunit_android.rb

require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'
require 'appium_lib'

class SettingsTest < Test::Unit::TestCase
  def setup
    caps   = { caps:
           {
                "appPackage": "com.example.ves_e147.myfirstapp",
                "appActivity": "com.example.ves_e147.myfirstapp.MainActivity",
                "platformName": "Android",
                "automationName": "Appium",
                "platformVersion": "9",
                "deviceName": "emulator-5554",
                "app": "C:\\Users\\ves-e147\\AndroidStudioProjects\\MyFirstApp\\app\\build\\outputs\\apk\\debug\\app-debug.apk"
                },
               appium_lib: { sauce_username: nil,
                             sauce_access_key: nil,
                             server_url: 'http://localhost:4723/wd/hub', } }
    driver = Appium::Driver.new(caps, true)
    Appium.promote_appium_methods self.class
    driver.start_driver.manage.timeouts.implicit_wait = 20 # seconds
  end

  def teardown
    driver_quit
  end

  def test_key_input
    puts "Test test_key_input start"
    # 
    # 
    driver.save_screenshot('capture_00.png')
    el1 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/editText")
    el1.send_keys "aaa"
    driver.save_screenshot('capture_01.png')
    el2 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/button")
    el2.click
    
    el3 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/textView")
    
    assert_equal "aaa", el3.attribute('text')
    puts driver.capabilities['snapshotUrl']
    driver.save_screenshot('capture_02.png')
    
    el4 = driver.find_element(:accessibility_id, "Navigate up")
    el4.click


  end
end