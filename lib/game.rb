require './lib/player.rb'
require './lib/grid.rb'
require './lib/board.rb'
require './lib/win_checker.rb'

# GAME INTRO
puts "Welcome to Connect Four!\n"
puts "Player 1, please enter your name:\n"
name1 = gets.chomp
puts "Player 2, please enter your name:\n"
name2 = gets.chomp
puts
puts "#{name1} you have \u{26aa} 's, #{name2} you have \u{26ab} 's\n\n"
puts "----------------------------------------------------------------\n"


player1 = Player.new(name1, "\u{26aa}")
player2 = Player.new(name2, "\u{26ab}")
board = Board.new
grid = Grid.new
checker = WinChecker.new

# initial draw
board.draw_slots(grid.slots)

# Main game loop:
loop do
  loop do
    puts "#{player1.name}, make your move:\n"
    move = gets.chomp.to_i

    if grid.update_grid(move,player1.piece)
      break
    else
      puts "Invalid move, please try again...\n"
    end
  end

  board.draw_slots(grid.slots)
  if checker.check_for_win(grid.slots,player1.piece) == true
  	puts "#{player1.name} WINS!!!"
  	break
  end

  loop do
    puts "#{player2.name}, make your move:\n"
    move = gets.chomp.to_i

    if grid.update_grid(move,player2.piece)
      break
    else
      puts "Invalid move, please try again...\n"
    end
  end

  board.draw_slots(grid.slots)
  if checker.check_for_win(grid.slots,player2.piece) == true
  	puts "#{player2.name} WINS!!!"
  	break
  end
end


