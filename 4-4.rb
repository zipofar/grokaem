def find(numbers, n)
  def iter(lft, rgt, numbers, n)
    guess = (lft + rgt) / 2
    return nil if lft == rgt && n != numbers[guess]
    return guess if n == numbers[guess]
    return iter(lft, guess - 1, numbers, n) if n < numbers[guess]
    return iter(guess + 1, rgt, numbers, n) if n > numbers[guess]
  end

  return nil if numbers.empty?
  return iter(0, numbers.length - 1, numbers, n)
end

puts find([], 1) == nil
puts find([1], 2) == nil
puts find([1], 1) == 0
puts find([1,2], 2) == 1
puts find([1,2], 1) == 0
puts find([1,2,3], 3) == 2
puts find([1,2,3,4,5,6,7,8,9], 9) == 8
puts find([1,2,3,4,5,6,7,8,9], 2) == 1
puts find([1,2,3,4,5,6,7,8,9], 4) == 3
puts find([1,2,3,4,5,6,7,8,9], 5) == 4

