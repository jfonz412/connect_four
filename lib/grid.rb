class Grid
  attr_reader :slots

  def initialize
  	@slots = make_grid # did not want to call grid.grid
  end

  public
  def update_grid(move,piece)
    return false if validate_move(move) == false

    move = move - 1
    move_successful = false

    5.downto(0) do |n|
      if slots[n][move] == "| "
      	slots[n][move] = "|#{piece}"
      	move_successful = true
      	break
      end
    end

    move_successful ? true : false
  end

  private
  def validate_move(move)
  	return false unless move.is_a? Integer
    return false unless move.between?(1,7)
  end

  # 6 rows high, 7 columns wide
  def make_grid 
  	slots = []
  	for h in 0...6 
  		slots[h] = []
  	  for w in 0...7
  	  	slots[h][w] = "| "
  	  end
  	end
  	@slots = slots
  end
end