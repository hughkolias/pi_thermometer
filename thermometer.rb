

directory = '/sys/bus/w1/devices/'
serial_number = '28-000005309f19'
file_directory = directory + serial_number + '/w1_slave'

f = File.open(file_directory, 'r')
2.times{ f.gets }
temp = $_.chomp.to_s
puts "#{temp[29..-1].to_f/1000}#{"\xC2\xB0"}C"

