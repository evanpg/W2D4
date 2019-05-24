def bad_two_sum?(arr, target_sum)
  pairs = []
  i = 0
  while i < arr.length - 1
    j = 1
    while j < arr.length
      if j > i
        pairs << [arr[i], arr[j]]
      end
      j += 1
    end
    i += 1
  end

  k = 0
  while k < pairs.length
    if pairs[k].sum == target_sum
      return true
    end
    k += 1
  end

  false
end

def okay_two_sum?(arr, target_sum)
  return false if arr.empty?
  arr = arr.sort!
  if arr.include?(target_sum - arr.shift)
    return true
  else
    okay_two_sum?(arr, target_sum)
  end
end

def two_sum?(arr, target_sum)
  hash = Hash.new
  
  arr.each do |num|
    difference = target_sum - num
    return true if hash[difference] == true
    hash[num] = true
  end

  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false