require_relative 'thermometer.rb' 
require_relative 'relaycontrol.rb'
require_relative 'thermostat.rb'
require_relative 'serverconn.rb'
require 'faraday'

thermostat = Thermostat.new
temperature = Thermometer.new

i = 1

while i < 2 do

	begin
		if Time.now.min == 0 || Time.now.min == 10 || 
		   Time.now.min == 20 || Time.now.min == 30 || 
		   Time.now.min == 40 || Time.now.min == 50 then
		   DbConnect.write_to_db(temperature.get_temperature) #1
		end

		if Faraday.get('https://gloriouspi.herokuapp') >= 400
			user_mode = 'Off'
		else
			user_set_temp = DbConnect.read_webapp_user_set_temp #2
			user_mode = DbConnect.read_webapp_user_mode #2
		end
	rescue PG::ConnectionBad, Faraday::ConnectionFailed
		user_mode = 'Off'
	end

		case user_mode
		when "Fan"
			thermostat.fan_mode
		when "Cool"
			thermostat.cool_mode(user_set_temp.to_i)
		when "Heat"
			thermostat.heat_mode(user_set_temp.to_i)
		when "Off"
			thermostat.off_mode
		end

		sleep(58)

end
	# 1. scrape glorious pi website for data
	# 2. use data to determine user_mode and user_set_temp
	# 3. run through process on pi [only activate new process if user_mode changes]
	# 4. write data to temperature model on rails app
	# 5. repeat
	# thermostat.cool_mode(23)
