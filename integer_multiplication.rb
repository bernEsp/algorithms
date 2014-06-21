class IntegerMultiplication
	def multiply x, y
		partial = []
		@operations = 0
		x = to_ary x
		y = to_ary y
		carry = 0
		y.reverse.each_with_index do |multiplier, index|
			partial_result = []
			n = x.size
			x.reverse.each_with_index do |multiplied, index_m|
				if (index_m+1) == n
					partial_result << ( ( multiplied.to_i * multiplier.to_i) + carry)
					carry = 0
					@operations += 2
				else
					partial_result << ( (multiplied.to_i * multiplier.to_i) + carry) % 10
					carry = ( (multiplied.to_i * multiplier.to_i) + carry ) / 10
					@operations += 2
				end
			end
			partial_result = partial_result.reverse + ([0] * index)
			partial[index] = array_to_number_base_ten partial_result
		end
		sum_partial(partial)
	end

	def array_to_number_base_ten partial
		result = 0
		partial.reverse.each_with_index do |number, index|
			result += number * (10**index)
		end
		result
	end

	def sum_partial partial
		result = 0
		partial.each do |quantity|
			result += quantity
		end
		result
	end

	def operations
		@operations
	end

	def to_ary number
		number.to_s.scan(/\d/)
	end
end
