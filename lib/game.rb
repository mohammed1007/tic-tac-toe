require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    setup_players
    @current_player = @players.first
  end

    def setup_players
    puts "Welcome to Tic-Tac-Toe!"
    print "Player 1 name: "
    name1 = gets.chomp
    print "Player 2 name: "
    name2 = gets.chomp
    @players = [Player.new(name1, "X"), Player.new(name2, "O")]
  end

  def play
    loop do
      @board.display
      move = @current_player.get_move(@board)
      @board.place_mark(move, @current_player.mark)
            if @board.winner?(@current_player.mark)
        @board.display
        puts "#{@current_player.name} wins!"
        break
      elsif @board.full?
        @board.display
        puts "It's a draw!"
        break
      else
        switch_player
      end
    end
  end
  
  def switch_player
    @current_player = @players.reverse.find { |p| p != @current_player }
  end
end
