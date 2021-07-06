require 'pry'



class TicTacToe 
  
  attr_reader :board, :new
  
  def initialize()
    @board = Array.new(9," ")
    
  end 
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]
  
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

  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    !(@board[index] == " ")
  end 
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8) 
  end 
  
  def turn_count
    @board.select {|position| position == "X" || position == "O"}.count
  end 
  
  def current_player
    if turn_count.odd?
      "O"
    else 
      "X"
    end
  end 
 
  def turn 
    puts "Choose a square, pick 1-9:" 
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      puts "Lets try this again."
      turn
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.each do |array|
      index1 = array[0]
      index2 = array[1]
      index3 = array[2]
      
      win1 = @board[index1]
      win2 = @board[index2]
      win3 = @board[index3]
      
      if win1 == "X" && win2 == "X" && win3 == "X"
        return array
      elsif win1 == "O" && win2 == "O" && win3 == "O"
        return array
      end 
    end 
    if @board.all? {|index| index == "X" || index == "O"}
      false 
    end 
  end 
  
  def full? 
    @board.all? {|index| index == "X" || index == "O"}
  end 
  
  def draw? 
    full? && !won?
  end 
  
  def over? 
    draw? || won?
  end 
  
  def winner
    if won?
      @board[won?[0]]
    end 
  end 
    
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end 
    
    
    
end 
