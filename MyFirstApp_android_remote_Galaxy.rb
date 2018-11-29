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
                userName:"vesremote",
                password:"vesves1109",
                #accessToken: "jKvv93Fx1f5Umw2vEYHHjpXHYEtev9ybMuGEm9YFbt3J0rW0xXy1dfCogUgU8EZa",
                appPackage: "com.example.ves_e147.myfirstapp",
                appActivity: "com.example.ves_e147.myfirstapp.MainActivity",
                platformName: "Android",
                automationName: "Appium",
                platformVersion: "8",
                deviceName: "Galaxy S9",
                noSessionOverwriting: true,
                app: 'https://github.com/Hideo-Nishiie/MyFirstApp/raw/master/app-debug.apk'
                },
               appium_lib: { 
               sauce_username: nil,
                             sauce_access_key: nil,
                             server_url: 'https://gwjp.appkitbox.com/wd/hub',
                             wait:60 } }
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
    puts driver.capabilities['snapshotUrl']
    driver.save_screenshot('Galaxy\\capture_00.png')
    el1 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/editText")
    el1.send_keys "aaa"
    
    #puts driver.capabilities['snapshotUrl']
    driver.save_screenshot('Galaxy\\capture_01.png')
    el2 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/button")
    el2.click
    
    el3 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/textView")
    
    assert_equal "aaa", el3.attribute('text')
    #puts driver.capabilities['snapshotUrl']
    driver.save_screenshot('Galaxy\\capture_02.png')
    
    #el4 = driver.find_element(:accessibility_id, "Navigate up")
    #el4.click


  end
end