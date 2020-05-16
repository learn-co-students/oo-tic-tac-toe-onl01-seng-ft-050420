require "pry"

class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
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
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    num = input.to_i
    num -= 1
  end 
  
  def move(board_index, player_token)
    @board[board_index] = player_token 
   
  end 
  
  def position_taken?(index)
    @board[index] == "X"  || @board[index] == "O"
  end 
  
  def valid_move?(index)
    
    @board[index] != "X"  &&  @board[index] != "O" && (0..8).include?(index)
  end 
  
  def turn
    puts "What is your move? (1 - 9):"
    input = input_to_index(gets.chomp)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else 
      puts "Invalid"
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
    WIN_COMBINATIONS.detect do |win_combination| # .detect returns the first for which block is not false.
      if @board[win_combination[0]] == "X" && 
         @board[win_combination[1]] == "X" && 
         @board[win_combination[2]] == "X"
        return win_combination
      elsif @board[win_combination[0]] == "O" && 
          @board[win_combination[1]] == "O" && 
          @board[win_combination[2]] == "O"
        return win_combination
      end
        false 
    end
    return false
  end
  
  def full?
    @board.all? { |element| element == "X" || element == "O" }
  end 
  
  def draw?
    if full? == true &&  won? == false
      return true
    else 
      return false 
    end
  end 
   
  def over?
    if draw? == true || won? != false 
      return true
    else
      return false
    end 
  end 
  
  def winner
    if won? == false 
      return nil 
    elsif @board[won?[0]].include?("X")
      return "X"
    elsif @board[won?[0]].include?("O")
      return "O"
    end
  end 
  
  def play
    
    while over? == false
      turn
    end  
      

      if draw?
    	  puts "Cat's Game!"
      elsif winner == "X" 
    	  puts "Congratulations X!"
      elsif winner == "O"
    	  puts "Congratulations O!"
      end
  end 


end 