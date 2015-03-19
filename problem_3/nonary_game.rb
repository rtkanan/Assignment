class NonaryGame

  def initialize
    # given array
    @array = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
  end

  def valid_groups
    result = []
    array_combination.to_a.each do |array|
      # allow the combination only 5 there in the array elements
      if array.include? 5
        # check the digital root is 9 for the passed array
        if check_digital_root(array)
          # storing the final result in an array
          result << array
        end
      end
    end
    return result
  end

  # check the digital root is 9 for the passed array
  def check_digital_root(array)
    if sum_array_elements(array) == 9
      return true
    else
      return false
    end
  end

  # return all the sum of elements for the passed array
  def sum_array_elements(array)
    value = 0
    array.each { |element| value += element }
    digital_root(value)
  end

  # find the digital root number
  def digital_root(number)
    if number > 9
      new_array = integer_to_array(number)
      sum_array_elements(new_array)
    else
      return number
    end
  end

  # converts integer to array elements
  def integer_to_array(number)
    number.to_s.scan(/./).map {|e| e.to_i }
  end

  # returns all possible combination for the given array
  def array_combination
    @array.combination(3).to_a + @array.combination(4).to_a + @array.combination(5).to_a
  end
end
