class TicTacToe
  attr_accessor :board
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
  
  def input_to_index(index)
    index = index.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) ? true : false
  end

  def turn
    puts "Select your position (1 - 9): "
    input = input_to_index(gets.chomp)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      puts "Invalid Position"
      turn
    end
  end 
    
  def turn_count
    count = 0 
    @board.each do |square|
     if square != " "
     count += 1
     end
   end
   count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    false
  end

  def full?
    turn_count == 9 ? true : false
  end
  
  def draw?
    full? && !won? ? true : false
  end
  
  def over?
    won? || draw? ? true : false
  end
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def play 
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

  

