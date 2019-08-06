require_relative "Card"
require "byebug"
class Board
    def initialize
        @grid = Array.new(4) { Array.new(4,0)}
    
    end

    def [] position
        row,col = position[0],position[1]
        @grid[row][col]
    end

    def []= position, value
        row,col = position[0],position[1]
        @grid[row][col] = value
    end

    def check_empty?

        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                position = [row, col]
                return self[position] if self[position] == 0
            end
        end

    end


    def populate #fills board with pairs
        #  position = [rand(0...@grid.length), rand(0...@grid.length)]
        pair_values = ('A'..'H').to_a
        debugger
        3.times do# while !pair_values.empty?
            card_val = pair_values.pop

            2.times do
                x = rand(0..@grid.length-1)
                y = rand(0..@grid.length-1)
                pos = [x,y]
                until self[pos] == 0
                    x = rand(0..@grid.length-1)
                    y = rand(0..@grid.length-1)
                end 
                self[pos] = Card.new(card_val)
            end
        end
        
        while !pair_values.empty?
            card_val = pair_values.pop
            2.times do
                position = self.check_empty?
                position = Card.new(card_val)
            end
        end
    end

    def render(guess) #Prints the Board
        
        print "  " 
        (0...@grid.length).each do |i|
            print i
            print " "
        end    
        print "\n"
         @grid.each_with_index do |row,i|
            print i
            print " "
            row.each_with_index do |tile, j|
                
                if i != 0
                    print " "
                    if [i,j] == guess || self[i,j].face_up
                        print self[i,j].face_Value
                    else
                        print tile
                    end
                else 
                    if [i,j] == guess || self[i,j].face_up
                        print self[i,j].face_Value
                    else 
                        print tile
                    end
                end
            end
            print "\n"
        end
    end
    
    def won? #Check if all card is face up
        @grid.all? 
        row.all? |position| position.face_up == true
    end
    end

    def reveal(render) #Should reveal cards at a guessed position
        card_1 = gets.chomp 
        self.render(card_1)  
        
        card_2 = gets.chomp
        if self[card_1]== self[card_2]
            card_1.reveal
            card_2.reveal
        end
        card_1.hide
        card_2.hide

        
    end


    
end