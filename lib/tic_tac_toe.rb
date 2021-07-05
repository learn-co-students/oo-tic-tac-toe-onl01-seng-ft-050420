require 'pry'
class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3 ,6], # Left column
  [1, 4, 7], # Middle colomn
  [2, 5, 8], # Right colomn
  [0, 4, 8], # Left Diagonal
  [2, 4, 6]  # Right Diagonal
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board_index, token)
    @board[board_index] = token
  end

  def position_taken?(index)
    @board[index].include?(" ") ? false : true
  end

  def valid_move?(index)  #valid_move(0) => false
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count {|i| ["X", "O"].include? i}
  end

  # def turn
  #   # puts current_player
  #   input = gets.chomp #=> 3
  #   index = input_to_index(input) #=> index = 2
  #   if (valid_move?(index) == true)
  #     move(index, current_player)
  #     display_board
  #   else
  #     # puts "1"
  #     turn
  #   end
  #
  # end

def turn
  puts "Please choose a number 1-9:"
  input = gets.chomp

  index = input_to_index(input)
  if valid_move?(index)
    # player_token =
    move(index, current_player)

  else
      input = gets.chomp
  end
  display_board
end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    # win_array = []
    WIN_COMBINATIONS.each do|sub_array|
      winner_1 = sub_array[0]
      winner_2 = sub_array[1]
      winner_3 = sub_array[2]

      won_1 = @board[winner_1]
      won_2 = @board[winner_2]
      won_3 = @board[winner_3]

      if won_1 == "X" && won_2 == "X" && won_3 == "X"
        return sub_array

      elsif won_1 == "O" && won_2 == "O" && won_3 == "O"
         return sub_array
       end
     end
false
end

  def full?
  if @board.include?(" ")

    return false
   else
     return true
   end
  end

  def draw?
    if full?

      won?.class == Array ? false : true

    else
      return false
    end
  end
  #check if the game is won? or is full? and returns true
  def over?
   draw? || won? ? true : false
  end
  #return 'X' if X won, 'O' if O won, 'nil' if it was a draw
  #check won? result.
  #if won? includes
  def winner
    WIN_COMBINATIONS.each do|sub_array|
      winner_1 = sub_array[0]
      winner_2 = sub_array[1]
      winner_3 = sub_array[2]

      won_1 = @board[winner_1]
      won_2 = @board[winner_2]
      won_3 = @board[winner_3]

      if won_1 == "X" && won_2 == "X" && won_3 == "X"
        return "X"

      elsif won_1 == "O" && won_2 == "O" && won_3 == "O"
         return "O"
       end
     end
     nil
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
   #
  #  if over?
  #    binding.pry
  #    puts "over yo"
  #  end

end
