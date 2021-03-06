class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

  def print_values(list_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
  end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)


class Stack                                   #takes linkedlink and makes it a stack
    attr_reader :data

    def initialize
      @data = nil
    end

    # Push a value onto the stack
    def push(value)
      @data = LinkedListNode.new(value, @data)
    end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
      pull_top = @data.value
      @data = @data.next_node                   #reassigns @data with the node
      return pull_top
    end

    def reverse!
      if @data != nil
        self.pop
      end
      # @data
      # take first value assign its next node to nil, 
      # then take nodes assign to a variable, 
      # 
    end

    def print_stack
      print_values(@data)
    end
end

some_stack = Stack.new
some_stack.print_stack
some_stack.reverse! # gets reversed...
some_stack.print_stack


#after stack, you dont need to remember about linkedlist to reverse...

# Creates a new Stack object
stack = Stack.new

# Pushes (adds) the number 1 to the empty stack
stack.push(1)

# Pushes the number 2 to the TOP of the stack
stack.push(2)

# Pops (removes) the TOP number from the stack (2)
puts stack.pop
# => 2

# Pops the remaining number from the stack (1)
puts stack.pop
# => 1

# Tries to pop the TOP number from the stack,
# but it is empty so it returns nil
puts stack.pop
# => nil


def reverse_stack(stack)
    s = Stack.new

#   while (temp = stack.data) != nil    #assignment and a check on same line, assignment returns values assigned, other languages doesnt return assignment or true
    while stack.data != nil
        s.push(stack.pop)
    end

    return s
end


revlist = reverse_list(node3)
print_values(revlist)