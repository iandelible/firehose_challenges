class Image

  def initialize(image)
    @image = image
  end
  
  def output_image
    @image.each do |row|
      row.each do |pixel|
        print pixel
      end
      print "\n"
    end
  end

  def get_coordinates
    coordinates = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, col_index|
        if pixel == 1 then                          # "then" is uncessary
          coordinates.push([row_index, col_index])  # coordinates << ([row_index, col_index]) if pixel == 1
        end 
      end 
    end 
    return coordinates
  end 
 
  def blur(n)
    get_coordinates.each do |location|
      ax, ay = location                   # x is vertical, y is horizontal
      list = ((ax - n)..(ax + n))         # (1..5) creates an array [1,2,3,4,5], .select filters if true passes on to next
      list.select do |v_direction|
        v_direction >= 0 && v_direction < @image.length
      end.each do |x| 
        row = @image[x]
        ((ay - n)..(ay + n)).select do |h_direction|
          h_direction >= 0 && h_direction < row.length
        end.select do |y|
          pixel = row[y]
          dx = (ax - x).abs
          dy = (ay - y).abs
          dx + dy <= n 
        end.each do |y|
          @image[x][y] = 1
        end
      end 
    end 
  end 
  
end

image = Image.new([
    [0,0,0,0,0,0],
    [0,0,0,0,0,0],
    [0,0,1,0,0,0],
    [0,0,0,0,0,0],
    [0,0,0,0,0,0],
    [0,0,0,0,0,1]
    ])
image.output_image
print "\n"
image.blur(2)
image.output_image


  coordinates.each do |coord|
    coord.each do |pixel|
      if pixel == 1
        blur_this_spot(n, coord, pixel)
      end 
    end 
  end
      
   
  def blur_this_spot(n, original, current) #original spot relative to current pixel
    x, y = current
    dx, dy = original
    xdiff = (dx - x).abs
    ydiff = (dy - y).abs
    return xdiff + ydiff <= n
  end
  
    def blur(n)
    get_coordinates.each do |location|
      ax, ay = location                   # x is vertical, y is horizontal
      list = ((ax - n)..(ax + n))         # (1..5) creates an array [1,2,3,4,5], .select filters if true passes on to next
      otherlist = list.select do |v_direction|
        v_direction >= 0 && v_direction < @image.length
      end
      otherlist.each do |x| 
        row = @image[x]
        thirdlist =((ay - n)..(ay + n)).select do |h_direction|
          h_direction >= 0 && h_direction < row.length
        end
        thirdlist.select do |y|
          pixel = row[y]
          dx = (ax - x).abs
          dy = (ay - y).abs
          dx + dy <= n 
        end.each do |y|
          @image[x][y] = 1
        end
      end 
    end 
 