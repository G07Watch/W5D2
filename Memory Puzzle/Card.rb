


class Card
    attr_reader :face_up
    attr_accessor :face_Value

    def initialize(face_Value)
        @face_Value = face_Value
        @face_up = true 
    end

    def reveal
        @face_up = true
    end

    def hide
        @face_up = false
    end

    def ==(other_card) #Checks for pair
        return true if (card.face_Value <=> other_card.face_Value) 

    end


end