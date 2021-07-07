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
  
  def initialize
    @board = [
      " "," "," ",
      " "," "," ",
      " "," "," "
    ]
  end

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

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    if position_taken?(position) == false && position.between?(0, 8)
      return true
    else
      return false
    end
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "What is your move? (1 - 9):"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo| # This was difficult; lots of trial and error. Is there a better way?
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
        return combo
      end
    end
    false
  end

  def full?
    @board.all? { |token| token == "X" || token == "O"}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if full? || won? || draw? # Ohhhh my god, lacking .draw? here gave me an infinite loop called by the .play method!
      return true
    else
      return false
    end
  end

  def winner
    if won?
      @board[won?[0]] # Still don't quite understand how this works...
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end