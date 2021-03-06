# gem install selenium-webdriver
# gem install appium_lib
# export RTK_USERNAME=xxxx
# export RTK_PASSWORD=xxxx

require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'
require 'appium_lib'



class ContactsAndroidTests < Test::Unit::TestCase
  def setup
    opts = {
      caps: {
        # get userName, password from Environment variable
        userName: "vesremote",
        password: "vesves1109",
        deviceName: 'iPhone 7 Plus',
        platformName: 'iOS',
        platformVersion: '11',
        bundleId: 'com.apple.calculator'
      },
      appium_lib: {
        server_url: 'https://gwjp.appkitbox.com/wd/hub',
        wait: 60
      }
    }
    @driver = Appium::Driver.new(opts).start_driver
  end

  def teardown
    @driver.quit
  end

  def test_google_search
    puts @driver.capabilities['snapshotUrl']
    @driver.save_screenshot('capture_01.png')

    el1 = @driver.find_element(:accessibility_id, '1')
    puts el1
    el1.click
    @driver.save_screenshot('capture_02.png')

    is_lang_english = true
    begin
      el2 = @driver.find_element(:accessibility_id, 'multiply')
      puts el2
      el2.click
    rescue StandardError
      is_lang_english = false
      el2 = @driver.find_element(:accessibility_id, '乗算')
      puts el2
      el2.click
    end
    @driver.save_screenshot('capture_03.png')

    el3 = @driver.find_element(:accessibility_id, '3')
    puts el3
    el3.click
    @driver.save_screenshot('capture_04.png')

    el2.click
    @driver.save_screenshot('capture_05.png')

    el3.click
    @driver.save_screenshot('capture_06.png')

    if is_lang_english
      el4 = @driver.find_element(:accessibility_id, 'equals')
      puts el4
      el4.click
      @driver.save_screenshot('capture_07.png')

      el5 = @driver.find_element(:accessibility_id, 'Result')
      puts el5
      value = el5.attribute('value')

      puts 'Text field value=' + value
      assert_equal(value, '9')

      el6 = @driver.find_element(:accessibility_id, 'clear')
      puts el6
      el6.click
      @driver.save_screenshot('capture_08.png')

    else
      el4 = @driver.find_element(:accessibility_id, '計算実行')
      puts el4
      el4.click

      el5 = @driver.find_element(:accessibility_id, '結果')
      puts el5
      value = el5.attribute('value')

      puts 'Text field value=' + value
      assert_equal(value, '9')

      el6 = @driver.find_element(:accessibility_id, '消去')
      puts el6
      el6.click
      @driver.save_screenshot('capture_08.png')
    end
  end
end