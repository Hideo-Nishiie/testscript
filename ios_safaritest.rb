require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'
require 'appium_lib'

#CFM ={}
#CFM["ai"]="test-ai-classifier"

class OpenUrlTest < Test::Unit::TestCase
    def setup
        opts = {
            caps: {
                userName: "vesremote",
                password: "vesves1109",
                deviceName: 'iPhone 6',
                platformName: 'iOS',
                browserName: 'Safari',
                #customFindModules: CFM,
                #shouldUseCompactResponses: false
            },
            appium_lib: {
                server_url: 'https://gwjp.appkitbox.com/wd/hub',
                wait: 60
            }
        }
        @driver = Appium::Driver.new(opts).start_driver
    end

    def teardown
        @driver.quit()
    end

    def test_google_search
        puts @driver.capabilities['snapshotUrl']
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
        sleep(5)
        @driver.save_screenshot('capture_02.png')

        # Get value
        value = @driver.find_element(:name, 'q').value
        puts "Text field value=" + value
        assert_equal true, value == "Remote testKit"
    end
end
