class Consecutive

  def initialize(string)
    # assign the input string
    @input_string = string
    max_consecutive_characters
  end

  # prints the max consecutive characters
  def max_consecutive_characters
    p sort_the_result
  end

  # sort the final result in alphabetical order
  def sort_the_result
    pick_consecutive_characters.sort
  end

  # pick only the consecutive characters
  def pick_consecutive_characters
    Hash[search_consecutive_characters].values
  end

  # search the input string for consecutive character
  def search_consecutive_characters
    @input_string.scan(/((.)\2{1,})/).group_by{ |s, c| s.length }.max.last
  end

end
