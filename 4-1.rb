def sum(numbers)
  return 0 if numbers.empty?

  head, *tail = numbers
  head + sum(tail)
end

puts sum([1]) == 1
puts sum([1, 2]) == 3
puts sum([1,2,3,4]) == 10

