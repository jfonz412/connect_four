=begin

In retrospect I probably should of just created some 2d arrays 
and manually filled them in with each winning condition. This would of
(massively) cut down on the amount of items I had to create.

Probably could of used mocks/doubles also, but I wasn't sure how it would
apply in this case, as I needed the 7x6 grid more than the object, the 
object was just a means to access an already created grid with a method
to update it as I please. 

=end

require 'win_checker'
require 'grid'

describe WinChecker do
  describe ".check_for_win" do

  	
  	let(:piece) { "o" }
  	let(:other_piece) { "x" }

    context "empty grid" do
 
      let(:empty_grid) {Grid.new}

      it "will return false" do
        expect(subject.check_for_win(empty_grid.slots, piece)).to be false
      end
    end

    context "no win pattern" do

      let(:losing_grid) {Grid.new}
      before do
        3.times { losing_grid.update_grid(1,piece) }
        2.times { losing_grid.update_grid(2,piece) }
        2.times { losing_grid.update_grid(1,other_piece) }
      end

      it "will return false" do
        expect(subject.check_for_win(losing_grid.slots, piece)).to be false
      end
    end

    context "up/down win pattern present" do

  	  let(:up_down_grid1) {Grid.new}
  	  let(:up_down_grid2) {Grid.new}
      before do
        4.times { up_down_grid1.update_grid(1,piece) }
        4.times { up_down_grid2.update_grid(2,piece) }
      end

      it "will return true" do
        expect(subject.check_for_win(up_down_grid1.slots, piece)).to be true
        expect(subject.check_for_win(up_down_grid2.slots, piece)).to be true
      end
    end
    
    context "left/right win pattern present" do

      let(:left_right_grid) {Grid.new}
      before do
        n = 1
        4.times do
      	  left_right_grid.update_grid(n,piece)
      	  n += 1
        end
      end 

      it "will return true" do
      	expect(subject.check_for_win(left_right_grid.slots,piece)).to be true
      end
    end

    context "diagnal win pattern present" do

      let(:diagnal_grid1) {Grid.new}
      before do
      	diagnal_grid1.update_grid(1,piece)
      	diagnal_grid1.update_grid(2,other_piece)
      	diagnal_grid1.update_grid(2,piece)
      	3.times { diagnal_grid1.update_grid(3,piece) }
      	diagnal_grid1.update_grid(4,other_piece)
      	3.times { diagnal_grid1.update_grid(4,piece) }
      end

      let(:diagnal_grid2) {Grid.new}
      before do
        3.times do 
          diagnal_grid2.update_grid(3,other_piece) 
          diagnal_grid2.update_grid(3,piece)
          diagnal_grid2.update_grid(6,piece)
        end

        2.times do 
          diagnal_grid2.update_grid(4,piece) 
          diagnal_grid2.update_grid(4,other_piece)

          diagnal_grid2.update_grid(5,other_piece) 
          diagnal_grid2.update_grid(5,piece)
        end
        diagnal_grid2.update_grid(4,piece)



      end

      it "will return true" do
      	expect(subject.check_for_win(diagnal_grid1.slots,piece)).to be true
      	expect(subject.check_for_win(diagnal_grid2.slots,piece)).to be true
      end
    end

    context "board full, no win patterns" do

      let(:tie_board) { Grid.new }
      before do
      	6.times do
      	  n = 1
      	  7.times do
            tie_board.update_grid(n,other_piece)
            n += 1
          end
        end
      end

      it "will return true" do
      	expect(subject.check_for_win(tie_board.slots,piece)).to be true
      end
    end
 end
end