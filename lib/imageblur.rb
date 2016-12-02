class Image
    attr_reader :pixels
    
    def initialize(pixels)
        @pixels = pixels
    end 
    
    def output_image
        @pixels.each do |row|
            row.each do |pixel|
                puts pixel
            end
        end 
    end 
    
    def transform_the_pixels(row_index, col_index)
        if row_index + 1 < @pixels.length 
          @pixels[row_index + 1][col_index] = 1
        end
        if row_index - 1 >= 0
          @pixels[row_index - 1][col_index] = 1
        end
        if col_index + 1 < @pixels[row_index].length
          @pixels[row_index][col_index + 1] = 1
        end 
        if col_index - 1 >= 0
          @pixels[row_index][col_index - 1] = 1
        end
    end
    
    
    
    def blur(md)
      @n = md.to_i
      
        @n.times do 
            addresses = []
            @pixels.each_with_index do |row, row_index|
                row.each_with_index do |location, col_index|
                    if location == 1
                        addresses.push([row_index, col_index])
                    end
                end
            end
                    
            addresses.each do |address|
                row_index,col_index = address
                
            transform_the_pixels(row_index, col_index)
            end
        end
    end  
end