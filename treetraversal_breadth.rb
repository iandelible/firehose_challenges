class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
  
  def contains?(num)
    #initialize queue
    queue = MyQueue.new
    #check first tree
    if self.payload == num 
      return true
    end
    #queue the children
    if self.children != nil
      self.children.each do |child|
          queue.enqueue(child)
      end
    end
    #if queue has content, check the content
    while queue != nil do
      element = queue.dequeue
      #check element
      if element.payload == num
        return true
      #else queue child
      else
        element.children.each do |child|
          queue.enqueue(child)
        end
      end
    end
  end
  

end

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

trunk.contains?(7)