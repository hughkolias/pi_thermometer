
class Thermometer

	def initialize(serial_number ='28-000005309f19')
		@serial_number = serial_number
		@file_directory = '/sys/bus/w1/devices/' + @serial_number + '/w1_slave'
	end

	def print_temperature
		f = File.open(@file_directory, 'r')
		2.times{ f.gets }
		temp = $_.chomp.to_s
		puts "#{temp[29..-1].to_f/1000}#{"\xC2\xB0"}C"
	end

end

den = Thermometer.new

while i > 1 do
	print_temperature
	sleep.5
end
