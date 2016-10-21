# Sum Numbers
def sum(numbers)
  
  array = []
  
  numbers.each do |number|
      
  x = number.to_f
  
  y = array.last.to_f + x
  
  array.push(y)
  
  end 
  return array
  
end

numbers = [1, 5.2, 4, 0, -1]
puts sum(numbers)