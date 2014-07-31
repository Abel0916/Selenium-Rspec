#encoding: utf-8
require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'yaml'

require File.dirname(__FILE__) + '/../action/login_main_page'
require File.dirname(__FILE__) + '/../tool/login_dialog'

describe "BIM 360 Field Web Login" do
  include LoginDialog
  before(:each) do
    @go=YAML.load(File.open(File.dirname(__FILE__) + '/../config/login_data.yml'))
    @dr=Selenium::WebDriver.for :chrome
    @url=@go["data"]["mainPage"]["url"]
    @dr.get @url
    #@dr.manage.timeouts.page_load = 30
    @login_element=LoginMainPage.new(@dr)
  end

	it "Input wrong email address" do
    @login_element.login(@go["data"]["login"]["emailwrong"]["username"],@go["data"]["login"]["emailwrong"]["password"])
    expect(err_msg).to eq("Your email address or password is incorrect.")
    sleep 1
    @dr.close()
    #@msg.should eql ("Your email address or password is incorrect.")
  end

  it "Input wrong password" do
    @login_element.login(@go["data"]["login"]["passwordwrng"]["username"],@go["data"]["login"]["passwordwrng"]["password"])
    expect(err_msg).to eq("Your email address or password is incorrect.")
    sleep 1
    @dr.close()
  end

  it "Login Successfully" do
    @login_element.login(@go["data"]["login"]["correct"]["username"],@go["data"]["login"]["correct"]["password"])
    sleep 30
    @dr.close()
  end
end
