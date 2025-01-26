class StringCalculator
	def add(numbers)
		return 0 if numbers.empty?
		return numbers.to_i if !numbers.include?(",")
    
	    numbers = numbers.gsub("\n", ",")
		numbers.split(",").map(&:to_i).sum
	end
end

# Testing
calc = StringCalculator.new
puts calc.add("")     # Output: 0
puts calc.add("1")    # Output: 1
puts calc.add("1,2")  # Output: 3
puts calc.add("1,2,3,4")   # Output: 10
puts calc.add("1\n2,3")    # Output: 6