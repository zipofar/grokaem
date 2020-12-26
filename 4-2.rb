def count(numbers)
  return 0 if numbers.empty?

  _, *tail = numbers
  1 + count(tail)
end

puts count([]) == 0
puts count([1]) == 1
puts count([1, 2]) == 2
puts count([1,2,3,4]) == 4

