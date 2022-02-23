# frozen_string_literal: true

# Houses all 64 squares
class Board
  class << self
    attr_accessor :squares
  end
  @squares = []

  def initialize; end
end

# squares on the board (the nodes)
class Square
  attr_reader :position, :previous

  def initialize(position, previous)
    @position = position
    @previous = previous
    Board.squares << position
  end
end

# the game piece
class Knight
  def initialize; end

  MOVES = [[1, 2], [2, 1], [2, -1], [1, -2],
           [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

  def neighbors(square)
    pos = square.position
    MOVES.map { |m| [pos[0] + m[0], pos[1] + m[1]] }
         .keep_if { |m| valid_square?(m) }
         .reject { |m| Board.squares.include?(m) }
         .map { |m| Square.new(m, square) }
  end

  def valid_square?(position)
    position[0].between?(1, 8) &&
      position[1].between?(1, 8)
  end

  def moves(start_pos, end_pos)
    queue = []
    current_square = Square.new(start_pos, nil)
    until current_square.position == end_pos
      neighbors(current_square).each { |n| queue.unshift(n) }
      current_square = queue.pop
    end
    display(path(current_square))
  end
end

def path(square, path = [])
  path.unshift(square.position)
  return path if square.previous.nil?

  path(square.previous, path)
end

def display(path)
  puts "The shortest path involves #{path.size - 1} moves. The knight traveled: "
  path.each { |square| p square }
end
