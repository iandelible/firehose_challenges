class Ghost

  def initialize
    @color_choices = ["white", "yellow", "purple", "red"]
    
  end
  
  def color
    @color_choices.sample
  end
end

ghost = Ghost.new
color = ghost.color
puts color