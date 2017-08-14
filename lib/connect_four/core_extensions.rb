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

	def diagonals
    	[self, self.map(&:reverse)].inject([]) do |all_diags, matrix|
    		((-matrix.count + 1)..matrix.first.count).each do |offet_index|
        		diagonal = []
        		(matrix.count).times do |row_index|
          			col_index = offet_index + row_index
          			diagonal << matrix[row_index][col_index] if col_index >= 0
        		end
        		all_diags << diagonal.compact if diagonal.compact.count > 1
      		end
      		all_diags
    	end
  	end
end