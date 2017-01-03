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


class Stack                                  
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
      @data = @data.next_node
      return pull_top
    end

    def reverse!
      tail = nil

      while @data != nil
        new_stack = LinkedListNode.new(@data.value, tail)
        @data = @data.next_node
        tail = new_stack
      end
      return @data = new_stack
    end

    def print_stack
      print_values(@data)
    end
end

some_stack = Stack.new
some_stack.push(88)
some_stack.push(55)
some_stack.push(22)
some_stack.print_stack
some_stack.reverse!     # gets reversed...
some_stack.print_stack