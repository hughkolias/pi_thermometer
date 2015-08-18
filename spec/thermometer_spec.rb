require 'spec_helper'

describe Thermometer do
	before(:each) do
		@temperature = Thermometer.new
	end

describe "#new" do
	it "should be an instance of Thermometer object" do		
		expect(@temperature).to be_instance_of(RelaySwitcher)
	end
end
