require './lib/player.rb'
require './lib/grid.rb'

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
grid = Grid.new

  loop do
    puts "#{player1.name}, make your move:\n"
    move = gets.chomp.to_i
    if grid.update_grid(move,player1.piece)
      break
    else
      "Invalid move, please try again...\n"
    end
  end


  loop do
    puts "#{player2.name}, make your move:\n"
    move = gets.chomp.to_i
    if grid.update_grid(move,player2.piece)
      break
    else
      "Invalid move, please try again...\n"
    end
  end

