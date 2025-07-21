class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }  # 3x3 grid filled with spaces
  end

  def display
    puts "\n"
    @grid.each_with_index do |row, i|
      puts row.map.with_index { |cell, j| cell.empty? ? " " : cell }.join(" | ")
      puts "--+--+--" unless i == 2
    end
    puts "\n"
  end

  def place_mark(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def valid_move?(pos)
    row, col = pos
    pos.all? { |n| n.between?(0, 2) } && @grid[row][col] == " "
  end

  def winner?(mark)
    3.times do |i|
      return true if @grid[i].all? { |cell| cell == mark }             # row
      return true if @grid.map { |row| row[i] }.all? { |cell| cell == mark }  # column
    end

    return true if [0, 1, 2].all? { |i| @grid[i][i] == mark }           # diagonal \
    return true if [0, 1, 2].all? { |i| @grid[i][2 - i] == mark }       # diagonal /

    false
  end

  def full?
    @grid.flatten.none? { |cell| cell == " " }  # no empty spaces = board full
  end
end
