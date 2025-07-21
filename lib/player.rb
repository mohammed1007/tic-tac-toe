class Player 
  
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def name
    @name
  end

  def mark
    @mark 
  end

  def get_move(board)
    loop do 
      puts ""
      puts "#{@name} (#{@mark}), please enter your move."
      puts "type the row number then a comma then the column number like this: 0,0 for top left or 2,2 for bottom right "
      print "enter your move here: "

      input = gets.chomp

      parts = input.split(',')

      if parts.length == 2
        row_str = parts[0]
        col_str = parts[1]

        row = row_str.to_i
        col = col_str.to_i

        if board.valid_move?([row,col]) 
          return [row, col]
        else
          puts "the move is invalid"
        end
      else
        puts "invalid format"
      end
    end
  end
end



