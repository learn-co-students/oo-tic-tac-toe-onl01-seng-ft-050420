require "pry"

class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display_board
    game = @board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input) #input = "1"
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    #when an index value is passed for a move
    ((@board[index] == "X" || @board[index] == "O"))
  end
  
    #check to see if that position on the @board is open or if it has an x or o
    #if it is free, then it should be FALSE, else it will remain true
    
   def valid_move?(index)
     if !position_taken?(index) && index >= 0 && index <=8
       true
     else
       false
   end
   end
  
   def turn 
     puts "Please enter a position between 1-9:"
     input = gets.strip
     index = input_to_index(input)
     person = current_player
     if valid_move?(index)
       move(index, person)
       display_board
     else 
       turn
    end
    end
    
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
    
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
  WIN_COMBINATIONS.detect do |winning_code|
    if "X" == @board[winning_code[0]] && "X" == @board[winning_code[1]] && "X" == @board[winning_code[2]]
      return winning_code
    elsif "O" == @board[winning_code[0]] && "O" == @board[winning_code[1]] && "O" == @board[winning_code[2]]
      return winning_code
  end
  end
  end
  
  def full?
   @board.all? do |index|
     index == "X" || index =="O"
     end
   end
   
   def draw?
     full? && !won?
   end
    
  def over?
      if won? || draw?
        true
      else
    end
    end 
    
   def winner
     if won?
        @board[won?[1]]
     end   
   end
   
   def play
     until over? == true
     turn
   end
   
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
   end
   #Calling the gets method captures the last thing the user typed into the terminal. #Whenever your program makes a call to gets, it will freeze and wait for user input
    
end
  
  
