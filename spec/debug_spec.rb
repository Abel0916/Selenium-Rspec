#encoding: utf-8
require 'rspec'
require 'rubygems'
require 'selenium-webdriver'
require 'yaml'

require File.dirname(__FILE__) + '/../action/login_main_page'
require File.dirname(__FILE__) + '/../tool/login_dialog'

describe 'Case1' do
  include LoginDialog
  before(:each) do
    @go=YAML.load(File.open(File.dirname(__FILE__) + '/../config/login_data.yml'))
    @dr=Selenium::WebDriver.for :firefox
    @url=@go["data"]["mainPage"]["url"]
    @dr.get @url
    @login_element=LoginMainPage.new(@dr)
  end

  it "Input wrong password" do
    @login_element.login(@go["data"]["login"]["passwordwrng"]["username"],@go["data"]["login"]["passwordwrng"]["password"])
    expect(err_msg).to eq("Your email address or password is incorrect.")
    sleep 1
    @dr.close()
  end
end
