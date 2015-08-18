require 'spec_helper'

describe Thermometer do
	before(:each) do
		@temperature = Thermometer.new
	end

describe "Thermometer#new" do
	it "should be an instance of Thermometer object" do		
		expect(@temperature).to be_instance_of(Thermometer)
		expect(@temperature.serial_number).to eq('28-000005309f19')
		expect(@temperature.file_directory).to eq("/sys/bus/w1/devices/28-000005309f19/w1_slave")
	end
end

describe "Thermometer#print_temperature" do
	it "should print the phrase: The current temperature in the Master Bedroom is 18.312#{"\xC2\xB0"}C" do	
			expect(puts @temperature.print_temperature).to eq(puts "The current temperature in the Master Bedroom is 18.312#{"\xC2\xB0"}C")
	end
end

describe "Thermometer#print_to_database" do
	it "should print the current temperature to the database" do	
			#write test
	end
end

end