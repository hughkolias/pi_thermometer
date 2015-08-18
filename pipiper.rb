module PiPiper

class Pin

	attr_accessor :pin, :direction, :status

	def initialize(params = {})
		@pin = params.fetch(:pin, 'some')
		@direction = params.fetch(:direction, 'test')
		@status = params.fetch(:status, 'off')
	end

  	def to_s
   	 "#{pin} #{direction} #{status}"
  	end

	def on
		@status = "on"
	end

	def off
		@direction = "off"
	end
end

end

