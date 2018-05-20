class InputCheck
  def initialize(input)
      @input = input if input != nil
  end
#returns false if string cannot be split
#if it can it assigns split array to input arr and returns true
  def split?
    if valid_format? && !(same?) && valid_letters? && valid_numbers?
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
    @input.split(" ").uniq.length == 1
  end
#check if letters in input are A through D
  def valid_letters?
    @input.split(" ").select do |point|
      if right_letter?(point[0])
        point[0]
      end
    end.length == 2
  end

  def right_letter?(letter)
    ['A', 'B', 'C', 'D'].include?(letter)
  end
#check if numbers in input are 1 through 4
  def valid_numbers?
    @input.split(" ").select do |point|
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
  # 
  # def valid?
  #   if split?
  # end
end
