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

def has_loop?(list)
  hare = list.next_node
  tortoise = list
  while tortoise != hare && hare != nil
    #advance hare by 2 tortoise by 1
    tortoise = tortoise.next_node
    # hare = hare.next_node.next_node  techincally correct, however if it was nil it will crash
    hare = hare.next_node
    if hare
      hare = hare.next_node
    end
  end

  if tortoise == hare
    return true
  else
    return false
  end

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3
node4 = LinkedListNode.new(64)
node5 = LinkedListNode.new(55, node4)
node6 = LinkedListNode.new(28, node5)

#print_values(node3) makes infinite loop

has_loop?(node3)

has_loop?(node4)

print_values(node6)
has_loop?(node6)