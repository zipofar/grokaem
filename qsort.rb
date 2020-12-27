def qsort(numbers)
  return numbers if numbers.length < 2
  pivot = numbers[0]
  less = numbers.select { |n| n < pivot }
  greater = numbers.select { |n| n > pivot }

  qsort(less) + [pivot] + qsort(greater)
end

puts qsort([]) == []
puts qsort([1]) == [1]
puts qsort([1,2]) == [1,2]
puts qsort([2,1]) == [1,2]
puts qsort([4,3,5,2,0,1]) == [0,1,2,3,4,5]

