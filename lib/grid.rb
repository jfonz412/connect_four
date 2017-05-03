class Grid
  attr_reader :slots

  def initialize
  	@slots = make_grid
  end

  public
  def update_grid(move,piece)
    return false if validate_move(move) == false
    move = move - 1

    5.downto(0) do |n|
      if slots[n][move] == " "
      	slots[n][move] = piece
      	break
      end
    end

    return true
  end

  private
  def validate_move(move)
  	return false unless move.is_a? Integer
    return false unless move.between?(1,7)
    true
  end

  def make_grid
  	slots = []
  	for w in 0...6
  		slots[w] = []
  	  for h in 0...7
  	  	slots[w][h] = " "
  	  end
  	end
  	@slots = slots
  end
end