#encoding: utf-8
require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'yaml'

require File.dirname(__FILE__) + '/../action/login_main_page/'
require File.dirname(__FILE__) + '/../tool/login_dialog'

describe "BIM 360 Field Web Login" do
  include LoginDialog
  before(:each) do
    @go=YAML.load(File.open(File.dirname(__FILE__) + '/../config/login_data.yml'))
    @dr=Selenium::WebDriver.for :firefox
    @url=@go["data"]["mainPage"]["url"]
    @dr.get @url
    @login_element=LoginMainPage.new(@dr)
  end

  it "Login Successfully" do
    sleep 30
    @login_element.login(@go["data"]["login"]["correct"]["username"],@go["data"]["login"]["correct"]["password"])
    @pp=@dr.find_element(:xpath=>'html/body/div[1]/div/div[2]/div[2]').displayed?
    puts @pp
    @dr.quit()
  end
end
