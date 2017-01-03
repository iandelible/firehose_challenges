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

def reverse_list(list, previous = nil)
  while list != nil
    save_old_node_values = list.next_node       #saves the values after the outermost node (99 -> 37 -> nil)
    list.next_node = previous                   #reassigns the next node to pointer of a former value {list looks like 12 -> nil}
    previous = list                             #reassigns previous with the new working list {previous looks like 12 -> nil}
    list = save_old_node_values                 #reassigns and makes new list with the remembered values {list now looks like 99 -> 37 -> nil}
  end                                           #{previous looks like 12 -> nil} {list looks 99->37->nil so it will loop again}
  
  return previous                               l
end

revlist = reverse_list(node3)
print_values(revlist)