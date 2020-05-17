require "pry"
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
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
  def input_to_index(i)
    return i.chomp.to_i - 1
  end
  def move(i, token = "X")
    @board[i] = token
  end
  def position_taken?(i)
    if @board[i] != " "
      return true
    else
      return false
    end
  end
  def valid_move?(i)
    if i >= 0 && i <= 8 && !position_taken?(i)
      return true
    else
      return false
    end
  end
  def turn()
    player = current_player
    puts "It is #{player}'s turn! Enter a number between 1-9 to chose a spot."
    input = gets
    index = input_to_index(input)
    wait = true
    while wait do
    if valid_move?(index)
      move(index, player)
      display_board
      wait = false
    else
      puts "This move is invalid! Enter a number between 1-9 to chose a spot."
      input = gets
      index = input_to_index(input)
    end
  end
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
    winning_set = []
    WIN_COMBINATIONS.each do |v|
      set = []
      set << @board[v[0]]
      set << @board[v[1]]
      set << @board[v[2]]
      if (set.include?("X") && !set.include?("O") && !set.include?(" ")) || (set.include?("O") && !set.include?("X") && !set.include?(" "))
        winning_set = v
      end
      
    end
    if winning_set != []
    return winning_set
  else
    return false
  end
  end
  def full?
    if turn_count == 9
      return true
    else
      return false
    end
  end
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end
  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end
  def winner
    if won?
      return @board[won?[0]]
    end
  end
  def play 
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end