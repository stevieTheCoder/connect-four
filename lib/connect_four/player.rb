module ConnectFour
	class Player

		attr_reader :name, :colour

		def initialize(input)
			@name = input.fetch(:name)
			@colour = input.fetch(:colour)
		end
	end
end