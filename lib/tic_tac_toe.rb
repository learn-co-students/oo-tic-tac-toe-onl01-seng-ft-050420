require 'pry'
class TicTacToe
  def initialize
    @board= [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    
  end
   
  WIN_COMBINATIONS=[
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

  def input_to_index(number)
    int= number.to_i 
    @index= int - 1
    @index
  end

  def move(number, token="X")
    @token=token
    @board[number]= token
  end

  def position_taken?(number)
    if @board[number] == " "
       false
    else
        true
    end
  end
  
  def valid_move?(number)
     if @board[number] == " " && number.between?(0,8)
        true
     else
         false
     end
  end

  def turn_count
    empty_spaces= @board.count(" ")
    @number_of_turns_played= 9 - empty_spaces
    @number_of_turns_played
  end

  def current_player
    player= self.turn_count
    if @number_of_turns_played.even? == true
        "X"
    else
        "O"
    end
  end
  
  def turn
    position = gets
  new_index= input_to_index(position)
    if valid_move?(new_index)
      token= current_player
      move(new_index, token)
    else
    turn
    end
    display_board
  end


end