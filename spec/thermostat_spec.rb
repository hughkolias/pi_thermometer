require 'spec_helper'

#test assumes a temperature of 18.312degreesC

describe Thermostat do
	before(:each) do
		@thermostat = Thermostat.new
	end

describe "Thermostat#new" do
	it "should be an instance of Thermostat object with initilized variables" do		
		expect(@thermostat).to be_instance_of(Thermostat)
		expect(@thermostat.thermostat).to be_instance_of(RelaySwitcher)
		expect(@thermostat.thermometer).to be_instance_of(Thermometer)
	end
end

describe "Thermometer#fan_mode" do
	it "should switch on the fan" do	
		@thermostat.fan_mode		
		expect(@thermostat.thermostat.compressor.status).to eq("off")
		expect(@thermostat.thermostat.fan.status).to eq("on")
		expect(@thermostat.thermostat.heat.status).to eq("off")
	end
end

describe "Thermometer#cool_mode" do
	it "should switch on cooling cycle" do	
		@thermostat.cool_mode(16)
		expect(@thermostat.temperature).to eq(18)		
		expect(@thermostat.thermostat.compressor.status).to eq("on")
		expect(@thermostat.thermostat.fan.status).to eq("on")
		expect(@thermostat.thermostat.heat.status).to eq("off")
	end
end

describe "Thermometer#heat_mode" do
	it "should switch on heating cycle" do	
		@thermostat.heat_mode(24)	
		expect(@thermostat.temperature).to eq(18)		
		expect(@thermostat.thermostat.compressor.status).to eq("on")
		expect(@thermostat.thermostat.fan.status).to eq("on")
		expect(@thermostat.thermostat.heat.status).to eq("on")
	end
end

describe "Thermometer#off_mode" do
	it "should switch off all modes" do	
		@thermostat.off_mode	
		expect(@thermostat.temperature).to eq(18)		
		expect(@thermostat.thermostat.compressor.status).to eq("off")
		expect(@thermostat.thermostat.fan.status).to eq("off")
		expect(@thermostat.thermostat.heat.status).to eq("off")
	end
end

end