class GameBoard
  def initialize
    @allowable_colors = [:red,:green,:blue,:yellow,:orange,:purple]
    @code = {}
    @guess = {}
    @color_matches = 0
    @exact_matches = 0
    @winner = false
    @codebreaker = "You"
  end

  def start_game
    preference = ""
    puts "Would you like to be the codemaster, or the codebreaker?"
    while preference != ("codebreaker" || "codemaster")
      preference = gets.chomp.downcase
      break if preference == "codebreaker" || preference == "codemaster"
      puts "Invalid entry, please check your spelling."
    end
    puts "\n"
    if preference == "codebreaker"
      play_game
    else
      watch_game
    end
  end

  def watch_game
    @codebreaker = "The Computer"
    manual_code
    12.times do
      robo_guess
      check_guess
      break if @winner ==true
    end
    toast
  end

  def play_game
    random_code
    # puts @code
    12.times do
      guess
      check_guess
      break if @winner == true
    end
    toast
  end

  private

  def toast
    puts "\n#{@codebreaker} wins!" unless @winner == false
    puts "\n#{@codebreaker} loses!" unless @winner == true
  end

  def robo_guess
    puts "\nThe Computer is attempting to crack the code!\n"
    4.times do |i|
      hopper = nil
      until @allowable_colors.include? hopper
        hopper = @allowable_colors.sample(1)[0]
      end
      @guess[i] = hopper
    end
    puts "\nThe Computer's guess:"
    puts @guess.values.to_a.join(", ").capitalize + ".\n\n"
  end

  def manual_code
    puts "\nEnter the four colors that will comprise the code, one at a time."
    puts "\nAs a reminder, the code must be comprised of the following possible colors (duplicates allowed):"
    puts "\n" + @allowable_colors.join(", ").capitalize + ".\n\n"
    4.times do |i|
      hopper = nil
      until @allowable_colors.include? hopper
        hopper = gets.chomp.downcase.to_sym
        break if @allowable_colors.include? hopper
        puts "Invalid entry, please try again."
      end
      @code[i] = hopper
    end
    puts "\nYour code:\n"
    puts @code.values.to_a.join(", ").capitalize + "."
  end

  def random_code
    4.times do |i|
      @code[i] = @allowable_colors.sample(1)[0]
    end
  end

  def guess()
    puts "\nEnter the four colors you think comprise the code, one at a time."
    puts "\nAs a reminder, the code is comprised of the following possible colors (duplicates allowed):"
    puts "\n" + @allowable_colors.join(", ").capitalize + ".\n\n"
    4.times do |i|
      hopper = nil
      until @allowable_colors.include? hopper
        hopper = gets.chomp.downcase.to_sym
        break if @allowable_colors.include? hopper
        puts "Invalid entry, please try again."
      end
      @guess[i] = hopper
    end
    puts "\nYour guess:\n"
    puts @guess.values.to_a.join(", ").capitalize + ".\n\n"
  end

  def color_matching
    @color_matches = 0
    @guess.values.uniq.each do |i|
      @color_matches += @code.values.count(i)
    end
  end

  def space_matching
    @exact_matches = 0
    @guess.each do |key, value|
      @exact_matches += 1 if @code[key] == value
    end
  end

  def check_guess
    color_matching
    space_matching
    if @exact_matches == 4
      @winner = true
    else
      puts "#{@codebreaker} correctly guessed #{@exact_matches} parts of the code."
      puts "#{@codebreaker} correctly identified #{@color_matches} colors used in the code.\n\n"
    end
  end

end

game = GameBoard.new
game.start_game
