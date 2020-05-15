class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(move)
        index = move.to_i - 1
        index 
    end

    def move(index, token = "X")
        @board[index] = token 
    end 

    def position_taken?(index)
        @board[index] == " " ? false : true  
    end
    
    def valid_move?(position)
        position.between?(0,8) && !position_taken?(position) 
    end 

    def turn_count
        counter = 0 
        @board.each do |position|
            if position == "X" || position == "O"
                counter += 1
            end 
        end 
        counter 
    end 

    def current_player 
        if turn_count.even?
            "X"
        else 
            "O"
        end 
    end 

    def turn 
        puts "Please enter a number between 1 and 9"
        input = gets
        position = input_to_index(input)
        token = current_player
        
        if valid_move?(position) 
            move(position, token) 
            display_board
        else 
            puts "Invalid move...try again"
            turn 
        end
    end
    
    def won?
        WIN_COMBINATIONS.find do |combo|
            position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] 
        end  
    end 

    def full? 
        @board.all? do |position| 
            position == "X" || position == "O"
        end 
    end
    
    def draw? 
        full? && !won?
    end 

    def over? 
        won? || full? || draw?
    end 

    def winner
       WIN_COMBINATIONS.detect do |combo|  
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                return "X"
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return "O"
            else 
                nil  
            end 
        end  
    end
    
    def play 
        until over? 
            turn 
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end 
    end 


end    