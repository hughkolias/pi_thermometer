require File.join(File.dirname(__FILE__), 'thermometer.rb')
require File.join(File.dirname(__FILE__), 'relaycontrol.rb')

class Thermostat

	def initialize
		@thermostat = RelaySwitcher.new
		@temperature = Thermometer.new
	end

	def fan_mode
		self.off_mode
		@thermostat.switch_on_fan
	end

	def cool_mode
		self.off_mode
		@temperature = @thermometer.get_temperature.to_i
		if temperature >= 23
			@thermostat.switch_on_cool
			puts "Cooling Activated"
		else
			@thermostat.switch_off_cool
			puts "Cooling Deactivated"
		end
	end

	def heat_mode
		self.off_mode
		@temperature = @thermometer.get_temperature.to_i
		if @temperature <= 25
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
		@thermostat.switch_off_cool
		@thermostat.switch_off_fan
		puts 'turned off'
	end

end