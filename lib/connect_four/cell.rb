module ConnectFour
	class Cell
		attr_accessor :value

		def initialize(value = '')
			@value = value
		end

		def symbol
			return "U26AB".force_encoding('utf-8') if self.value == 'red'
			return "U26AA".force_encoding('utf-8') if self.value == 'yellow'
		end
	end
end
