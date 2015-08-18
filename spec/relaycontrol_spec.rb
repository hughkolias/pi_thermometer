require 'spec_helper'


describe RelaySwitcher do
	before(:each) do
		@relayswitch = RelaySwitcher.new
	end

describe "RelaySwitcher#new" do
	it "should be an instance of RelaySwitcher object" do		
		expect(@relayswitch).to be_instance_of(RelaySwitcher)
	end
end

describe "RelaySwitcher#switch_on_heat" do
	it "turns on the fan, heat and compressor" do
		@relayswitch.switch_on_heat
		expect(@relayswitch.compressor.status).to eq("on")
		expect(@relayswitch.fan.status).to eq("on")
		expect(@relayswitch.heat.status).to eq("on")
	end
end

describe "RelaySwitcher#switch_off_heat" do
	it "turns off the fan, heat and compressor" do
		@relayswitch.switch_off_heat
		expect(@relayswitch.compressor.status).to eq("off")
		expect(@relayswitch.fan.status).to eq("off")
		expect(@relayswitch.heat.status).to eq("off")
	end
end

describe "RelaySwitcher#switch_on_cool" do
	it "turns on the fan and compressor - heat should be off" do
		@relayswitch.switch_on_cool
		expect(@relayswitch.compressor.status).to eq("on")
		expect(@relayswitch.fan.status).to eq("on")
		expect(@relayswitch.heat.status).to eq("off")
	end
end

describe "RelaySwitcher#switch_off_cool" do
	it "turns off the fan, heat and compressor" do
		@relayswitch.switch_off_cool
		expect(@relayswitch.compressor.status).to eq("off")
		expect(@relayswitch.fan.status).to eq("off")
		expect(@relayswitch.heat.status).to eq("off")
	end
end

describe "RelaySwitcher#switch_on_fan" do
	it "turns on the fan - heat and compressor should be off" do
		@relayswitch.switch_on_fan
		expect(@relayswitch.compressor.status).to eq("off")
		expect(@relayswitch.fan.status).to eq("on")
		expect(@relayswitch.heat.status).to eq("off")
	end
end

describe "RelaySwitcher#switch_off_fan" do
	it "turns off the fan" do
		@relayswitch.switch_off_heat
		expect(@relayswitch.compressor.status).to eq("off")
		expect(@relayswitch.fan.status).to eq("off")
		expect(@relayswitch.heat.status).to eq("off")
	end
end

end
