require 'pi_piper'
include PiPiper

class RelaySwitcher

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
