class Calculator_task1
  def self.add(values)
    numbers = values.split(",").map(&:to_i)
    numbers.inject(0) { |sum, num| sum + num }
  end
end

class Calculator_task2

  def self.add(values)
    numbers = values.split(/[\n,]/).map(&:to_i)
    numbers.inject(0) { |sum, num| sum + num }
  end
end

class Calculator_task3
  def self.add(values)
    delimiter = ","
    if values.start_with?("//")
      delimiter = values[2]
      values = values.split("\n", 2)[1]
    end

    numbers = values.split(/[\n#{delimiter}]/).map(&:to_i)
    numbers.inject(0) { |sum, num| sum + num }
  end
end

class Calculator_task4
  def self.add(values)
    delimiter = ","
    if values.start_with?("//")
      delimiter = values[2]
      values = values.split("\n", 2)[1]
    end

    numbers = values.split(/[\n#{delimiter}]/).map(&:to_i)

    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    else
      numbers.inject(0) { |sum, num| sum + num }
    end
  end
end

class Culculator

puts Calculator_task1.add("") # Output: 0
puts Calculator_task1.add("1") # Output: 1
puts Calculator_task1.add("1,5") # Output: 6
puts Calculator_task2.add("1\n2,3") # Output: 6
puts Calculator_task3.add("//;\n1;2") # Output: 3
puts Calculator_task3.add("1\n2,3")     # Output: 6
puts Calculator_task3.add("1\n2\n3\n4") # Output: 10
puts Calculator_task3.add("//;\n1;2")   # Output: 3
puts Calculator_task4.add("1,-2,3")       # Output: Exception: negatives not allowed: -2
puts Calculator_task4.add("//;\n1;-2;3")  # Output: Exception: negatives not allowed: -2
puts Calculator_task4.add("1\n-2\n3\n-4") # Output: Exception: negatives not allowed: -2, -4

end
