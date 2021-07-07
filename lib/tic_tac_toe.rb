require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index) #returns true or false
    @board[index] != "" && @board[index] != " "
  end
  
  def valid_move?(index) #returns true or false
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn
    puts "Please enter a number (1-9):"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |token|
      if token == "O" || token == "X"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.collect do |combos|
      if @board[combos[0]] == @board[combos[1]] && @board[combos[1]] == @board[combos[2]] && position_taken?(combos[0])
        return combos
      end
    end
    false
  end
  
  def full?
    @board.all?{|index| index != " "}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      return @board[won?[0]]
    end
  end
  
  def play 
    turn until over?
      if won? 
        puts "Congratulations #{winner}!"
      else 
        puts "Cat's Game!"
      end
  end
  
end