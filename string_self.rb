class String
  def cap
    self.split.map(&:capitalize).join(' ')
  end
end

a = "i do not believe this will work"
b = a.split.map(&:capitalize).join(' ')
puts b
c = a.cap
puts c