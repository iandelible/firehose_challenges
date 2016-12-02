class Image
    attr_reader :pixel_rows
                
    def initialize (pixel_rows)
        @lines = pixel_rows
    end
    
    def output_image
        @lines.each do |row|
            row.each do |pixel|
                print pixel
            end
            print "\n"
        end
    end 
    
    def blur_pixel(row_index, col_index)
        if col_index + 1 < @lines[row_index].length 
            @lines[row_index][col_index + 1] = 1  #side to side
        end
        if col_index - 1 >= 0
            @lines[row_index][col_index - 1] = 1
        end
        if row_index + 1 < @lines.length
            @lines[row_index + 1][col_index] = 1  #top and bottom
        end
        if row_index - 1 >= 0
            @lines[row_index - 1][col_index] = 1
        end
    end 
    
    def blur(n)
        # number of times to blur
        
        n.times do 
            # grabs coordinates
            coordinates = []
            @lines.each_with_index do |row, row_index| 
                row.each_with_index do |pixel, col_index|
                    if pixel == 1
                        coordinates.push([row_index, col_index]) #pushes array of coordinates
                    end
                end
            end
            
            # then transform coordinates 
            coordinates.each do |coord|
                row_index,col_index = coord #coord is array, left side of equation extracts elements from array
                row_index = coord[0]        #another way to extract the elements from the array
                col_index = coord[1]        # maybe use .collect method ???
                 
                 
                blur_pixel(row_index, col_index) 
            
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
image.blur(2)
image.output_image