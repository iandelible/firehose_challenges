def nthterm(first, n, c)
    @first = first
    @n = n
    @c = c
    
    array = [@first]
   
    
    x = 0
    
    while x < @n
      y = (array.last) + @c
      array << y
      
      x = @n + 1
      return x
    end
    
    array.at(@n)
end

puts array.at(@n)