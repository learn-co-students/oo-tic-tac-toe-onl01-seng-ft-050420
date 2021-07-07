require 'pry'


class TicTacToe
  
   WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  
  
  def initialize 
    @board = Array.new(9, " ")
  end
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end
  
  def move(input, token = "X")
    @board[input] = token
  end
  
  def position_taken?(input)
    @board[input] != " "
  end


  def valid_move?(input)
    
    input.between?(0,8) && !position_taken?(input)
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Enter a number between 1-9:"
    input = gets.strip
    
    index = input_to_index(input)
    
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
      
    else
      puts "Invalid"
      turn
      
    end
    
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  
 
 
  def won?
    #winning_combination = nil
    
    WIN_COMBINATIONS.each do |win_comb| 
      first = win_comb[0]
      second = win_comb[1]
      third = win_comb[2]
      
      if @board[first] == @board[second] && @board[second] == @board[third] && position_taken?(first)
       return win_comb
        
        
        
      # if @board[first] == "X" && @board[second] =="X" && @board[third] == "X"
      #   winning_combination = win_comb
      # elsif @board[first] == "O" && @board[second] =="O" && @board[third] == "O"
      #   winning_combination = win_comb
      # end
      end
      
    
    end
    nil
    
  end
 
  
  def full?
    if turn_count == 9
      true
    end
  end 
  
  def draw?
    if !won? && full?
      true
    elsif !won? && !full?
      false
    else
      false 
    end
  end 
  
  
  def over?
     won? || draw?
  end 
  
  def winner 
   
    if won? 
   
      win_comb = won?
      index = win_comb[0]
      
      return @board[index]
      
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
  
 