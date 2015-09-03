require File.join(File.dirname(__FILE__), 'thermometer.rb')
require File.join(File.dirname(__FILE__), 'relaycontrol.rb')
require File.join(File.dirname(__FILE__), 'thermostat.rb')
require File.join(File.dirname(__FILE__), 'serverconn.rb')

thermostat = Thermostat.new
temperature = Thermometer.new

i = 1

while i>1

	DbConnect.write_to_db(temperature.get_temperature, 'heat', 22)

	sleep(60)

end
	# 1. scrape glorious pi website for data
	# 2. use data to determine user_mode and user_set_temp
	# 3. run through process on pi [only activate new process if user_mode changes]
	# 4. write data to temperature model on rails app
	# 5. repeat
	# thermostat.cool_mode(23)
