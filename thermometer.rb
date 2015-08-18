class Thermometer

	def initialize(serial_number ='28-000005309f19')
		@serial_number = serial_number
		@file_directory = '/sys/bus/w1/devices/' + @serial_number + '/w1_slave'
	end

	def print_temperature
		puts "The current temperature in the Master Bedroom is #{get_temperature.to_s}#{"\xC2\xB0"}C"
	end

	def get_temperature
		f = File.open(@file_directory, 'r')
		2.times{ f.gets }
		$_[29..-1].to_f/1000
	end

	def print_to_database
		puts 'printing to database...' #define a class for this
	end

end
