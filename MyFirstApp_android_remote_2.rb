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


t=Time.now
str = t.strftime("%y%b%d%H%M%S")

RTK_DIRECTORY= ARGV[0]+"\\"+str
RTK_DEVICE = ARGV[0]+" "+ARGV[1]
RTK_VERSION = ARGV[2]

puts RTK_DIRECTORY
puts RTK_DEVICE


Dir::mkdir(RTK_DIRECTORY)


class SettingsTest < Test::Unit::TestCase
  def setup
    caps   = { caps:
           {
                userName:"vesremote",
                password:"vesves1109",

                appPackage: "com.example.ves_e147.myfirstapp",
                appActivity: "com.example.ves_e147.myfirstapp.MainActivity",
                platformName: "Android",
                automationName: "Appium",
                platformVersion: RTK_VERSION,
                deviceName: RTK_DEVICE,
                noSessionOverwriting: true,
                app: 'sample.apk'
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
    driver.quit
    puts "Test End "+RTK_DIRECTORY
    #sleep(60)
  end

  def test_key_input
    puts "### Test test_key_input start "+RTK_DIRECTORY
    # 
    # 
    puts driver.capabilities['snapshotUrl']
    driver.save_screenshot(RTK_DIRECTORY+'\\capture_00.png')
    el1 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/editText")
     puts "#### key in"
    el1.send_keys "xyz"
    
    #puts driver.capabilities['snapshotUrl']
    driver.save_screenshot(RTK_DIRECTORY+'\\capture_01.png')
    el2 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/button")
    el2.click
    
    el3 = driver.find_element(:id, "com.example.ves_e147.myfirstapp:id/textView")
    puts "### verify"
    assert_equal "xyz", el3.attribute('text')
    #puts driver.capabilities['snapshotUrl']
    driver.save_screenshot(RTK_DIRECTORY+'\\capture_02.png')
    
    #el4 = driver.find_element(:accessibility_id, "Navigate up")
    #el4.click


  end
end