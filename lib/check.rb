class Check
  def valid(input)
    valid_form(input) && valid_letts(input) && valid_nums(input)
  end

  def valid_form(input)
    input.length == 5 && input[2] == " "
  end

  def valid_letts(input)
    input.split(" ").select do |point|
      if letters.include?(point[0])
        point[0]
      end
    end.length == 2
  end

  def letters
    ['A', 'B', 'C', 'D']
  end

  def valid_nums(input)
    input.split(" ").select do |point|
      if right_num?(point[1].to_i)
        point[1]
      end
    end.length == 2
  end

  def right_num?(number)
    [1, 2, 3, 4].include?(number)
  end

  def get_letts(input)
    [input[0], input[3]].sort
  end

  def get_nums(input)
    [input[1].to_i, input[4].to_i].sort
  end

  def same_row(input)
    get_letts(input).uniq.length == 1
  end

  def same_col(input)
    get_nums(input).uniq.length == 1
  end

  def three_ship(input)
    if same_row(input)
      get_nums(input)[1] - get_nums(input)[0] == 2
    elsif same_col(input)
      (letters.index(get_letts(input)[1]) - letters.index(get_letts(input)[0])) == 2
    else
      false
    end
  end

  def two_ship(input)
    if same_row(input)
      get_nums(input)[1] - get_nums(input)[0] == 1
    elsif same_col(input)
      (letters.index(get_letts(input)[1]) - letters.index(get_letts(input)[0])) == 1
    else
      false
    end
  end

  def two_or_three(input)
    return 3 if three_ship(input)
    return 2 if two_ship(input)
  end

  def expand(input)
    if same_row(input)
      nums = ((get_nums(input)[0].to_s)..(get_nums(input)[1].to_s)).to_a
      let = get_letts(input).push(get_letts(input)[0])
      let.map.with_index {|let, idx| let + nums[idx] }
    elsif same_col(input)
      let = (get_letts(input)[0]..get_letts(input)[1]).to_a
      nums = [get_nums(input)[0].to_s, get_nums(input)[0].to_s, get_nums(input)[0].to_s]
      let.map.with_index {|let, idx| let + nums[idx]}
    else
      false
    end
  end
end
