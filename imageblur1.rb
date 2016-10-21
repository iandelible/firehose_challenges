
class Image
    
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
end 


image = Image.new([
    [0,0,0,0],
    [0,1,0,0],
    [0,0,0,1],
    [0,0,0,0]
    ])
image.output_image