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
		nums = numbers.split(delimiter).map(&:to_i)
		
		negatives = nums.select { |n| n < 0 }
		raise "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
		
		nums.sum
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
begin
  puts calc.add("1,-2,3")  # Raises: negative numbers not allowed: -2
rescue => e
  puts e.message
end