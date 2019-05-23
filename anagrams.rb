def anagram_1?(str_1, str_2)
  arr_1 = str_1.split("")
  permutations = arr_1.permutation.to_a
  permutations.any? { |word| word == str_2.split("") }
end

def anagram_2?(str_1, str_2)
  arr_1 = str_1.split("")
  arr_2 = str_2.split("")
  arr_1.each do |char|
    return false if !arr_2.include?(char)
    idx_2 = arr_2.find_index(char)
    arr_2.delete(arr_2[idx_2])
  end
  return false if !arr_2.empty?
  true
end

def anagram_3?(str_1, str_2)
  str_1.split("").sort! == str_2.split("").sort!
end

def anagram_4?(str_1, str_2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)
  str_1.each_char { |char| hash_1[char] += 1 }
  str_2.each_char { |char| hash_2[char] += 1 }
  hash_1 == hash_2
end

def anagram_5?(str_1, str_2)
  hash_1 = Hash.new(0)
  str_1.each_char { |char| hash_1[char] += 1 }
  str_2.each_char { |char| hash_1[char] -= 1 }
  p hash_1.values
  hash_1.values.length == 1
end

p anagram_5?("gizmo", "sally")    #=> false
p anagram_5?("elvis", "lives")    #=> true
