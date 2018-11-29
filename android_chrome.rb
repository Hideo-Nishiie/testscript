require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'
require 'appium_lib'


class OpenUrlTest < Test::Unit::TestCase
    def setup
        opts = {
            caps: {
                platform: 'ANDROID',
                deviceName: 'CSCBB18803200115',
                platformName: 'Android',
                browserName: 'Chrome'
            },
            appium_lib: {
                server_url: 'http://localhost:4723/wd/hub',
                wait: 60
            }
        }
        @driver = Appium::Driver.new(opts).start_driver
    end

    def teardown
        @driver.quit
    end

    def test_google_search
        #puts @driver.capabilities['snapshotUrl'].sub('http://localhost:4723', 'https://gwjp.appkitbox.com')
        # Open URL
        url = "https://www.google.com/"
        puts "Open URL: " + url
        @driver.get(url)
        element = @driver.find_element(:name, 'q')
        sleep(5)
        @driver.save_screenshot('capture_01.png')

        # Input keys
        word = "Remote testKit"
        puts "Input Keys: " + word
        element.send_keys(word)
        element.submit
        
        #els = @driver.find_element(:custom,'ai:search')
        #els.click
        #el5 = @driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[5]/android.view.View[1]/android.view.View/android.view.View[2]/android.widget.Button[2]")
        #el5.click

        sleep(5)
        @driver.save_screenshot('capture_02.png')

        # Get value
        value = @driver.find_element(:name, 'q').value
        puts "Text field value=" + value
        assert_equal true, value == "Remote testKit"
    end
end