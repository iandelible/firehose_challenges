input = [
  [0,0,1,0],
  [0,0,0,0],
  [1,0,0,0],
  [0,0,0,0],
]

def output_image(image)
  image.each do |row|
    row.each do |pixel|
      print pixel
    end
    print "\n"
  end
end

def get_points(image)
  points = []
  image.each_with_index do |row,x|
    row.each_with_index do |pixel,y|
      if pixel == 1 then
        points.push([x,y])
      end
    end
  end
  return points
end

def blur(image, n)
  points = get_points(image)
  points.each do |point|
    px, py = point
    ((px - n)..(px + n)).select do |x|
      x >= 0 && x < image.length
    end.each do |x|
      row = image[x]
      ((py - n)..(py + n)).select do |y|
        y >= 0 && y < row.length
      end.each do |y|
        pixel = row[y]
        dx = (px - x).abs
        dy = (py - y).abs
        if dx + dy <= n then
          image[x][y] = 1
        end
      end
    end
  end
end

output_image(input)
print "\n"
output_image(blur(input))


dots.each do |dot|
    pixels.each do |pixel|
        if should_blur?(n, dot, pixel)
            blur(pixel)
        end
    end
end

def should_blur?(n, dot, pixel)
    x, y = pixel
    bx, by = dot
    xdiff = (bx - x).abs
    ydiff = (by - y).abs
    return xdiff + ydiff <= n
end