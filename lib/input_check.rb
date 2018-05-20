class InputCheck
  attr_reader :input,
              :input_arr
  def initialize(input)
      @input = input
  end
#returns false if string cannot be split
#if it can it assigns split array to input arr and returns true
  def split?
    if valid_format?
      @input_arr = @input.split(" ").sort
      true
    else
      false
    end
  end
#check if the string length of 5 and space in middle
  def valid_format?
    @input.length == 5 && @input[2] == " "
  end
#check if the 2 values are exactly the same
  def same?
    @input_arr.uniq.length == 1
  end
#check if letters in input are A through D
  def valid_letters?
    @input_arr.select do |point|
      if letters.include?(point[0])
        point[0]
      end
    end.length == 2
  end

  def letters
    ['A', 'B', 'C', 'D']
  end

#check if numbers in input are 1 through 4
  def valid_numbers?
    @input_arr.select do |point|
      if right_number?(point[1].to_i)
        point[1]
      end
    end.length == 2
  end

  def right_number?(number)
    [1, 2, 3, 4].include?(number)
  end

  def get_letters
    @input_arr.map {|space| space[0]}
  end

  def get_numbers
    @input_arr.map { |space| space[1].to_i}
  end

  def same_row?
    get_letters.uniq.length == 1
  end

  def same_col?
    get_numbers.uniq.length == 1
  end

  def not_diagonal?
    same_col? || same_row?
  end

  def right_length?
    if same_row?
      (get_numbers[1] - get_numbers[0]) < 3
    elsif same_col?
      (letters.index(get_letters[1]) - letters.index(get_letters[0])) < 3
    else
      false
    end
  end

  def valid?
    return false if !(split?)
    !(same?) && valid_letters? && valid_numbers? && not_diagonal? && right_length?
  end
end
