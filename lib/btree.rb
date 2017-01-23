class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end
  
  def self.build_tree
    BinaryTree.new(nil, nil, nil)
  end
  
  def build(array)
    #loop thru the rest of the array
    array.each do |element|
      #if payload is empty push the element onto payload
      if @payload == nil
        @payload = element
        next
      end
      #check to go left or right
      if element < @payload
        #go left but we dont know if left exists
        if @left == nil
          @left = BinaryTree.new(nil, nil, nil)
        end
        #now left exists, build method expects an array
        @left.build([element])
      else
        #going right
        if @right == nil
          @right = BinaryTree.new(nil, nil, nil)
        end
        @right.build([element])
      end
    end
  end

  def flatten #returns sorted version of the tree.
    #there is recursive solution.
    sorted_list = []

    if left != nil
      @left.flatten
    end
    sorted_list << @payload
    

    return sorted_list
  end

end

tree = BinaryTree.new(nil, nil, nil)

tree.build([7, 4, 9, 1, 6, 14, 10])

tree.flatten
