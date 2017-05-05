class WinChecker

  public
  def check_for_win(grid,piece)
    return true if up_down_check(grid,piece) == true
    return true if left_right_check(grid,piece) == true
    return true if diagnal_check(grid,piece) == true

    # if the above return false and the board is found full, tie game
    if tie_check(grid) == true
      puts "TIE GAME, PLAY AGAIN!!!"
      return true
    end

    false
  end

  private
  def up_down_check(grid,piece) #checks up and down each column
  	count = 0

    for w in 0...7
      for h in 0...6 

        if grid[h][w].include? piece
          count += 1
          return true if count == 4
        else
      	  count = 0
        end

      end
    end
    false
  end

  def left_right_check(grid,piece) #checks across each row
  	count = 0

    for h in 0...6
      for w in 0...7

        if grid[h][w].include? piece
          count += 1
          return true if count == 4
        else
      	  count = 0
        end

      end
    end
    false
  end

  def diagnal_check(grid,piece)
    # checks starting from the bottom of the grid
    5.downto(0) do |h|
      for w in 0..6 do
        if grid[h][w].include? piece
          
          # set/reset counters
          count = 1
          n = 1
          
          # Checks / going up
          3.times do
          	unless grid[h-n].nil? || grid[h-n][w+n].nil?
              count += 1 if grid[h-n][w+n].include? piece
              n += 1
            end
            return true if count == 4
          end
          
          # reset counters
          count = 1
          n = 1

          # Checks \ going up
          3.times do
          	unless grid[h-n].nil? || grid[h-n][w-n].nil?
              count += 1 if grid[h-n][w-n].include? piece
              n += 1
            end
            return true if count == 4
          end

        end
      end
    end
  end

  def tie_check(grid)
  	full_grid = true # assumes grid is full...
  	for h in 0...6
  	  for w in 0...7
  	  	if grid[h][w].include? " " # ...until it finds an empty space
  	  	  full_grid = false
  	  	end 
  	  end
  	end
    full_grid
  end



end