#interative

def iterative_fib(num)
  first = 0
  second = 1

  if num < 2
    return num
  else
    num.times do
      #save the first value
      var_temp = first
      #reassign first variable to second spot
      first = second
      # make second variable third spot
      second = var_temp + second
    end
    # return the second spot because n times is one ahead of the fib number
    return first
  end
end

puts iterative_fib(9)

#recursive

def recursive_fib(num)
  if num < 2
    return num 
  else
    return (recursive_fib(num-2) + recursive_fib(num-1))
  end
end

puts recursive_fib(9)

require 'benchmark'
num = 37
Benchmark.bm do |x|
  x.report("recursive_fib")  { recursive_fib(num)  }
  x.report("iterative_fib")  { iterative_fib(num)  }
end