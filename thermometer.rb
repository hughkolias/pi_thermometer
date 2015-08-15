require 'pi_piper'
include PiPiper

class Thermometer

	def initialize(serial_number ='28-000005309f19')
		@serial_number = serial_number
		@file_directory = '/sys/bus/w1/devices/' + @serial_number + '/w1_slave'
	end

	def print_temperature
		puts "The current temperature in the Den is #{get_temperature.to_s}#{"\xC2\xB0"}C"
	end

	def get_temperature
		f = File.open(@file_directory, 'r')
		2.times{ f.gets }
		$_[29..-1].to_f/1000
	end

end

class RelaySwitcher

	attr_accessor :dir

	def initialize
		@compressor = PiPiper::Pin.new(:pin => 17, :direction => :out)
		@fan = PiPiper::Pin.new(:pin => 27, :direction => :out)
		@heat = PiPiper::Pin.new(:pin =>22, :direction => :out)
	end

	def switch_on_heat
		@fan.on
		sleep(1)
		@heat.on
		sleep(1)
		@compressor.on
	end

	def switch_off_heat
		@compressor.off
		sleep(1)
		@heat.off
		sleep(1)
		@fan.off
	end

	def switch_on_cool
		@fan.on
		sleep(1)
		@compressor.on
	end

	def switch_off_cool
		@compressor.off
		sleep(1)
		@fan.off
	end

	def switch_on_fan
		@fan.on
	end

	def switch_off_fan
		@fan.off
	end
 

end

class Logic

	def initialize

	end

end

thermometer = Thermometer.new
thermostat = RelaySwitcher.new

i = 0

while i < 1 do
	thermometer.print_temperature
	# temperature = den.get_temperature.to_i
	# if temperature > 24
	# 	relay.switch_off_heat
	# 	sleep(2)
	# 	relay.switch_on_cool
	# else
	# 	relay.switch_off_cool
	# 	sleep(2)
	# 	relay.switch_on_heat
	# end
	# sleep(1)
end
