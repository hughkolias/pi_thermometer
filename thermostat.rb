require File.join(File.dirname(__FILE__), 'thermometer.rb')
require File.join(File.dirname(__FILE__), 'relaycontrol.rb')

class Thermostat

	attr_reader :thermostat, :thermometer, :temperature

	def initialize
		@thermostat = RelaySwitcher.new
		@thermometer = Thermometer.new
	end

	def fan_mode
		@thermostat.switch_on_fan
	end

	def cool_mode(temp)
		sleep(2)
		@temperature = @thermometer.get_temperature.to_i
		if temperature >= temp
			@thermostat.switch_on_cool
			puts "Cooling Activated"
		else
			@thermostat.switch_off_cool
			puts "Cooling Deactivated"
		end
	end

	def heat_mode(temp)
		@temperature = @thermometer.get_temperature.to_i
		if @temperature <= temp
			@thermostat.switch_on_heat
			puts "Heating Activated"
		else
			@thermostat.switch_off_heat
			puts "Heating Deactivated"
		end
	end

	def off_mode
		@temperature = @thermometer.get_temperature.to_i	
		@thermostat.switch_off_heat
	end

end
