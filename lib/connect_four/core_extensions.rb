class Array
	def all_empty?
		self.all? { |element| element.to_s.empty? }
	end

	def four_connected?
		count = 1
		last_element = self[0]
		 for i in (1..7) do
			if self[i].to_s.empty?
				count = 1
				last_element = self[i]
			elsif self[i] == last_element
				count += 1
				last_element = self[i]
			else
				count = 1
				last_element = self[i]
			end
			return true if count == 4
		end	
		false
	end

	def any_empty?
		self.any? { |element| element.to_s.empty? }
	end

	def none_empty?
		!any_empty?
	end
end