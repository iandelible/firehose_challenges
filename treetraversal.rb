#REMEMBER: test scenario
# while searching for 11 expect check sequence to be 2,7,6,5 for Depth First Search

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
  
  def depth_check(num)
    #check if the first payload is the intended node
    if num == self.payload
      return puts "#{self} has value of #{num}"
    else
      #move to child element(s)
      if self.children != nil
        self.children.each do |child|
          depth_check(child)
        end
      end
    end
    
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

trunk.depth_check(7)