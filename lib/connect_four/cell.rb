module ConnectFour
	class Cell
		attr_accessor :value

		def initialize(value = '')
			@value = value
		end

		def symbol
			return "\u{26AB}" if self.value == 'red'
			return "\u{26AA}" if self.value == 'yellow'
		end
	end
end
