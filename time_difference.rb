class Array
  def my_min_1
    each do |ele_1|
      return ele_1 if all?{ |ele_2| ele_2 >= ele_1 }
    end
  end

  def my_min_2
    lowest_number = nil
    each do |ele|
      if lowest_number.nil? || ele < lowest_number
        lowest_number = ele
      end
    end
    lowest_number
  end

  def largest_contiguous_subsum_1
    all_subsets = []
    all_sums = []

    i = 0
    while i < length - 1
      j = 0
      while j < length
        if j >= i
          subset = self[i..j]
          all_subsets << subset
        end
        j += 1
      end
      i += 1
    end
    
    all_subsets.each do |subset|
      all_sums << subset.sum
    end

    all_sums.max
  end

  def largest_contiguous_subsum_2
    largest_sum = first
    i = 0
    curr_sum = 0

    while i < length
      curr_sum += self[i]
      largest_sum = [curr_sum, largest_sum].max
      curr_sum = 0 if curr_sum < 0
      i += 1
    end
      
    largest_sum
  end

end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p list.my_min_1  # =>  -5

# list_1 = [5, 3, -7]
# p list_1.largest_contiguous_subsum_2 # => 8

# list_2 = [2, 3, -6, 7, -6, 7]
# p list_2.largest_contiguous_subsum_2 # => 8 (from [7, -6, 7])

# list_3 = [-5, -1, -3]
# p list_3.largest_contiguous_subsum_2 # => -1 (from [-1])