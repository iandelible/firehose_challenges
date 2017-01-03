#write a test
#collatz_process(4) returns  a sequence length of 3

#step 1 method for collatz sequence
class Collatz
  def initialize
    @lengths = Hash.new
  end

  def collatz_process(num)
    orig_num = num
    if num == 1
      return 1
    end
    if num.even?
      num = num/2
    else
      num = (3 * num + 1)
    end
    # return 1 + collatz_process(num) if we start with 4 then collatz_process(2) on this line
    #check to see if we know answer
    num_length = @lengths[num]  #optimize time
    if num_length != nil
      orig_length = 1 + num_length        # store new answer in hash table
    else
      orig_length = 1 + collatz_process(num)
    end
    @lengths[orig_num] = orig_length  #sends orig_length variable into hash table
    return orig_length
  end
end


collatz = Collatz.new
biggest = 0
result = 0
(1..1000000).each do |n|
  this_result = collatz.collatz_process(n)
  if this_result > result
    biggest = n
    result = this_result
  end
end
puts "#{biggest} has the length of #{result}"

#step 3 compare lengths of each number.

