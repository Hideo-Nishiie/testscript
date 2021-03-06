# this test show you how to use scroll and locate element by xpath
# it open the system settings ui, and click the 'About phone' item to find android version
# create by testerhome.com
# author: seveniruby
#
# run using:
# bundle exec ruby xunit_android.rb

require 'rubygems'
require 'test/unit'
require 'appium_lib'

class SettingsTest < Test::Unit::TestCase
  def setup
    caps   = { caps:       { platformName: 'Android',
                             deviceName: 'Nexus 5',
                             appActivity: '.Settings',
                             appPackage: 'com.android.settings' },
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

  def test_about_phone_version
    # This may be 'About phone' or 'About tablet'
    # search for About to work on both phones & tablets.
    scroll_to('端末情報').click
    android_version = 'Androidバージョン'
    scroll_to android_version

    view    = 'android.widget.TextView'
    version = xpath(%Q(//#{view}[preceding-sibling::#{view}[@text="#{android_version}"]])).text
    valid   = !version.match(/\d/).nil?

    puts "Version is: #{version}"
    assert_equal true, valid
  end
end