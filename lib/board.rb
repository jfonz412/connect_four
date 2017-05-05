class Board
  def initialize
  	@back_row_drawn = false # ensure's back wall is only added once
  end

  public
  def draw_slots(slots)
  	p " 1 2 3 4 5 6 7 " 

    slots.each do |row|
      #adds back "wall" to row 7 one time
      row << '|' if @back_row_drawn == false
      row = row.join
      p row
    end
    @back_row_drawn = true
    
    o = "\u{203e}" # "over-score"
    p o+o+o+o+o+o+o+o+o+o+o+o+o+o+o # Draws the "floor" of the grid
  end
end