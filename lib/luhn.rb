class Luhn

  def self.is_valid?(number)
    self.new.is_valid?(number)
  end
  
  def is_valid?(number)
    array = break_numbers_into_digits_into_array(number)
    array = reverse_number_to_start_from_right(array)
    array = double_every_second_digit(array)
    array = substract_9_if_necessary(array)
    sum = sum_digits(array)
    
    pass_luhn?(sum)
  end
  
  #step1, gives me an array 
  def break_numbers_into_digits_into_array(number)
    array = number.to_s.split('').collect{|x| x.to_i} #changes string to int another way number.to_s.split('').map(&:to_i)
    return array
  end

  #step 2 start from right double every second digit
  def reverse_number_to_start_from_right(array)
    array = array.reverse
    return array
  end
  
  def double_every_second_digit(array)
    return array.each_with_index.map do |digit, index|
      if index.odd?
        digit * 2
      else
        digit
      end
    end
  end
  
  #step3 if doubled value is >= 10 substract 9 
  def substract_9_if_necessary(array)
    return array.map do |digit|
      if digit > 9
        digit - 9
      else
        digit
      end
    end
  end
  
  # step 4 sum digits
  def sum_digits(array)
    return array.inject(:+)  #explanation? combines all elements of array by applying binary operation, same as reduce
    # array.reduce do |product = 0, n| 
    #   product + n
    # end
  end
  
  #step 5
  def pass_luhn?(sum)
    if (sum % 10) == 0
      return true
    else
      return false
    end 
  end 
end
