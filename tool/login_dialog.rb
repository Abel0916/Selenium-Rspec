module LoginDialog

def wait
  Selenium::WebDriver::Wait.new( {:timeout => 30} )
end

def user_name
	wait.until { @dr.find_element(:id=>'login') }
end

def pass_word
	wait.until { @dr.find_element(:id=>'password') }
end

def login_btn
	wait.until {@dr.find_element(:id=>'login_button') }
end

def err_msg
  wait.until {@dr.find_element(:xpath=>'html/body/div[1]/div/div[2]/div[2]').text }
end

end
