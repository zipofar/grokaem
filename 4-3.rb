def max(numbers)
  return nil if numbers.empty?

  head, *tail = numbers
  return head if tail.empty?
  return head if head > max(tail)
  return max(tail)
end

puts max([]) == nil
puts max([5]) == 5
puts max([1, 2]) == 2
puts max([3,2,1]) == 3
puts max([3,5,4,6,10,1]) == 10
puts max([1,2,3,4]) == 4
puts max([10,5,6,9,3,9,7]) == 10
