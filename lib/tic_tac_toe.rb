class TicTacToe
    #instance method represents a decrete, single functionality.
    #9 elements using " " to represent the empty cells
    #using (gets) for plyers to chhose a position by choosing 1-9....
    #....and fill it out with the token of the player
    #keep track of who turn it is
    #keep track of the amount of turn that have been played
    #check every turn to see if there is a winner...
    #..if there is a winner CONGRATULTE them.

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
    ]

    def display_board
        
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts "-------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}" 
    end

    def input_to_index(user_input)
        user_input.to_i - 1 #pass user imput (in the form of a string)
        #return the corresponding index of the @board array 
    end
end