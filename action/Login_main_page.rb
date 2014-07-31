require File.dirname(__FILE__)+'/../tool/login_dialog'

class LoginMainPage
  include LoginDialog
  def initialize(dr)
    @dr ||=dr
  end

def login(username,password)
    user_name.send_keys(username)
    pass_word.send_keys(password)
    sleep 2
    login_btn.click
  end
	end
