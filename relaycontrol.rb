#require File.join(File.dirname(__FILE__), 'pipiper.rb') #comment out after done test
require_relative 'pi_piper'
include PiPiper

class RelaySwitcher

	#attr_accessor :compressor, :fan, :heat #comment out after done test

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
		@heat.off
		sleep(1)		
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
		@compressor.off
		sleep(1)
		@heat.off
		sleep(1)
		@fan.on
	end

	def switch_off_fan
		@fan.off
	end
 

end
