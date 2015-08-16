require File.join(File.dirname(__FILE__), 'thermometer.rb')
require File.join(File.dirname(__FILE__), 'relaycontrol.rb')

thermometer = Thermometer.new
# thermostat = RelaySwitcher.new

thermometer.print_temperature
# temperature = thermometer.get_temperature.to_i
# 	if temperature >= 23
# 		thermostat.switch_on_cool
# 		puts "Cooling Activated"
# 	else
# 		thermostat.switch_off_cool
# 		puts "Cooling Deactivated"
# 	end
# 	sleep(5)


# thermometer = Thermometer.new
# thermostat = RelaySwitcher.new

# i = 0

# while i < 1 do
# 	thermometer.print_temperature
# 	temperature = thermometer.get_temperature.to_i
# 	if temperature >= 23
# 		thermostat.switch_on_cool
# 		puts "Cooling Activated"
# 	else
# 		thermostat.switch_off_cool
# 		puts "Cooling Deactivated"
# 	end
# 	sleep(5)
# end
