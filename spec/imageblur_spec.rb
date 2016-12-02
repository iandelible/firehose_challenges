require "imageblur"

RSpec.describe Image, "#blur" do 
    context "with a MD of 2" do
        it "blurs the image" do 
            image = Image.new([[0,0,0,0,0,0,0,0],
                               [0,0,0,0,0,0,0,0],
                               [0,0,0,1,0,0,0,0],
                               [0,0,0,0,0,0,0,0],
                               [0,0,0,0,0,0,0,0]
                               ])
            image.blur(2) 
            expect(image.pixels).to eq([[0,0,0,1,0,0,0,0],
                                        [0,0,1,1,1,0,0,0],
                                        [0,1,1,1,1,1,0,0],
                                        [0,0,1,1,1,0,0,0],
                                        [0,0,0,1,0,0,0,0]
                                        ])
        end
    end
    
    context "with a MD of 3" do 
        it "blurs  the image" do 
            image = Image.new([[0,0,0,0,0,0,0,0],
                               [0,0,0,0,0,0,0,0],
                               [0,0,0,0,0,0,0,0],
                               [0,0,0,1,0,0,0,0],
                               [0,0,0,0,0,0,0,0],
                               [0,0,0,0,0,0,0,0],
                               ])
            image.blur(3)
            expect(image.pixels).to eq([[0,0,0,1,0,0,0,0],
                                        [0,0,1,1,1,0,0,0],
                                        [0,1,1,1,1,1,0,0],
                                        [1,1,1,1,1,1,1,0],
                                        [0,1,1,1,1,1,0,0],
                                        [0,0,1,1,1,0,0,0],
                                        ])
        end 
    end
end