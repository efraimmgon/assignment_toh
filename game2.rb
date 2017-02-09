# ------------------------------------------------------------------------
# Tasks
# ------------------------------------------------------------------------

# Wrap everything in a class and focus on separating different functionality
# into methods instead of creating one long run-on game method.

#Create a game loop that finishes when the user either quits (for instance,
# by entering quit on the input line) or wins.

# Check for valid user inputs

# Create a render method which prints out the current state of the game
# board in between turns. START SIMPLE! The render method usually gives
# people the most frustration. Start by just printing the game state in
# numeric form before you try to get creative with your output.

# ------------------------------------------------------------------------
# Game
# ------------------------------------------------------------------------

class TowerOfHanoi

  # initialize => number_of_towers, board [ok]
  # welcome => info messages [ok]
  # render => state of the board [ok]
  # prompt_move => move
  # move
  # game_over?
  # loop

  attr_accessor :app_state

  def initialize(levels=3)
    @app_state = {
      board: [(1..levels).map { |n| n }, [], []]
    }
  end

  def welcome
    msgs = [
      "Welcome to Tower of Hanoi!",
      "Instructions:",
      "Enter where you'd like to move from and to",
      "in the format '1,3'. Enter 'q' to quit.",
    ]
    msgs.each { |msg| puts msg }
  end

  def render
    "prints out the current state of the game board in between turns"
    puts
    puts "Current Board:"
    print app_state[:board].to_s + "\n"
  end

  def prompt_move
    print "Enter move > "
    gets
  end

  def sanitize_move(move_str)
    move_str.strip.split(",").map { |s| s.to_i }
  end

  def valid_move?(from, to)
    level_to_move = app_state[:board][from-1].first
    to = app_state[:board][to-1]
    if to.any? { |l| l < level_to_move }
      false
    else
      true
    end
  end

  def move(from, to)
    tower_level = app_state[:board][from-1].shift
    app_state[:board][to-1].unshift(tower_level)
  end

  def game_over?
    if app_state[:board][2] == [1,2,3]
      true
    else
      false
    end
  end

  def run_game
    if game_over?
      puts "You've won"
    else
      render
      from, to = sanitize_move(prompt_move)
      if valid_move?(from, to)
        move(from, to)
      else
        puts "\nEnter a valid move."
      end
      run_game
    end
  end

  def play
    welcome
    run_game
  end

end

toh = TowerOfHanoi.new
toh.play
