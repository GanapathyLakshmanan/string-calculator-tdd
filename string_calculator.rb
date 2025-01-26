class StringCalculator
	def add(numbers)
		return 0 if numbers.empty?
		
		delimiter = ","
		if numbers.start_with?("//")
			parts = numbers.split("\n", 2)
			delimiter = parts[0][2]
			numbers = parts[1]
		end
    
	    numbers = numbers.gsub("\n", delimiter)
		numbers.split(delimiter).map(&:to_i).sum
	end
end

# Testing
calc = StringCalculator.new
puts calc.add("")     # Output: 0
puts calc.add("1")    # Output: 1
puts calc.add("1,2")  # Output: 3
puts calc.add("1,2,3,4")   # Output: 10
puts calc.add("1\n2,3")    # Output: 6
puts calc.add("//;\n1;2")  # Output: 3