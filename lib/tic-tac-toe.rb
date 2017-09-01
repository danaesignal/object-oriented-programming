class TicTacToe
  attr_accessor :board
  def initialize
    @winner = "nobody"
    @board = Hash.new
    for i in 97..99 do
      for x in 1..3 do
        cur_space = i.chr + x.to_s
        @board[cur_space] = " "
      end
    end
  end

  def game_state
    @board
  end

  def display_board
    puts "  |---------1---------|---------2---------|---------3---------|"
    puts "A |         #{@board["a1"]}         |         #{@board["a2"]}         |         #{@board["a3"]}         |"
    puts "  |-------------------|-------------------|-------------------|"
    puts "B |         #{@board["b1"]}         |         #{@board["b2"]}         |         #{@board["b3"]}         |"
    puts "  |-------------------|-------------------|-------------------|"
    puts "C |         #{@board["c1"]}         |         #{@board["c2"]}         |         #{@board["c3"]}         |"
    puts "  |-------------------|-------------------|-------------------|"
  end

  def place_mark(mark, space)
    @board[space] = mark
    self.check_win(mark)
  end

  def mark_query(mark)
    cur_player = "Player 1" if mark == "X"
    cur_player = "Player 2" if mark == "O"

    self.display_board()
    puts "#{cur_player}, pick an empty square on the grid above."
    user_input = gets.chomp.downcase
    until (@board.keys.include? user_input) && (@board[user_input] == " ") do
      puts "Invalid entry! Please try again."
      user_input = gets.chomp.downcase
    end
    puts "#{cur_player} has chosen #{user_input}!"
    self.place_mark(mark,user_input)
  end

  def check_win(player)
    ways_to_win = [
      ["a1","a2","a3"],
      ["b1","b2","b3"],
      ["c1","c2","c3"],
      ["a1","b1","c1"],
      ["a2","b2","c2"],
      ["a3","b3","c3"],
      ["a1","b2","c3"],
      ["a3","b2","c1"],
    ]
    ways_to_win.each do |condition|
      if (@board[condition[0]] == player && @board[condition[1]] == player && @board[condition[2]] == player)
        @winner = player
      end
    end
  end

  def winner
    @winner
  end

  def play_game
    puts "Let's play Tic-Tac-Toe!"
    puts "Player 1, you're X! Player 2, you're O!"
    puts "\n"
    9.times do
      self.mark_query("X")
      break unless @winner == "nobody"
      self.mark_query("O")
      break unless @winner == "nobody"
    end

    self.display_board()

    case @winner
    when "nobody"
      puts "It's a draw! GG!"
    when "X"
      puts "Player 1 wins! GG"
    when "O"
      puts "Player 2 wins! GG"
    end
  end
end

# game = TicTacToe.new
# game.play_game
