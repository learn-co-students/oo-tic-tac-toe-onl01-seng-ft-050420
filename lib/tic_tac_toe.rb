class TicTacToe
  
  attr_accessor :board
  WIN_COMBINATIONS = [  [0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [2,4,6] ]
  
  def initialize
    @board = [" ", " ", " ", 
              " ", " ", " ", 
              " ", " ", " "]
    
  end
  
  def display_board
    print " #{board[0]} | #{board[1]} | #{board[2]} "
    print "-----------"
    print " #{board[3]} | #{board[4]} | #{board[5]} "
    print "-----------"
    print " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    return @board[index] != " "
  end
  
  def valid_move?(index)
    return index >= 0 && index <= 9 && !position_taken?(index)
  end
  
  def turn_count
    return @board.count {|x| x != " "}
  end
  
  def current_player
    turn_count.odd? ? "O" : "X" 
  end
  
  def turn
    input = gets
    index = input_to_index(input)
    
    while !valid_move?(index)
      input = gets
      index = input_to_index(input)
    end
    
    @board[index] = current_player
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
    end
    
    return nil
  end
  
  def full?
    return !@board.include?(" ")
  end
  
  def draw?
    return full? && !won?
  end
  
  def over?
    return won? || draw?
  end
  
  def winner
    if won? != nil
      return board[won?[0]]
    else
      return nil
    end
  end
  
  def play
    while !over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end