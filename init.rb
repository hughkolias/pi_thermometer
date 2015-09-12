require File.join(File.dirname(__FILE__), 'thermometer.rb')
require File.join(File.dirname(__FILE__), 'relaycontrol.rb')
require File.join(File.dirname(__FILE__), 'thermostat.rb')
require File.join(File.dirname(__FILE__), 'serverconn.rb')

thermostat = Thermostat.new
temperature = Thermometer.new

i = 1

while i<1 do

	DbConnect.write_to_db(temperature.get_temperature) #1
	user_set_temp = DbConnect.read_webapp_user_set_temp #2
	user_mode = DbConnect.read_webapp_user_mode #2

	case user_mode
	when "Fan"
		thermostat.fan_mode
	when "Cool"
		thermostat.cool_mode(user_set_temp)
	when "Heat"
		thermostat.heat_mode(user_set_temp)
	when "Off"
		thermostat.off_mode
	end

	sleep(60)

end
	# 1. scrape glorious pi website for data
	# 2. use data to determine user_mode and user_set_temp
	# 3. run through process on pi [only activate new process if user_mode changes]
	# 4. write data to temperature model on rails app
	# 5. repeat
	# thermostat.cool_mode(23)
